-- TASK 1
SELECT users.lastname, users.firstname, users.patronomic, gender.name FROM teacher
JOIN users ON teacher.user_id=users.user_id
JOIN gender ON users.gender_id=gender.gender_id
JOIN otdel ON teacher.otdel_id=otdel.otdel_id
WHERE otdel.otdel_id=1


-- TASK 2
SELECT users.lastname, users.firstname, users.patronomic, gruppa.name, special.name FROM student JOIN users ON student.user_id=users.user_id
JOIN gruppa ON student.gruppa_id=gruppa.gruppa_id
JOIN special ON gruppa.special_id=special.special_id
JOIN otdel ON special.otdel_id=otdel.otdel_id 
WHERE otdel.otdel_id=1


-- TASK 3
SELECT course.name, course.hours, special.name FROM course JOIN special ON course.special_id=special.special_id
JOIN otdel ON special.otdel_id=otdel.otdel_id WHERE otdel.otdel_id=2


-- TASK 4
SELECT gruppa.name, gruppa.date_begin, gruppa.date_end, special.name FROM gruppa JOIN special ON gruppa.special_id=special.special_id 
WHERE special.special_id=1


-- TASK 5
SELECT users.lastname, users.firstname, users.patronomic, gruppa.name, course.name FROM student JOIN users ON student.user_id=users.user_id
JOIN gruppa ON student.gruppa_id=gruppa.gruppa_id
JOIN special ON gruppa.gruppa_id=special.special_id
JOIN course ON special.special_id=course.special_id 
WHERE course.course_id=4


-- TASK 6
SELECT users.lastname, users.firstname, users.patronomic, course.name, course.hours, gruppa.name, lesson_num.name FROM teacher JOIN users ON teacher.user_id=users.user_id
JOIN graduate ON teacher.user_id=graduate.user_id
JOIN course ON graduate.course_id=course.course_id
JOIN gruppa ON graduate.gruppa_id=gruppa.gruppa_id
JOIN graduate_time ON graduate.graduate_id=graduate_time.graduate_id
JOIN lesson_num ON graduate_time.lesson_num_id=lesson_num.lesson_num_id 
WHERE lesson_num.time_lesson BETWEEN '08:30:00' AND '15:00:00'


-- TASK 7
SELECT COUNT(*), otdel.name FROM student JOIN gruppa ON student.gruppa_id=gruppa.gruppa_id
JOIN special ON gruppa.special_id=special.special_id
JOIN otdel ON special.otdel_id=otdel.otdel_id
GROUP BY otdel.otdel_id


-- TASK 8
SELECT COUNT(*), gruppa.name FROM course JOIN special ON special.special_id=course.special_id
JOIN gruppa ON special.special_id=gruppa.special_id
GROUP BY gruppa.gruppa_id


-- TASK 9
SELECT users.lastname, users.firstname, users.patronomic FROM teacher JOIN users ON teacher.user_id=users.user_id
LEFT JOIN graduate ON teacher.user_id=graduate.user_id
LEFT JOIN course ON graduate.course_id=course.course_id 
WHERE course.course_id IS NULL


-- TASK 10
SELECT course.name FROM course LEFT JOIN graduate ON course.course_id=graduate.course_id 
WHERE graduate.course_id IS NULL


-- TASK 11
SELECT special.name FROM special LEFT JOIN course ON special.special_id=course.special_id 
WHERE course.special_id IS NULL


-- TASK 12
SELECT users.lastname, users.firstname, users.patronomic FROM student JOIN users ON student.user_id=users.user_id
JOIN gender ON users.gender_id=gender.gender_id 
JOIN gruppa ON student.gruppa_id=gruppa.gruppa_id
JOIN graduate ON graduate.gruppa_id=gruppa.gruppa_id
JOIN graduate_time ON graduate.graduate_id=graduate_time.graduate_id
JOIN lesson_num ON graduate_time.lesson_num_id=lesson_num.lesson_num_id
WHERE lesson_num.time_lesson BETWEEN '10:30:00' AND '18:30:00' AND gender.gender_id=2


