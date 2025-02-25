use db_course_conversions;
SELECT 
    i.student_id,
    i.date_registered,
    MIN(e.date_watched) AS first_date_watched,
    MIN(p.date_purchased) AS first_date_purchased,
    DATEDIFF(i.date_registered, MIN(e.date_watched)) AS days_diff_reg_watch,
    DATEDIFF(MIN(e.date_watched), MIN(p.date_purchased)) AS days_diff_watch_purch
FROM
    student_engagement e
        INNER JOIN
    student_info i ON e.student_id = i.student_id
        LEFT JOIN
    student_purchases p ON i.student_id = p.student_id
GROUP BY 
    i.student_id
HAVING 
    first_date_watched <= first_date_purchased OR first_date_purchased IS NULL;




SELECT 
    ROUND(COUNT(a.fisrt_date_purchased) / COUNT(a.first_date_watched) * 100 , 
            2) AS conversion_rate,
    ROUND(SUM(a.days_diff_reg_watch) / COUNT(date_watched),
            2) AS av_reg_watch,
    ROUND(SUM(???) / COUNT(???),
            2) AS av_watch_purch
FROM
    (
        SELECT 
    i.student_id,
    i.date_registered,
    MIN(e.date_watched) AS first_date_watched,
    MIN(p.date_purchased) AS first_date_purchased,
    DATEDIFF(i.date_registered, MIN(e.date_watched)) AS days_diff_reg_watch,
    DATEDIFF(MIN(e.date_watched), MIN(p.date_purchased)) AS days_diff_watch_purch
FROM
    student_engagement e
        INNER JOIN
    student_info i ON e.student_id = i.student_id
        LEFT JOIN
    student_purchases p ON i.student_id = p.student_id
GROUP BY 
    i.student_id
HAVING 
    first_date_watched <= first_date_purchased OR first_date_purchased IS NULL
    ) as  a;
    

    
    
SELECT 
    ROUND(COUNT(a.first_date_purchased) / COUNT(a.first_date_watched) * 100, 2) AS conversion_rate,
    ROUND(SUM(a.days_diff_reg_watch) / COUNT(a.days_diff_reg_watch), 2) AS av_reg_watch,
    ROUND(SUM(a.days_diff_watch_purch) / COUNT(a.days_diff_watch_purch), 2) AS av_watch_purch
FROM
    (
        -- Subquery from the previous part
        SELECT 
            i.student_id,
            i.date_registered,
            MIN(e.date_watched) AS first_date_watched,
            MIN(p.date_purchased) AS first_date_purchased,
            DATEDIFF(i.date_registered, MIN(e.date_watched)) AS days_diff_reg_watch,
            DATEDIFF(MIN(e.date_watched), MIN(p.date_purchased)) AS days_diff_watch_purch
        FROM
            student_engagement e
                INNER JOIN
            student_info i ON e.student_id = i.student_id
                LEFT JOIN
            student_purchases p ON i.student_id = p.student_id
        GROUP BY 
            i.student_id
        HAVING 
            first_date_watched <= first_date_purchased OR first_date_purchased IS NULL
    ) a;
    
    
    
    
    
