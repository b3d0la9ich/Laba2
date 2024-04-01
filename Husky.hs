countEqualNumbers :: [Int] -> Int
countEqualNumbers [] = 0
countEqualNumbers [_] = 0
countEqualNumbers (x:y:xs)
    | x == y = 1 + countEqualNumbers (y:xs)
    | otherwise = countEqualNumbers (y:xs)

main :: IO ()
main = do
    let sequence = [5, 12, 12, 23, 23, 23, 108]
    let result = countEqualNumbers sequence
    putStrLn $ "Output: " ++ show result