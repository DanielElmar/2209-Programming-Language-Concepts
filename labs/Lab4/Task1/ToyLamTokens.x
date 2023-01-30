{
module ToyLamTokens where
}

%wrapper "posn"
$digit = 0-9
-- digits
$alpha = [a-zA-Z]
-- alphabetic characters

tokens :-
$white+       ;
  "--".*      ;

  \\                   { \p s -> TokenLambda p }
  $alpha               { \s -> TokenVar p s }
  '->'                 { \p s -> TokenAbs}
  \;                   { \p s -> TokenSeq p }
  \(                   { \p s -> TokenLParen p }
  \)                   { \p s -> TokenRParen p }

  if                   { \p s -> TokenIf p }
  then                 { \p s -> TokenThen p }
  else                 { \p s -> TokenElse p }

  let                  { \p s -> TokenLet p }
  in                   { \p s -> TokenIn p }
  \=                   { \p s -> TokenEq p }

  $digit+              { \p s -> TokenInt p (read s) }

  \<                   { \p s TokenLessThan p }
  \+                   { \p s -> TokenPlus p }

  true                 { \p s -> TokenTrue p }
  false                { \p s -> TokenFalse p }


{
-- Each action has type :: AlexPosn -> String -> ToyLamTokens
-- The token type:
data ToyLamTokens =
  TokenLambda AlexPosn        |
  TokenVar AlexPosn String    |
  TokenAbs AlexPosn           |
  TokenSeq AlexPosn           |
  TokenLParen AlexPosn        |
  TokenRParen AlexPosn        |
  TokenIf AlexPosn            |
  TokenThen AlexPosn          |
  TokenElse AlexPosn          |
  TokenLet AlexPosn           |
  TokenIn AlexPosn            |
  TokenEq AlexPosn            |
  TokenInt AlexPosn Int       |
  TokenLessThan AlexPosn      |
  TokenPlus AlexPosn          |
  TokenTrue AlexPosn          |
  TokenFalse AlexPosn
    deriving (Eq,Show)


tokenPosn :: ToyLamTokens -> String
tokenPosn (TokenLambda (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenVar  (AlexPn a l c) s) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAbs  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSeq  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLParen  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIf (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenThen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenElse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLet (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIn (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEq (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInt (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPlus (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

}
