-- NOME REPOSITORY: 2024-es2-database

-- Esercizi solo con SELECT
-- 1. Seleziona tutti i professori dal dipartimento di Informatica.
-- res: 1

SELECT * FROM professor
WHERE department = 'Informatica';


-- 2. Elenca tutti gli studenti iscritti nell'anno 2021.
-- res: 2

SELECT * FROM student
WHERE subscription_year = 2021;


-- 3. Visualizza tutti i corsi offerti dal dipartimento di Fisica.
-- res: 1

SELECT * FROM course
WHERE department = 'Fisica';


-- 4. Mostra i nomi dei corsi insieme ai relativi dipartimenti.
-- res: 10

SELECT name, department FROM course;


-- 5. Conta il numero totale di studenti iscritti all'università.
-- res: 1 (value: 10)

SELECT COUNT(*) AS total_students FROM student;


-- Esercizi con GROUP BY e HAVING
-- 6. Conta quanti corsi sono offerti in ogni dipartimento.
-- res: 10 (uno per dipartimento)

SELECT department, COUNT(*) AS total_courses
FROM course
GROUP BY department;


-- DELETED
-- 7. Trova i dipartimenti che hanno più di 3 corsi.
-- res: 
-- DELETED



-- 8. Elenca il numero di studenti iscritti per ogni anno di iscrizione.
-- res: 5 (3, 2, 2, 2, 1)

SELECT subscription_year, COUNT(*) AS total_students
FROM student
GROUP BY subscription_year;


-- DELETED
-- 9. Mostra il numero medio di studenti per corso in ogni dipartimento.
-- res: 
-- DELETED

-- DELETED
-- 10. Trova i professori che insegnano più di un corso.
-- res: 
-- DELETED


-- Esercizi con JOIN
-- 11. Mostra il nome di ogni studente insieme al nome del corso a cui sono iscritti.
-- res: 30

SELECT student.name AS student_name, course.name AS course_name
FROM course_subscription
JOIN student ON course_subscription.student_id = student.id
JOIN course ON course_subscription.course_id = course.id;


-- 12. Elenca tutti i corsi insieme ai nomi dei professori che li insegnano.
-- res: 10

SELECT course.name AS course_name, professor.name AS professor_name
FROM course
JOIN professor ON course.professor_id = professor.id;


-- 13. Trova gli studenti e i corsi relativi al dipartimento di Chimica.
-- res: 3

SELECT student.name AS student_name, course.name AS course_name
FROM course_subscription
JOIN student ON course_subscription.student_id = student.id
JOIN course ON course_subscription.course_id = course.id
WHERE course.department = 'Chimica';


-- 14. Visualizza i nomi degli studenti e i corsi che hanno frequentato nel 2022.
-- res: 6

SELECT student.name AS student_name, course.name AS course_name
FROM course_subscription
JOIN student ON course_subscription.student_id = student.id
JOIN course ON course_subscription.course_id = course.id
WHERE student.subscription_year = 2022;


-- 15. Elencare i professori con i loro corsi e i relativi dipartimenti.
-- res: 10

SELECT professor.name AS professor_name, course.name AS course_name, course.department
FROM professor
JOIN course ON professor.id = course.professor_id;


-- DELETED
-- 16. Trova i corsi senza studenti iscritti.
-- res: 
-- DELETED

-- DELETED
-- 17. Mostra i corsi con più di 5 iscritti.
-- res: 
-- DELETED

-- DELETED
-- 18. Elenca tutti i professori che non hanno corsi assegnati.
-- res: 
-- DELETED


-- 19. Visualizza i corsi con il maggior numero di studenti.
-- res: 1 (3)

SELECT course.name AS course_name, COUNT(course_subscription.student_id) AS student_count
FROM course_subscription
JOIN course ON course_subscription.course_id = course.id
GROUP BY course.name
ORDER BY student_count DESC
LIMIT 1;


-- DELETED
-- 20. Trova gli studenti che sono iscritti a più di 3 corsi.
-- res: 
-- DELETED