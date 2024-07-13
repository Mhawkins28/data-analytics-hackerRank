-- (Medium, advanced Select)
/* 
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

OCCUPATIONS Table 

name | occupation
-----------------

*/

SELECT
    MAX(CASE WHEN occupation = 'Doctor' THEN name END) AS Doctor,
    MAX(CASE WHEN occupation = 'Professor' THEN name END) AS Professor,
    MAX(CASE WHEN occupation = 'Singer' THEN name END) AS Singer,
    MAX(CASE WHEN occupation = 'Actor' THEN name END) AS Actor
FROM (
    SELECT
        name,
        occupation,
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS row_num
    FROM occupations
) AS numbered
GROUP BY row_num
ORDER BY row_num;

/*
- The MAX() function in this context is used to aggregate the names for each occupation within each row_num.

- The CASE statements ensure that names are placed in the correct columns based on their occupation.

- Grouping by row_num aligns names from different occupations in the same row, effectively pivoting the data from a vertical format (rows) to a horizontal format (columns).

The subquery result might look like:

+----------+------------+---------+
|   name   | occupation | row_num |
+----------+------------+---------+
| Samantha | Doctor     |    1    |
| Sam      | Doctor     |    2    |
| Julia    | Actor      |    1    |
| Jul      | Singer     |    1    |
+----------+------------+---------+
The outer query would produce:

+----------+-----------+--------+-------+
| Doctor   | Professor | Singer | Actor |
+----------+-----------+--------+-------+
| Samantha | NULL      | Jul    | Julia |
| Sam      | NULL      | NULL   | NULL  |
+----------+-----------+--------+-------+


*/