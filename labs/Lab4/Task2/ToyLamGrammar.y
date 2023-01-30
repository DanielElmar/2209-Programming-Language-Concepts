{ 
module ToyLamGrammar where
import ToyLamTokens
}

%name parseToyLam
%tokentype { ToyLamToken }
%error { parseError }
%token 
    lam  { TokenLambda p }
    var    { TokenVar p $$ }
    '->'      { TokenAbs p }
    ';'        { TokenSeq p }
    '('      { TokenLParen p }
    ')'      { TokenRParen  p}

     if       { TokenIf p }
     then     { TokenThen p }
     else     { TokenElse p }

     let        { TokenLet p }
     in         { TokenIn p }
     '='        { TokenEq p }

     digit      { TokenDigit p $$ }

     '<'        { TokenLessThan p }
     '+'        { TokenPlus p }

     true       { TokenTure p }
     false      { TokenFalse p }


%left var digit
%right then else in lam let if
%left '+' app
%right ';'
%nonassoc '<' '->' '(' ')' true false
%% 
Exp : digit                         { $1 }
    | true                          { True }
    | false                         { False }
    | Exp '<' Exp                   { LessThan $1 $3 }
    | Exp '+' Exp                   { Plus $1 $3 }
    | var                           { Var $1 }
    | if Exp then Exp else Exp      { If $2 $4 $6 }
    | lam var '->' Exp              { Lam $2 $4 }
    | let var '=' Exp in Exp        { Let $2 $4 $6 }
    | Exp Exp %prec app             { App $1 $2 }
    | Exp ';' Exp                   { Seq $1 $3 }
    | '(' Exp ')'                   { $2 }

{ 
parseError :: [ToyLamToken] -> a
parseError [] = error "Unknown Parse Error"
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data Exp =  int
         | True
         | False
         | LessThan Exp Exp
         | Plus Exp Exp
         | Var Sting
         | If Exp Exp Exp
         | Lam String Exp
         | Let String Exp Exp
         | App Exp Exp
         | Seq Exp Exp
         deriving Show 
} 