/* 
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.


+-------------+------------+
| Field       |   Type     |
+-------------+------------+
| ID          | INTEGER    |
| CITY        | VARCHAR(21)|
| STATE       | VARCHAR(2) |
| LAT_N       | NUMERIC    |
| LONG_W      | NUMERIC    |
+-------------+------------+ */


SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '[aeiou]$';



/* REGEXP:
 $ - indicates that the pattern should match the end of the string. 
 
 note, I originally thought I had to make this case sensitve, but the default is non-sensitive. For case-sensative pattern matching, use the REGEXP BINARY operator.
 */