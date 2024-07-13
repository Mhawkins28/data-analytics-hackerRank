-- (Medium, advanced Select)
/* 
Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.

where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

OCCUPATIONS Table 

name | occupation
-----------------

*/

-- QUERY 1: get all names (order a-z) and occupations --> concat entire name + (1 position of occ string)

SELECT CONCAT(name, '(', LEFT(occupation, 1), ')')
FROM occupations
ORDER BY name;

-- QUERY 2: get count of occupations --> CONCAT ... + COUNT of occs + name of occ (all lowercase). 
-- group by occ, in ^ order and by occ name a-z

SELECT CONCAT('There are a total of ', COUNT(occupation), ' ', LOWER(occupation), 's.') 
FROM occupations
GROUP BY occupation
ORDER BY COUNT(*) ASC, LOWER(occupation);