{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -Wno-overlapping-patterns #-}
import OurLanGrammar
import OurLanTokens
import TurtleGrammar
import TurtleTokens
import System.Environment
import Control.Exception
import System.IO
import Data.List (sortOn)
import Data.List (nub)

data Variable = DataVar String [Triplet] deriving (Show)
data LoadedFile = LoadedFile String [Triplet] deriving (Show)

main :: IO ()
main = catch main' noInterpret
       where main' = do (fileName : _ ) <- getArgs
                        sourceText <- readFile fileName
                        vs <- interpretByLine (lines sourceText) []
                        return ()

readFiles :: String -> IO(String)
readFiles fileName = do sourceText <- readFile fileName
                        return (sourceText)


noInterpret :: ErrorCall -> IO ()
noInterpret e = do let err =  show e
                   hPutStr stderr ( "Interpret Error Caught at: " ++ err )
                   return ()

noFileRead :: ErrorCall -> IO ()
noFileRead e = do let err =  show e
                  hPutStr stderr ( "Error Caught" ++ err )
                  return ()


interpretByLine :: [String] -> [Variable] -> IO ([Variable])
interpretByLine [] vs = do return (vs)
interpretByLine (ln:lns) vs = do let lexedProg = OurLanTokens.alexScanTokens ln
                                 loadedFiles <- loadFiles lexedProg []
                                 let parsedProg = parseOurLan lexedProg
                                 vs' <- interpret parsedProg vs loadedFiles
                                 vs'' <- interpretByLine lns vs'
                                 return (vs'')
interpretByLine _ _ = error "Could not compile. Possible incompatible input types."

loadFiles :: [OurLanToken] -> [LoadedFile] -> IO [LoadedFile]
loadFiles [] fs = do return fs
loadFiles ((TokenFileName _ fName):tks) fs = do stmts <- parseTurtleFile fName
                                                let f = LoadedFile fName (tripConvert stmts)
                                                next <- loadFiles tks (f : fs)
                                                return (next)
loadFiles (_:tks) fs = do next <- loadFiles tks fs
                          return (next)
loadFiles _ _ = error "Incompatible Input types in method loadFiles."

tripConvert :: [Statement] -> [Triplet]
tripConvert [] = []
tripConvert ((St a b c):sts) = (Trip (typeConv a) (typeConv b) (typeConv c)) : tripConvert sts where
  typeConv :: TurtleType -> Type
  typeConv (IRI s) = Iri s
  typeConv (IntType i) = TInt i
  typeConv (StringType s) = TString s
  typeConv (BoolType b) = TBool b
tripConvert _ = error "Incompatible Input list of triplets in method tripConvert."

interpret :: Ops -> [Variable] -> [LoadedFile] -> IO ([Variable])
interpret (DefVar (Var s d)) vs fs = do return ((DataVar s (parseData d vs fs)) : vs)
interpret (Output d) vs fs = do outputTriplets (parseData d vs fs)
                                return (vs)
interpret _ _ _ = error "Incompatible Input types in method interpret."

outputTriplets :: [Triplet] -> IO()
outputTriplets ts = printTriplets (sortOn (subj) (sortOn (prd) (sortObjs (obj) (nub ts)))) where
  subj (Trip a b c) = show a
  prd (Trip a b c) = show b
  obj (Trip a b c) = show c
outputTriplets _ = error "Input list of triplets is Incompatible in method outputTriplets."

sortObjs :: (Triplet -> String) -> [Triplet] -> [Triplet]
sortObjs showObj ts = (sortOn (showObj) [ t | t@(Trip a b (Iri _)) <- ts ]) ++ (sortOn (showObj) [ t | t@(Trip a b (TInt _)) <- ts ]) ++ (sortOn (showObj) [ t | t@(Trip a b (TBool _)) <- ts ]) ++ (sortOn (showObj) [ t | t@(Trip a b (TString _)) <- ts ])
sortObjs _ _ = error "Incompatible Input types in method sortObjs."

printTriplets :: [Triplet] -> IO ()
printTriplets [] = do return ()
printTriplets (t:ts) = do putStrLn(show t)
                          printTriplets ts
                          return ()
printTriplets _ = error "Input list of triplets is Incompatible in method printTriplets."


parseData :: Data -> [Variable] -> [LoadedFile] -> [Triplet]
parseData (FileName file) vs fs = parseFile file fs
parseData (Predicate dat pred) vars files = parsePredicates (parseData dat vars files) pred vars files
parseData (T trip) vs fs = [trip]
parseData (Dot d1 d2) vs fs = (parseData d1 vs fs) ++ (parseData d2 vs fs)
parseData (Replace d t1 t2 t3) vs fs = parseReplace (parseData d vs fs) t1 t2 t3 []
parseData (Add i d) vs fs = map (add i) (parseData d vs fs)
parseData (FromVar varName) vs fs = concat [ d | (DataVar s d) <- vs, s == varName]
parseData _ _ _ = error "Incompatible Input types in method parseData."


parseFile :: String -> [LoadedFile] -> [Triplet]
parseFile fname fs = concat [trips | (LoadedFile name trips) <- fs, name == fname]
parseFile  _ _ = error "Incompatible Input types in method parseFile."

add :: Int -> Triplet -> Triplet
add i (Trip a b (TInt c)) = Trip a b (TInt (c+i))
add i t = t
add _ _ = error "Incompatible Input types in method add."

parsePredicates :: [Triplet] -> Pred -> [Variable] -> [LoadedFile] -> [Triplet]
parsePredicates trips (PredF fst snd trd ) vs fs = (parsePredFtrd (parsePredFsnd (parsePredFfst trips fst vs fs ) snd vs fs ) trd vs fs )
parsePredicates trips (PredN pred) vs fs = filter (\t -> not (elem t dontInclude)) trips
                                          where dontInclude = (parsePredicates trips pred vs fs)
parsePredicates trips (PredA pred1 pred2) vs fs = parsePredicates (parsePredicates trips pred1 vs fs) pred2 vs fs
parsePredicates trips (PredO pred1 pred2) vs fs = matchPred1 ++ matchPred2
                                                where matchPred1 = (parsePredicates trips pred1 vs fs)
                                                      matchPred2 = (parsePredicates trips pred2 vs fs)
parsePredicates _ _ _ _ = error "Incompatible Input types in method parsePredicates."

parsePredFfst :: [Triplet] -> Filter -> [Variable] -> [LoadedFile] -> [Triplet]
parsePredFfst trips Any vs fs = trips
parsePredFfst trips (Single Eq matchMe) vs fs = filter (\(Trip fst snd trd) -> fst == matchMe) trips
parsePredFfst trips (Single Lt matchMe) vs fs = filter (\(Trip fst snd trd) -> fst < matchMe) trips
parsePredFfst trips (Single Gt matchMe) vs fs = filter (\(Trip fst snd trd) -> fst > matchMe) trips
parsePredFfst trips (FoundIn (TypeList matchMe)) vs fs = filter (\(Trip fst snd trd) -> elem fst matchMe) trips
parsePredFfst trips (FoundIn (ExtractFrom extract )) vs fs = filter (\(Trip fst snd trd) -> elem fst matchMe) trips
                                                            where matchMe = (extractToTypeList extract vs fs)
parsePredFfst _ _ _ _ = error "Incompatible Input types in method parsePredFfst."

{--
parsePredFfst trips (Single Eq (Iri string)) = filter (\(Trip fst snd trd) -> fst == string) trips
parsePredFfst trips (Single Eq (TString string)) = filter (\(Trip fst snd trd) -> fst == string) trips
parsePredFfst trips (Single Eq (TBool bool)) = filter (\(Trip fst snd trd) -> fst == bool) trips
parsePredFfst trips (Single Eq (TInt int)) = filter (\(Trip fst snd trd) -> fst == int) trips

parsePredFfst trips (Single Lt (Iri string)) = filter (\(Trip fst snd trd) -> fst < string) trips
parsePredFfst trips (Single Lt (TString string)) = filter (\(Trip fst snd trd) -> fst < string) trips
parsePredFfst trips (Single Lt (TBool bool)) = filter (\(Trip fst snd trd) -> fst < bool) trips
parsePredFfst trips (Single Lt (TInt int)) = filter (\(Trip fst snd trd) -> fst < int) trips

parsePredFfst trips (Single Gt (Iri string)) = filter (\(Trip fst snd trd) -> fst > string) trips
parsePredFfst trips (Single Gt (TString string)) = filter (\(Trip fst snd trd) -> fst > string) trips
parsePredFfst trips (Single Gt (TBool bool)) = filter (\(Trip fst snd trd) -> fst > bool) trips
parsePredFfst trips (Single Gt (TInt int)) = filter (\(Trip fst snd trd) -> fst > int) trips
--}


parsePredFsnd :: [Triplet] -> Filter -> [Variable] -> [LoadedFile] -> [Triplet]
parsePredFsnd trips Any vs fs = trips
parsePredFsnd trips (Single Eq matchMe) vs fs = filter (\(Trip fst snd trd) -> snd == matchMe) trips
parsePredFsnd trips (Single Lt matchMe) vs fs = filter (\(Trip fst snd trd) -> snd < matchMe) trips
parsePredFsnd trips (Single Gt matchMe) vs fs = filter (\(Trip fst snd trd) -> snd > matchMe) trips
parsePredFsnd trips (FoundIn (TypeList matchMe)) vs fs = filter (\(Trip fst snd trd) -> elem snd matchMe) trips
parsePredFsnd trips (FoundIn (ExtractFrom extract )) vs fs = filter (\(Trip fst snd trd) -> elem snd matchMe) trips
                                                            where matchMe = (extractToTypeList extract vs fs)
parsePredFsnd _ _ _ _ = error "Incompatible Input types in method parsePredFsnd."

{--
parsePredFsnd trips (Single Eq (Iri string)) = filter (\(Trip fst snd trd) -> snd == string) trips
parsePredFsnd trips (Single Eq (TString string)) = filter (\(Trip fst snd trd) -> snd == string) trips
parsePredFsnd trips (Single Eq (TBool bool)) = filter (\(Trip fst snd trd) -> snd == bool) trips
parsePredFsnd trips (Single Eq (TInt int)) = filter (\(Trip fst snd trd) -> snd == int) trips

parsePredFsnd trips (Single Lt (Iri string)) = filter (\(Trip fst snd trd) -> snd < string) trips
parsePredFsnd trips (Single Lt (TString string)) = filter (\(Trip fst snd trd) -> snd < string) trips
parsePredFsnd trips (Single Lt (TBool bool)) = filter (\(Trip fst snd trd) -> snd < bool) trips
parsePredFsnd trips (Single Lt (TInt int)) = filter (\(Trip fst snd trd) -> snd < int) trips

parsePredFsnd trips (Single Gt (Iri string)) = filter (\(Trip fst snd trd) -> snd > string) trips
parsePredFsnd trips (Single Gt (TString string)) = filter (\(Trip fst snd trd) -> snd > string) trips
parsePredFsnd trips (Single Gt (TBool bool)) = filter (\(Trip fst snd trd) -> snd > bool) trips
parsePredFsnd trips (Single Gt (TInt int)) = filter (\(Trip fst snd trd) -> snd > int) trips
--}


parsePredFtrd :: [Triplet] -> Filter -> [Variable] -> [LoadedFile] -> [Triplet]
parsePredFtrd trips Any vs fs = trips
parsePredFtrd trips (Single Eq matchMe) vs fs = filter (\(Trip fst snd trd) -> trd == matchMe) trips
parsePredFtrd trips (Single Lt (TInt matchMe)) vs fs = filter (\(Trip fst snd trd) -> trd < (TInt matchMe)) trips
parsePredFtrd trips (Single Gt (TInt matchMe)) vs fs = filter (\(Trip fst snd trd) -> trd > (TInt matchMe)) trips
parsePredFtrd trips (FoundIn (TypeList matchMe)) vs fs = filter (\(Trip fst snd trd) -> elem trd matchMe) trips
parsePredFtrd trips (FoundIn (ExtractFrom extract )) vs fs = filter (\(Trip fst snd trd) -> elem trd matchMe) trips
                                                            where matchMe = (extractToTypeList extract vs fs)
parsePredFtrd _ _ _ _ = []

parsePredFtrd _ _ _ _ = error "Incompatible Input types in method parsePredFtrd."

{--
parsePredFtrd trips (Single Eq (Iri string)) = filter (\(Trip fst snd trd) -> trd == string) trips
parsePredFtrd trips (Single Eq (TString string)) = filter (\(Trip fst snd trd) -> trd == string) trips
parsePredFtrd trips (Single Eq (TBool bool)) = filter (\(Trip fst snd trd) -> trd == bool) trips
parsePredFtrd trips (Single Eq (TInt int)) = filter (\(Trip fst snd trd) -> trd == int) trips

parsePredFtrd trips (Single Lt (Iri string)) = filter (\(Trip fst snd trd) -> trd < string) trips
parsePredFtrd trips (Single Lt (TString string)) = filter (\(Trip fst snd trd) -> trd < string) trips
parsePredFtrd trips (Single Lt (TBool bool)) = filter (\(Trip fst snd trd) -> trd < bool) trips
parsePredFtrd trips (Single Lt (TInt int)) = filter (\(Trip fst snd trd) -> trd < int) trips


parsePredFtrd trips (Single Gt (Iri string)) = filter (\(Trip fst snd trd) -> trd > string) trips
parsePredFtrd trips (Single Gt (TString string)) = filter (\(Trip fst snd trd) -> trd > string) trips
parsePredFtrd trips (Single Gt (TBool bool)) = filter (\(Trip fst snd trd) -> trd > bool) trips
parsePredFtrd trips (Single Gt (TInt int)) = filter (\(Trip fst snd trd) -> trd > int) trips
--}

extractToTypeList :: Extract -> [Variable] -> [LoadedFile] -> [Type]
extractToTypeList (Subj dat) vs fs = [ fst | (Trip fst snd trd) <- (parseData dat vs fs) ]
extractToTypeList (Pred dat) vs fs = [ snd | (Trip fst snd trd) <- (parseData dat vs fs) ]
extractToTypeList (Obj dat) vs fs = [ trd | (Trip fst snd trd) <- (parseData dat vs fs) ]
extractToTypeList _ _ _ = error "Incompatible Input types in method extractToTypeList."


--}

