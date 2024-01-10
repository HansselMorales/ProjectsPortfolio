select student_track_id, student_id, track_name, date_enrolled, track_completed, days_for_completion,
    
    -- Bucketing completion into different categories
    case
        when days_for_completion = 0 then 'Same day'
        when days_for_completion between 1 and 7 then '1 to 7 days'
        when days_for_completion between 8 and 30 then '8 to 30 days'
        when days_for_completion between 31 and 60 then '31 to 60 days'
        when days_for_completion between 61 and 90 then '61 to 90 days'
        when days_for_completion between 91 and 365 then '91 to 365 days'
        when days_for_completion >= 366 then '366+ days'
    END AS completion_bucket

-- Now, it is time to subquery to extract and process raw data from related tables
FROM
(
SELECT 
    ROW_NUMBER() OVER (ORDER BY student_id, track_name DESC) AS student_track_id, -- Create unique identification for each student-track pair
    e.student_id,
    i.track_name,
    e.date_enrolled,
    e.date_completed,
    case
    when date_completed is null then 0
    else 1 end as track_completed, -- To determine if the track was completed
    DATEDIFF(e.date_completed, e.date_enrolled) AS days_for_completion -- To calculate the difference between completion and enrollment dates
FROM
    career_track_student_enrollments e
        JOIN -- Joining tables to get the track names
    career_track_info i ON e.track_id = i.track_id) a;