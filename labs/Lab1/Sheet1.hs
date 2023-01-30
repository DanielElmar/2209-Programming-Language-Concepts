import Data.List
import Control.Exception
import System.IO
import System.Environment (getArgs)

zipL :: ([a],[a]) -> [[a]]

zipL ([],[]) = []
zipL ((x:xs),(y:ys)) = [x,y] : zipL (xs,ys)


unzipL :: [[a]] -> ([a],[a])

unzipL [] = ([],[])
unzipL ([x,y]:zs) = (x:xs,y:ys)
                   where (xs,ys) = unzipL zs



zipL' :: [Int] -> [Int] -> [[Int]]
zipL' [] []  =  []
zipL' (x:xs) [] = [x] : zipL' xs []
zipL' [] (y:ys) = [y] : zipL' [] ys
zipL' (x:xs) (y:ys)  = [x,y] : zipL' xs ys



multiZipL :: [[a]] -> [[a]]

multiZipL [] = []
multiZipL ([]:lss) = multiZipL lss
multiZipL ((l:ls):lss) = (l : [x | (x:_) <- lss]) : multiZipL ( ls : [ y | (_:y) <- lss] )


splitOn :: Char -> String -> [String]
splitOn c [] = []
splitOn c ls = (takeWhile (/=c) ls) : splitOn' c (dropWhile (/=c) ls)
 where splitOn' c [] = []
       splitOn' c (x:[]) | x==c = [[]]
       splitOn' c (x:xs) | x==c = splitOn c xs
                         | otherwise = []


multiZipF :: String -> String -> IO ()

multiZipF readFileString writeFileString =
    do rf <- readFile readFileString
       let listOfLines = lines(rf)
       let listOfListsOfInts = map (splitOn ',') listOfLines
       let parsedListOfLoistsOfInts = map (map read) listOfListsOfInts :: [[Int]]
       let listResult = multiZipL parsedListOfLoistsOfInts
       let listOfStringResult = map (map show) listResult
       let css = intercalate "\n" (map (intercalate ",") listOfStringResult)
       writeFile writeFileString css





main :: IO ()
main = do (fileName1 : fileName2 : _ ) <- getArgs
          catch (multiZipF fileName1 fileName2)
              (\e -> do let err = show (e :: IOException)
                        hPutStr stderr ("Warning: Couldn't open: " ++ err))
