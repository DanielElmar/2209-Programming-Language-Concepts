{
module OurLanTokens where
}

%wrapper "posn"

$digit = 0-9
$alpha = [a-zA-Z]

@iri  = "<" [$printable # [\< \>]]*">"
@fileName = \" [$printable # [\. \" \']]+ .ttl \"
@varRef = "$" [$printable # [\. \" \' \$ \ $white \( \) \< \>]]*

tokens :-
    $white+ ;
    "--".* ;

    REPLACE {\p s -> TokenReplace p}
    WITH {\p s -> TokenWith p}
    FILE {\p s -> TokenFile p}
    WHERE {\p s -> TokenWhere p}

    SUBJ {\p s -> TokenSubj p}
    PRED {\p s -> TokenPred p}
    OBJ {\p s -> TokenObj p}

    @fileName {\ p s -> TokenFileName p (filter (\c -> c /= '"') s )}

    "." {\p s -> TokenDot p}
    "," {\p s -> TokenComma p}
    "-" {\p s -> TokenNeg p}

    "GT" {\p s ->  TokenGreaterThan p }
    "LT" {\p s -> TokenLessThan p }
    "ADD" {\p s -> TokenAdd p}
    "TO" {\p s -> TokenTo p}
    \== {\p s ->  TokenEqual p }
    \= {\p s -> TokenVarEqual p }
    @varRef {\p s -> TokenVar p (filter (\c -> c /= '$') s )}
    "AND" {\p s -> TokenAnd p }
    "OR" {\p s ->  TokenOr p }
    "NOT" {\p s -> TokenNot p }

    true {\p s -> TokenTrue p}
    false {\p s -> TokenFalse p }
    $digit+ {\p s -> TokenInt p (read s)}
    $alpha [$alpha $digit \_ \â€™]*   {  \p s -> TokenString p s }
    \* {\p s -> TokenStar p}
    "$" {\p s -> TokenDollar p}

    @iri  {\p s -> TokenIRI p (filter (\t -> t/='>' && t/='<') s) }

    \> {\p s -> TokenAngleBracketClose p}
    \< {\p s -> TokenAngleBracketOpen p}

    \) {\p s -> TokenRoundBracketClose p}
    \( {\p s -> TokenRoundBracketOpen p}


{
-- breaks up the token to allow for the action to have type :: AlexPosn -> String -> Token
-- the token type:

data OurLanToken = TokenReplace AlexPosn |
                 TokenWith AlexPosn |
                 TokenFile AlexPosn |
                 TokenWhere AlexPosn |
                 TokenFileName AlexPosn String|
                 TokenGreaterThan AlexPosn |
                 TokenLessThan AlexPosn |
                 TokenEqual AlexPosn |
                 TokenVarEqual AlexPosn |
                 TokenVar AlexPosn String |
                 TokenDot AlexPosn |
                 TokenAnd AlexPosn |
                 TokenOr AlexPosn |
                 TokenNot AlexPosn |
                 TokenInt AlexPosn Int |
                 TokenString AlexPosn String|
                 TokenStar AlexPosn |
                 TokenTrue AlexPosn |
                 TokenFalse AlexPosn |
                 TokenIRI AlexPosn String |
                 TokenAdd AlexPosn |
                 TokenTo AlexPosn |
                 TokenSubj AlexPosn |
                 TokenPred AlexPosn |
                 TokenObj AlexPosn |
                 TokenComma AlexPosn |
                 TokenNeg AlexPosn |
                 TokenDollar AlexPosn |
                 TokenAngleBracketClose AlexPosn |
                 TokenAngleBracketOpen AlexPosn |
                 TokenRoundBracketClose AlexPosn |
                 TokenRoundBracketOpen AlexPosn deriving (Show)

token_posn :: OurLanToken -> String
token_posn (TokenReplace (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenWith (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenFile (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenWhere (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenFileName (AlexPn _ l c) _ ) = show l ++ ":" ++ show c
token_posn (TokenGreaterThan (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenLessThan (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenEqual (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenVarEqual (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenVar (AlexPn _ l c) _) = show l ++ ":" ++ show c
token_posn (TokenDot (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenAnd (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenOr (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenNot (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenInt (AlexPn _ l c) _) = show l ++ ":" ++ show c
token_posn (TokenString (AlexPn _ l c) _) = show l ++ ":" ++ show c
token_posn (TokenStar (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenTrue (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenFalse (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenIRI (AlexPn _ l c) _) = show l ++ ":" ++ show c
token_posn (TokenAdd (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenTo (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenSubj (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenPred (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenObj (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenComma (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenNeg (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenDollar (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenAngleBracketClose (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenAngleBracketOpen (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenRoundBracketClose (AlexPn _ l c)) = show l ++ ":" ++ show c
token_posn (TokenRoundBracketOpen (AlexPn _ l c)) = show l ++ ":" ++ show c

}
