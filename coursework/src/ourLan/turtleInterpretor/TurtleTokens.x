{
module TurtleTokens where
}

%wrapper "posn"

$digit    = [0-9]
@iri      = "<" [$printable # [\< \>]]* ">"
@string   = \" ($printable # \")* \"


tokens :-
    $white+       ;
    "#".*         ;
    "@prefix"     {\p s -> PrefixTok p}
    "@base"       {\p s -> BaseTok p}
    @iri          {\p s -> IRITok p (filter (\t -> t/='>' && t/='<') s)}
    true          {\p s -> TrueTok p}
    false         {\p s -> FalseTok p}
    @string       {\p s -> StringLiteralTok p (filter (/='"') s)}
    $digit+       {\p s -> IntTok p (read s)}
    "-"           {\p s -> NegTok p}
    "+"           {\p s -> PosTok p}
    ":"           {\p s -> ColonTok p}
    ";"           {\p s -> PredList p}
    "."           {\p s -> EndTriple p}
    ","           {\p s -> ObjList p}
    [a-zA-Z]+     {\p s -> NameTok p s}

{
data TurtleToks = PrefixTok AlexPosn |
                  BaseTok AlexPosn |
                  IRITok AlexPosn String |
                  EndTriple AlexPosn |
                  ObjList AlexPosn |
                  PredList AlexPosn |
                  ColonTok AlexPosn |
                  TrueTok AlexPosn |
                  FalseTok AlexPosn |
                  NameTok AlexPosn String |
                  StringLiteralTok AlexPosn String |
                  IntTok AlexPosn Int |
                  NegTok AlexPosn |
                  PosTok AlexPosn deriving (Show)

}
