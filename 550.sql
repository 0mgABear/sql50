--550. Game Play Analysis IV
WITH FL AS (
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
),
ND AS (
    SELECT f.player_id
    FROM FL f
    JOIN Activity a
    ON f.player_id = a.player_id
    WHERE DATEDIFF(a.event_date, f.first_login_date) = 1
)
SELECT ROUND(COUNT(DISTINCT ND.player_id) / COUNT(DISTINCT a.player_id), 2) AS fraction
FROM Activity a
LEFT JOIN ND ON a.player_id = ND.player_id;
