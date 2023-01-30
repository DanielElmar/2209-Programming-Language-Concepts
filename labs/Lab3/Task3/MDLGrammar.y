{ 
module MDLGrammar where
import MDLTokens
}

%name parseMDL
%tokentype { MDLToken }
%error { parseError }
%token 
    forward  { TokenForward p }
    digit    { TokenDigit p $$ }
    int      { TokenInt p $$ }
    l        { TokenLeft p }
    r        { TokenRight p }
    rotate   { TokenRotate p }
    obstacle { TokenObstacle p }
    if       { TokenIf p }
    then     { TokenThen p }
    else     { TokenElse p }
    '('      { TokenLParen p }
    ')'      { TokenRParen  p}
    ';'      { TokenSeq p }

%right then
%right else
%right ';'
%left 'forward'
%left 'rotate'
%% 
Exp : if Exp then Exp else Exp { If $2 $4 $6 }
    | forward int                { Forward $2 }
    | forward digit              { Forward $2 }
    | rotate Direction           { Rotate $2 }
    | obstacle digit             { Obstacle $2 }
    | Exp ';' Exp                { Seq $1 $3 }
    | '(' Exp ')'                { $2 }

Direction : l { LeftDir }
          | r { RightDir }
{ 
parseError :: [MDLToken] -> a
parseError [] = error "Unknown Parse Error"
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data Direction = LeftDir | RightDir deriving Show
data Exp = If Exp Exp Exp
         | Forward Int
         | Rotate Direction
         | Obstacle Int
         | Seq Exp Exp
         deriving Show 
} 