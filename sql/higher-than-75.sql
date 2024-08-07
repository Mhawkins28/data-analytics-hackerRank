-- Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.


SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY SUBSTRING(Name, -3), ID;

-- substring is used to extract a portion of a string. In the context of the query provided, SUBSTRING(Name, -3) extracts the last three characters of the Name field. 
