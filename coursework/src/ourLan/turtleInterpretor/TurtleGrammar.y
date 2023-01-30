{
module TurtleGrammar where
import TurtleTokens
}

%name parseTurtle
%tokentype {TurtleToks}
%error {turtleError}

%token
  pref {PrefixTok _}
  base {BaseTok _}
  iri {IRITok _ $$}
  '.' {EndTriple _}
  ',' {ObjList _}
  ';' {PredList _}
  ':' {ColonTok _}
  neg {NegTok _}
  pos {PosTok _}
  true {TrueTok _}
  false {FalseTok _}
  name {NameTok _ $$}
  str {StringLiteralTok _ $$}
  int {IntTok _ $$}

%left base pref name '.' ':'
%left ';'
%left iri str int true false
%left pos neg
%left SIGN

%%

ComponentsList : ComponentsList Component   { $2 : $1}
               | Component                  { [$1] }

Component : StatementSeq    { StSq $1 }
          | Directive '.'      {Dir $1}

Directive : pref name ':' Type   { Prefix $2 $4 }
          | base Type            { Base $2 }

StatementSeq : Statement '.' StatementSeq   { [$1] ++ $3 }
             | Statement '.'                { [$1] }
             | Statement ';' PList '.'      { $1 : [ deconstructPreds $1 pl | pl <- $3 ] }
             | Statement ',' OList '.'      { $1 : [ deconstructObjs $1 pl | pl <- $3 ] }

Statement : Type Type Type      { St $1 $2 $3 }

PList : Preds ';' PList                     { [$1] ++ $3 }
      | Preds                               { [$1] }

OList : Objs ',' OList                      { [$1] ++ $3 }
      | Objs                                { [$1] }

Preds : Type Type       { P $1 $2 }

Objs : Type      { O $1 }

Type : iri   {IRI $1 }
     | str {StringType $1}
     | pos int %prec SIGN {IntType $2}
     | neg int %prec SIGN {IntType ($2 * (-1))}
     | int {IntType $1}
     | true {BoolType True}
     | false {BoolType False}
     | name ':' name {NameType $1 (StringType $3)}



{

turtleError :: [TurtleToks] -> a
turtleError ts = error (show ts)

data Component = Dir Directive | StSq [Statement] deriving (Show)

data Directive = Base TurtleType
               | Prefix String TurtleType deriving (Show)

data Statement = St TurtleType TurtleType TurtleType deriving (Show)

data PList = P TurtleType TurtleType

data OList = O TurtleType

data TurtleType = IRI String
          | IntType Int
          | StringType String
          | BoolType Bool
          | NameType String TurtleType deriving (Show)

deconstructPreds :: Statement -> PList -> Statement
deconstructPreds st (P obj pr ) = St (getSubj st) obj pr


deconstructObjs :: Statement -> OList -> Statement
deconstructObjs st (O obj ) = St (fst (getSubjPred st)) (snd (getSubjPred st)) obj

getSubj :: Statement -> TurtleType
getSubj (St x _ _) = x

getSubjPred :: Statement -> (TurtleType, TurtleType)
getSubjPred (St x y _) = (x,y)



parseTurtleFile :: String -> IO ([Statement])
parseTurtleFile fname = do s <- readFile fname
                           let comps = ((parseTurtle (alexScanTokens s)))
                           return (parseLine comps)

parseLine :: [Component] -> [Statement]
parseLine comps = parseDirectives (getDirectives comps) (getStatements comps) where

getDirectives :: [Component] -> [Directive]
getDirectives [] = []
getDirectives ((Dir d):cs) = d : getDirectives cs
getDirectives (_:cs) = getDirectives cs

getStatements :: [Component] -> [Statement]
getStatements [] = []
getStatements ((StSq d):cs) = d ++ (getStatements cs)
getStatements (_:cs) = getStatements cs

parseDirectives :: [Directive] -> [Statement] -> [Statement]
parseDirectives ds [] = []
parseDirectives ds ((St i1 i2 i3):sts) = (St (substituteDirectives ds i1) (substituteDirectives ds i2) (substituteDirectives ds i3)) : (parseDirectives ds sts)

substituteDirectives :: [Directive] -> TurtleType -> TurtleType
substituteDirectives ds t = substituteBase ds (substitutePrefix ds t)

substitutePrefix :: [Directive] -> TurtleType -> TurtleType
substitutePrefix [] t = t
substitutePrefix ((Prefix pName (IRI iriPrefix)):ds) (NameType pre (StringType s)) | pName == pre = (substitutePrefix ds (IRI (iriPrefix ++ s)))
                                                                             | otherwise = (substitutePrefix ds (NameType pre (StringType s)))
substitutePrefix (_:ds) t = substitutePrefix ds t

substituteBase :: [Directive] -> TurtleType -> TurtleType
substituteBase [] t = t
substituteBase ((Base (IRI i)):ds) (IRI s) | elem '.' s = (substituteBase ds (IRI s))
                                     | otherwise = (substituteBase ds (IRI (i ++ s)))
substituteBase (_:ds) t = substituteBase ds t

}
