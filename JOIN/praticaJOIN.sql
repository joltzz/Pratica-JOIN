/* QUESTÂO 1*/

SELECT users.id,users.name,cities.name as city FROM users
JOIN cities
ON "cityId" = cities.id
WHERE cities.name = 'Rio de Janeiro'


/*QUESTÂO 2*/

SELECT testimonials.id,u1.name,u2.name,testimonials.message FROM testimonials 
JOIN users AS u1 ON "writerId" = u1.id
JOIN users AS u2 ON "recipientId" = u2.id


/*QUESTÂO 3*/

SELECT users.name,courses.name,schools.name,educations."endDate" FROM educations
JOIN users ON "userId" = users.id
JOIN courses ON "courseId" = courses.id
JOIN schools ON "schoolId" = schools.id
WHERE users.id = 30 AND educations.status = 'finished'


/*QUESTÂO 4*/

SELECT users.name,roles.name,companies.name,experiences."startDate" FROM experiences
JOIN companies ON "companyId" = companies.id
JOIN users ON "userId" = users.id
JOIN roles ON "roleId" = roles.id
WHERE users.id = 50 AND experiences."endDate" = NULL
