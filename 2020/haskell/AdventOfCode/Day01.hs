module AdventOfCode.Day01 where

import Data.List (intersect)

input :: IO [Integer]
input = do
    file <- readFile "../input/01"
    return $ map (\l -> read l :: Integer) $ lines file


part1 :: IO Integer
part1 = do
    ns <- input
    return $ head $ [x * y | x <- ns, y <- ns, x + y == 2020]

part1alt :: IO Integer
part1alt = do
    ns <- input
    let r = map ((-) 2020) ns
    let [a, b] = r `intersect` ns
    return $ a * b

part2 :: IO Integer
part2 = do
    ns <- input
    return $ head $ [x * y * z | x <- ns, y <- ns, z <- ns, x + y + z == 2020]
