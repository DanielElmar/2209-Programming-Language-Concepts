{
module OurLanGrammar where
import OurLanTokens
}

%name parseOurLan
%tokentype { OurLanToken }
%error { parseError }

%token
    replace {TokenReplace p }
    with {TokenWith p }
    file {TokenFile p }
    where {TokenWhere p }
    fileName { TokenFileName p $$ }
    '.' { TokenDot p }
    ',' { TokenComma p}
    '-' {TokenNeg p}
    gt {TokenGreaterThan p }
    lt {TokenLessThan p }
    add {TokenAdd p}
    to {TokenTo p}
    '==' {TokenEqual p }
    '=' {TokenVarEqual p }
    var {TokenVar p $$}
    and {TokenAnd p }
    or {TokenOr p }
    not {TokenNot p }
    int {TokenInt p $$ }
    str {TokenString p $$ }
    star {TokenStar p }
    true {TokenTrue p }
    false {TokenFalse p }
    iri {TokenIRI p $$ }
    subj {TokenSubj p }
    pred {TokenPred p }
    obj {TokenObj p }
    '>' {TokenAngleBracketClose p }
    '<' {TokenAngleBracketOpen p }
    ')' {TokenRoundBracketClose p}
    '(' {TokenRoundBracketOpen p}


%right DUMMYRIGHT
%nonassoc '='
%left '.'
%left iri str int true false
%right file
%left file
%left '-'
%left NEG
%left SINGULAR
%left and or
%right with read replace not where add to
%left subj pred obj
%nonassoc  gt lt '=='

%%

Ops: Var {DefVar $1}
   | Data {Output $1}

Data:   Triplet %prec DUMMYRIGHT     {T $1 }
      | Data '.' Data            { Dot $1 $3 }
      | replace Data with Template Template Template { Replace $2 $4 $5 $6 }
      | add int to Data {Add $2 $4}
      | file fileName      { FileName $2 }
      | var {FromVar $1}
      | Data where Pred  { Predicate $1 $3 }
      | '(' Data ')' { $2 }

Pred: Pred1 and Pred           { PredA $1 $3 }
    | not Pred                 { PredN $2 }
    | Pred1 or Pred            { PredO $1 $3 }
    | Pred1 %prec SINGULAR     { $1 }
    | '(' Pred ')' { $2 }

Pred1: Filter Filter Filter { PredF $1 $2 $3 }

Filter: star {Any}
      | '==' ComponentList { FoundIn $2 }
      | Op Type { Single $1 $2 }

ComponentList: TypeList {TypeList $1}
             | Extract {ExtractFrom $1}

TypeList: TypeList ',' Type { $3 : $1 }
        | Type {[$1]}

Extract: subj Data  { Subj $2 }
       | pred Data  { Pred $2 }
       | obj Data   { Obj $2 }
       | '(' Extract ')' { $2 }

Op: '=='   { Eq }
  |  gt   { Gt }
  |  lt   { Lt }

Template: star { TemplateUnchanged }
        | Type { TemplateInsert $1 }

Type: iri        { Iri $1 }
    | str        { TString $1 }
    | '-' int %prec NEG { TInt ($2 * (-1))}
    | int        { TInt $1 }
    | true       { TBool True }
    | false      { TBool False }

Triplet: '<' Type '>' '<' Type '>' '<' Type '>'  {Trip $2 $5 $8}

Var: var '=' Data { Var $1 $3 }
{
parseError :: [OurLanToken] -> a
parseError ts = error ("Parse Error caught at: " ++ (show ts))

data Ops = DefVar Var
         | Output Data deriving (Show)

data Data = T Triplet
          | Dot Data Data
          | Replace Data Template Template Template
          | Add Int Data
          | FromVar String
          | FileName String
          | Predicate Data Pred deriving (Show)

data Template = TemplateUnchanged | TemplateInsert Type deriving (Show)

data Pred = PredF Filter Filter Filter
         | PredA Pred Pred
         | PredN Pred
         | PredO Pred Pred deriving (Show)

data Filter = Single Op Type | FoundIn ComponentList | Any deriving (Show)

data ComponentList = TypeList [Type] | ExtractFrom Extract deriving (Show)

data Extract = Subj Data | Pred Data | Obj Data deriving (Show)

data Op = Eq | Gt | Lt deriving (Show)

data Triplet = Trip Type Type Type deriving (Eq)

data Type = Iri String | TString String | TBool Bool | TInt Int deriving (Eq,Ord)

data Var = Var String Data deriving (Show)

instance Show Triplet where
  show (Trip a b c) = show a ++ show b ++ show c ++ " ."

instance Show Type where
  show (Iri s) = "<" ++ s ++ ">"
  show (TString s) = show s
  show (TBool True) = " true"
  show (TBool False) = " false"
  show (TInt i) = " " ++ show i
}
