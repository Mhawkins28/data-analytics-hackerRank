-- Write a query to print all prime numbers less than or equal to . Print your result on a single line, and use the ampersand () character as your separator (instead of a space).


WITH RECURSIVE numbers AS (
  SELECT 2 AS n
  UNION ALL
  SELECT 1+n FROM numbers WHERE n<1000
), 
  
  
-- This Common Table Expression (CTE) generates a list of numbers starting from 2 up to 1000.
-- - Base case (SELECT 2 AS n): Initializes the sequence with the number 2.
-- - Recursive case (SELECT 1+n FROM numbers WHERE n < 1000): Continues to add 1 to the previous number, incrementing it until the value is less than 1000.  

  
  Primes AS(
   SELECT n
   FROM numbers
   WHERE NOT EXISTS(
         SELECT n2.n
           FROM numbers AS n2
          WHERE n2.n > 1 
            AND n2.n <= SQRT(numbers.n)
            AND numbers.n % n2.n = 0
   )
)

-- This CTE filters the numbers list to identify prime numbers.

-- SELECT n FROM numbers: Selects each number n from the numbers CTE.
-- WHERE NOT EXISTS: Ensures that no other number (n2) exists that can divide n evenly, indicating that n is prime.
-- SELECT n2.n FROM numbers AS n2 WHERE n2.n > 1 AND n2.n <= SQRT(numbers.n) AND numbers.n % n2.n = 0:
-- This subquery checks for the existence of a number n2 that divides n without a remainder.
-- n2.n > 1: Ensures that the divisor is greater than 1.
-- n2.n <= SQRT(numbers.n): Limits the check to divisors up to the square root of n for efficiency.
-- numbers.n % n2.n = 0: Checks if n is divisible by n2 without a remainder.
  
-- SELECT GROUP_CONCAT(Primes.n SEPARATOR '&')
-- FROM Primes;


SELECT GROUP_CONCAT(Primes.n SEPARATOR '&')
FROM Primes;



-- This final SELECT statement concatenates all the prime numbers found in the Primes CTE into a single string, separated by the ampersand (&) character.

-- GROUP_CONCAT(Primes.n SEPARATOR '&'): Aggregates the prime numbers into a single string with & as the separator.
-- FROM Primes: Indicates that the data for concatenation comes from the Primes CTE.
