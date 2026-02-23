WITH all_days AS (
    SELECT fail_date AS dt, 'failed' AS period_state
    FROM Failed
    WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'
    UNION ALL
    SELECT success_date AS dt, 'succeeded' AS period_state
    FROM Succeeded
    WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31'
),
grp AS (
    SELECT
        period_state,
        dt,
        DATE_SUB(
            dt,
            INTERVAL ROW_NUMBER() OVER (PARTITION BY period_state ORDER BY dt) DAY
        ) AS g
    FROM all_days
)
SELECT
    period_state,
    MIN(dt) AS start_date,
    MAX(dt) AS end_date
FROM grp
GROUP BY period_state, g
ORDER BY start_date;