-- TASK 13
SELECT course.name, lesson_num.name FROM course JOIN graduate ON course.course_id=graduate.course_id
JOIN graduate_time ON graduate.graduate_id=graduate_time.graduate_id
JOIN lesson_num ON graduate_time.lesson_num_id=lesson_num.lesson_num_id 
WHERE lesson_num.time_lesson BETWEEN '12:10:00' AND '18:50:00'


-- TASK 14
SELECT users.lastname, users.firstname, users.patronomic FROM student JOIN users ON student.user_id=users.user_id
JOIN gruppa ON student.gruppa_id=gruppa.gruppa_id
JOIN graduate ON graduate.gruppa_id=gruppa.gruppa_id
JOIN graduate_time ON graduate.graduate_id=graduate_time.graduate_id
JOIN day ON graduate_time.day_id=day.day_id 
WHERE day.day_id=5


-- TASK 15
SELECT day.name FROM day LEFT JOIN graduate_time ON graduate_time.day_id=day.day_id
LEFT JOIN graduate ON graduate_time.graduate_id=graduate.graduate_id
LEFT JOIN course ON graduate.course_id=course.course_id
WHERE course.course_id IS NULL


-- TASK 16
SELECT special.name FROM special JOIN course ON special.special_id=course.special_id
JOIN graduate ON course.course_id=graduate.course_id
JOIN graduate_time ON graduate.graduate_id=graduate_time.graduate_id
JOIN day ON graduate_time.day_id=day.day_id
WHERE day.day_id=2


-- TASK 17
SELECT users.lastname, users.firstname, users.patronomic, otdel.name FROM teacher JOIN users ON teacher.user_id=users.user_id
JOIN otdel ON teacher.otdel_id=otdel.otdel_id
JOIN graduate ON teacher.user_id=graduate.user_id
JOIN graduate_time ON graduate.graduate_id=graduate_time.graduate_id
JOIN day ON graduate_time.day_id=day.day_id
WHERE day.day_id=6


-- TASK 18
SELECT users.lastname, users.firstname, users.patronomic, gruppa.name, special.name FROM student JOIN users ON student.user_id=users.user_id
JOIN gruppa ON student.gruppa_id=gruppa.gruppa_id
JOIN special ON gruppa.special_id=special.special_id
JOIN graduate ON gruppa.gruppa_id=graduate.gruppa_id
JOIN course ON graduate.course_id=course.course_id
WHERE course.hours>12


-- TASK 19
SELECT course.name, course.hours, special.name, otdel.name FROM course JOIN special ON course.special_id=special.special_id
JOIN otdel ON special.otdel_id=otdel.otdel_id 
JOIN graduate ON course.course_id=graduate.course_id
JOIN graduate_time ON graduate.graduate_id=graduate_time.graduate_id
JOIN day ON graduate_time.day_id=day.day_id
WHERE otdel.otdel_id=2 AND day.day_id BETWEEN 3 AND 5


-- TASK 20
SELECT otdel.name FROM otdel JOIN teacher ON otdel.otdel_id=teacher.otdel_id
JOIN graduate ON teacher.user_id=graduate.user_id
JOIN graduate_time ON graduate.graduate_id=graduate_time.graduate_id
JOIN lesson_num ON graduate_time.lesson_num_id=lesson_num.lesson_num_id
JOIN day ON graduate_time.day_id=day.day_id
WHERE lesson_num.time_lesson BETWEEN '09:00:00' AND '12:00:00' AND day.day_id=2


-- TASK 21
SELECT COUNT(*), day.name FROM course JOIN graduate ON course.course_id=graduate.course_id
JOIN graduate_time ON graduate.graduate_id=graduate_time.graduate_id
JOIN day ON graduate_time.day_id=day.day_id
GROUP BY day.day_id


-- TASK 22
SELECT special.name, lesson_num.name, day.name FROM special JOIN course ON special.special_id=course.special_id
JOIN graduate ON course.course_id=graduate.course_id
JOIN graduate_time ON graduate.graduate_id=graduate_time.graduate_id
JOIN lesson_num ON graduate_time.lesson_num_id=lesson_num.lesson_num_id 
JOIN day ON graduate_time.day_id=day.day_id
WHERE lesson_num.time_lesson BETWEEN '15:00:00' AND '18:00:00' AND day.day_id BETWEEN 4 AND 6
