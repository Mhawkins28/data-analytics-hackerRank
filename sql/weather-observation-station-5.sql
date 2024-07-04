/* Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
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

SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY), CITY
LIMIT 1;

SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY
LIMIT 1;



/* Here’s why this works:

Shortest Name Query: ORDER BY LENGTH(CITY), CITY LIMIT 1

Orders by the length of the city name in ascending order (LENGTH(CITY)), so the shortest name comes first.
If there are ties (cities with the same length), it further orders alphabetically by city name (CITY).
LIMIT 1 ensures only one row (the city with the shortest name) is returned.

Longest Name Query: ORDER BY LENGTH(CITY) DESC, CITY LIMIT 1 

Orders by the length of the city name in descending order (LENGTH(CITY) DESC), so the longest name comes first.
Again, if there are ties in the length, it orders alphabetically by city name (CITY).
LIMIT 1 ensures only one row (the city with the longest name) is returned. */
