import System.IO

countEqualNumbers :: [Int] -> Int
countEqualNumbers sequence = length $ filter (\(x, y) -> x == y) $ zip sequence (tail sequence)

main :: IO ()
main = do
    putStrLn "Enter the number of elements: "
    n <- readLn :: IO Int
    putStrLn "Enter the elements: "
    sequence <- replicateM n readLn :: IO [Int]
    let result = countEqualNumbers sequence
    putStrLn $ "Output: " ++ show result