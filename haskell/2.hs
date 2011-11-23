problem_2 =
	sum [x | x <- takeWhile (<= 1000000) fibs,
		even x]

	where
	fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

main = print problem_2