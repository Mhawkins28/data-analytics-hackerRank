/* Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

Input Format

The STATION table is described as follows:

+-------------+------------+
| Field       |   Type     |
+-------------+------------+
| ID          | INTEGER    |
| CITY        | VARCHAR(21)|
| STATE       | VARCHAR(2) |
| LAT_N       | NUMERIC    |
| LONG_W      | NUMERIC    |
+-------------+------------+
 */


SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[AEIOUaeiou]';

/*
REGEXP:
^  - Starts with
[] - looks for any occurrence of the contents

Note -This ran without DISTINCT, but for more accuracy to the prompt, I feel like distict is needed (?)
      
*/