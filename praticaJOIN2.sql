/*QUESTÃO 1*/

SELECT COUNT(experiences."endDate") AS currentExperiences FROM experiences


/*QUESTÃO 2*/

SELECT COUNT(educations."endDate") AS educations,"userId" AS id 
FROM educations
GROUP BY "userId"
ORDER BY educations 

/*QUESTÃO 3*/

SELECT COUNT(testimonials.message) AS testimonailCount, users.name AS writer
FROM testimonials
JOIN users ON "writerId" = users.id
WHERE users.id = 435
GROUP BY users.id


/*QUESTÃO 4*/

SELECT MAX(salary) AS maximumSalary, roles.name AS role FROM jobs
JOIN roles ON "roleId" = roles.id
GROUP BY roles.name,salary