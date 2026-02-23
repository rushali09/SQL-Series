WITH ranked AS (
    SELECT
        exam_id,
        student_id,
        score,
        DENSE_RANK() OVER (PARTITION BY exam_id ORDER BY score)        AS rnk_low,
        DENSE_RANK() OVER (PARTITION BY exam_id ORDER BY score DESC)   AS rnk_high
    FROM Exam
),
bad_students AS (
    SELECT DISTINCT student_id
    FROM ranked
    WHERE rnk_low = 1 OR rnk_high = 1
)
SELECT s.student_id, s.student_name
FROM Student s
JOIN Exam e ON e.student_id = s.student_id          -- took at least one exam
LEFT JOIN bad_students b ON b.student_id = s.student_id
WHERE b.student_id IS NULL                          -- never highest/lowest in any exam
GROUP BY s.student_id, s.student_name
ORDER BY s.student_id;