-- medium, basic join
/*
The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of 0 from your result.

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.


Submissions: The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, challenge_id is the id of the challenge for which the submission belongs to, and score is the score of the submission.

*/

SELECT m.hacker_id, h.name, SUM(score) AS total_score
FROM (
    SELECT hacker_id, challenge_id, MAX(score) AS score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
) AS m
JOIN Hackers AS h ON m.hacker_id = h.hacker_id
GROUP BY m.hacker_id, h.name
HAVING total_score > 0
ORDER BY total_score DESC, m.hacker_id;

-- This query did not run as correct on HR, but not sure why yet.

WITH MaxScores AS (
    SELECT hacker_id, challenge_id, MAX(score) AS score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
)
SELECT h.hacker_id, h.name, SUM(ms.score) AS total_score
FROM MaxScores ms
JOIN Hackers h ON ms.hacker_id = h.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(ms.score) > 0
ORDER BY total_score DESC, h.hacker_id;
