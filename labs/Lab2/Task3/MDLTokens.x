{
module MDLTokens where
}

%wrapper "posn"
$digit = 0-9
-- digits

tokens :-
$white+       ;
  "--".*      ;
  forward              { \p s -> TokenForward p }
  [1-9]                { \p s -> TokenDigit p (read s) }
  $digit $digit+       { \p s -> TokenInt p (read s) }
  L                    { \p s -> TokenLeft p }
  R                    { \p s -> TokenRight p }
  rotate               { \p s -> TokenRotate p }
  obstacle             { \p s -> TokenObstacle  p }
  \==                  { \p s -> TokenEq p }
  \<                   { \p s -> TokenLessThan  p }
  \>                   { \p s -> TokenMoreThan  p }
  if                   { \p s -> TokenIf p }
  then                 { \p s -> TokenThen p }
  else                 { \p s -> TokenElse p }
  \;                   { \p s -> TokenSeq p }
  \(                   { \p s -> TokenLParen p }
  \)                   { \p s -> TokenRParen p }

{
-- Each action has type :: AlexPosn -> String -> MDLToken
-- The token type:
data MDLToken =
  TokenForward AlexPosn       |
  TokenDigit AlexPosn Int     |
  TokenInt AlexPosn Int       |
  TokenLeft AlexPosn          |
  TokenRight AlexPosn         |
  TokenRotate AlexPosn        |
  TokenObstacle AlexPosn      |
  TokenEq AlexPosn            |
  TokenLessThan AlexPosn      |
  TokenMoreThan AlexPosn      |
  TokenIf AlexPosn            |
  TokenThen AlexPosn          |
  TokenElse AlexPosn          |
  TokenSeq AlexPosn           |
  TokenLParen AlexPosn        |
  TokenRParen AlexPosn
    deriving (Eq,Show)


tokenPosn :: MDLToken -> String
tokenPosn (TokenForward (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRotate  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDigit  (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInt  (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenObstacle  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIf (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenThen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenElse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLeft (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRight (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSeq (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

}
