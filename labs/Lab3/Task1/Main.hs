import Tokens
import Grammar
import System.Environment
import Control.Exception
import System.IO



main :: IO ()
main = catch main' noLex
       where main' = do (fileName : _ ) <- getArgs
                        sourceText <- readFile fileName
                        putStrLn ("Lexing : " ++ sourceText)
                        let lexedProg = alexScanTokens sourceText
                        putStrLn ("Lexed as " ++ (show lexedProg))
                        putStrLn ("Parsing : ")
                        let parsedProg = parseCalc lexedProg
                        putStrLn ("Parsed as " ++ (show parsedProg))

noLex :: ErrorCall -> IO ()
noLex e = do let err =  show e
             hPutStr stderr ( err )
             return ()
