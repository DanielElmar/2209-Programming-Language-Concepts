import OurLanGrammar
import OurLanTokens
import System.Environment
import Control.Exception
import System.IO

-- Run ghc OurLanTest.hs to compile
-- Run OurLanTests.exe [test files] to exec

main :: IO ()
main = catch main' noLex
       where main' = do (fileName : _ ) <- getArgs
                        sourceText <- readFile fileName
                        interpret (lines sourceText)
                        return ()

interpret :: [String] -> IO ()
interpret [] = do return ()
interpret (ln:lns) = do putStrLn ("\n\nLexing : " ++ ln)
                        let lexedProg = alexScanTokens ln
                        putStrLn ("Lexed as " ++ (show lexedProg))
                        putStrLn ("Parsing : ")
                        let parsedProg = parseOurLan lexedProg
                        putStrLn ("Parsed as " ++ (show parsedProg))
                        interpret lns
                        return ()

noLex :: ErrorCall -> IO ()
noLex e = do let err =  show e
             hPutStr stderr ( err )
             return ()