parseReplace :: [Triplet] -> Template -> Template -> Template -> [Triplet] -> [Triplet]
parseReplace [] _ _ _ acc = acc
parseReplace (Trip a1 a2 a3:xs) TemplateUnchanged TemplateUnchanged TemplateUnchanged acc = parseReplace xs TemplateUnchanged TemplateUnchanged TemplateUnchanged acc++ [Trip a1 a2 a3]
parseReplace (Trip a1 a2 a3:xs) TemplateUnchanged TemplateUnchanged (TemplateInsert t3) acc = parseReplace xs TemplateUnchanged TemplateUnchanged (TemplateInsert t3) acc++ [Trip a1 a2 t3]
parseReplace (Trip a1 a2 a3:xs) TemplateUnchanged (TemplateInsert t2) TemplateUnchanged acc = parseReplace xs TemplateUnchanged (TemplateInsert t2) TemplateUnchanged acc++ [Trip a1 t2 a3]
parseReplace (Trip a1 a2 a3:xs) (TemplateInsert t1) TemplateUnchanged TemplateUnchanged acc = parseReplace xs (TemplateInsert t1) TemplateUnchanged TemplateUnchanged  acc++ [Trip t1 a2 a3]
parseReplace (Trip a1 a2 a3:xs) TemplateUnchanged (TemplateInsert t2) (TemplateInsert t3) acc = parseReplace xs TemplateUnchanged (TemplateInsert t2) (TemplateInsert t3) acc++ [Trip a1 t2 t3]
parseReplace (Trip a1 a2 a3:xs) (TemplateInsert t1) TemplateUnchanged (TemplateInsert t3) acc = parseReplace xs (TemplateInsert t1) TemplateUnchanged (TemplateInsert t3) acc++ [Trip t1 a2 t3]
parseReplace (Trip a1 a2 a3:xs) (TemplateInsert t1) (TemplateInsert t2) TemplateUnchanged acc = parseReplace xs (TemplateInsert t1) (TemplateInsert t2) TemplateUnchanged acc++ [Trip t1 t2 a3]
parseReplace (Trip a1 a2 a3:xs) (TemplateInsert t1) (TemplateInsert t2) (TemplateInsert t3) acc = parseReplace xs (TemplateInsert t1) (TemplateInsert t2) (TemplateInsert t3) acc++ [Trip t1 t2 t3]
parseReplace _ _ _ _ _ = error "Incompatible Input types in method parseReplace."
