import MDLTokens
import MDLGrammar
import System.Environment
import Control.Exception
import System.IO



main :: IO ()
main = catch main' noLex
       where main' = do (fileName : _ ) <- getArgs
                        sourceText <- readFile fileName
                        putStrLn ("Parsing : " ++ sourceText)
                        let parsedProg = parseMDL (alexScanTokens sourceText)
                        putStrLn ("Parsed as " ++ (show parsedProg))


noLex :: ErrorCall -> IO ()
noLex e = do let err =  show e
             hPutStr stderr ("Problem with Lexing : " ++ err)
             return ()
