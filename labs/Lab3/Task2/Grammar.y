{ 
module Grammar where
import Tokens
}

%name parseCalc 
%tokentype { Token }
%error { parseError }
%token 
    let { TokenLet p }
    in  { TokenIn p }
    int { TokenInt p $$ }
    var { TokenVar p $$ }
    '=' { TokenEq p }
    '+' { TokenPlus p }
    '-' { TokenMinus p }
    '*' { TokenTimes p }
    '/' { TokenDiv p }
    '(' { TokenLParen p }
    ')' { TokenRParen  p}
    '^' { TokenExpo p }

%right in 
%left '+' '-' '^'
%left '*' '/' 
%left NEG 
%% 
Exp : let var '=' Exp in Exp { Let $2 $4 $6 } 
    | Exp '+' Exp            { Plus $1 $3 } 
    | Exp '-' Exp            { Minus $1 $3 } 
    | Exp '*' Exp            { Times $1 $3 } 
    | Exp '/' Exp            { Div $1 $3 }
    | Exp '^' Exp            { Expo $1 $3 }
    | '(' Exp ')'            { $2 } 
    | '-' Exp %prec NEG      { Negate $2 } 
    | int                    { Int $1 } 
    | var                    { Var $1 } 
    
{ 
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error"
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))




data Exp = Let String Exp Exp 
         | Plus Exp Exp 
         | Minus Exp Exp 
         | Times Exp Exp 
         | Div Exp Exp
         | Expo Exp Exp
         | Negate Exp
         | Int Int 
         | Var String 
         deriving Show 
} 