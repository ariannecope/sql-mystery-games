-- Record your SQL detective process here!  Write down: 
--   1. The SQL queries you ran
--   2. Any notes or insights as SQL comments
--   3. Your final conclusion: who did it?

-- Using these SQL clauses will help you solve the mystery: 
--    SELECT, FROM, WHERE, AND, OR, ORDER BY, LIMIT, LIKE, DISTINCT, BETWEEN, AS

-- writing a comment like this

--TRY THIS--
-- Find a person.
-- Look at the schema.
-- Ask: "What table would contain the next clue?"
-- Look for a column that links the two tables.
-- Query it.

-- selecting all columns from the crime scene report
--I ran this:
SELECT * FROM crime_scene_report;
--Then tried to narrow it down. Looked for :
--date
--type
--city
--description
--let's try a WHERE for the city
SELECT *
FROM crime_scene_report
WHERE city = 'SQL City';

--narrow by type
AND type = 'murder'


--This row has leads (witnesses, descriptions, instructions)
AND date = 20180115;

              SELECT *
FROM crime_scene_report
WHERE city = 'SQL City'
  AND type = 'murder'
  AND date = 20180115;

--Identify the witnesses mentioned in the crime scene report.

--look at people on Northwestern Dr and sort by address number:
--DESC puts the highest house number first so we know which one is the last house.

SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC;

-- RESULT:
-- Morty Schapiro lives at 4919 Northwestern Dr.
-- Morty Schapiro is likely the first witness mentioned in the crime scene report.

--look for theinterview that belongs to the person whose ID is 14887.
SELECT *
FROM interview
WHERE person_id = 14887;


-- I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
get_fit_now_member has person_id
and drivers_license has plate_number

SELECT *
FROM get_fit_now_member
WHERE id LIKE '48Z%'
AND membership_status = 'gold';

Two suspects:
-- 48Z7A	28819	Joe Germuska	20160305	gold
-- 48Z55	67318	Jeremy Bowers	20160101	gold

--first, check each person: What are their id values?
Joe:
SELECT *
FROM person
WHERE name = 'Joe Germuska';
id: 28819

Jeremey:
SELECT *
FROM person
WHERE name = 'Jeremy Bowers';
id: 6713

--now match to driver’s license and check which one has plate containing H42W
SELECT *
FROM drivers_license
WHERE id = 6713;

SELECT *
FROM drivers_license
WHERE id = 28819;

--these aren't working. 
--Let's try the license plate directly--
--% means anything could come before or after it

SELECT *
FROM drivers_license
WHERE plate_number LIKE '%H42W%';

id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
183779	21	65	blue	blonde	female	H42W0X	Toyota	Prius
423327	30	70	brown	brown	male	0H42W2	Chevrolet	Spark LS
664760	21	71	black	black	male	4H42WR	Nissan	Altima

--let's check the person table 
SELECT *
FROM person
WHERE id = 67318;
--okay Jeremy's license_id is  423327

SELECT *
FROM person
WHERE id = 28819;
--Joe's license_id is 173289

id	name	license_id	address_number	address_street_name	ssn
28819	Joe Germuska	173289	111	Fisk Rd	138909730
67318	Jeremy Bowers	423327	530	Washington Pl, Apt 3A	871539279



--Give me rows where id is 28819 or 67318.
--IN means match any value in this list
SELECT *
FROM person
WHERE id IN (28819, 67318);

id	name	license_id	address_number	address_street_name	ssn
28819	Joe Germuska	173289	111	Fisk Rd	138909730
67318	Jeremy Bowers	423327	530	Washington Pl, Apt 3A	871539279


--now we're moving from the person table to the drivers_license table so we can see what their driver's licenses say.
SELECT *
FROM drivers_license
WHERE id IN (173289, 423327);

id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
423327	30	70	brown	brown	male	0H42W2	Chevrolet	Spark LS

So the license plate matches Jeremy Bowers. He is the suspect!!!!

-- WITNESS DISCOVERY (NOT USED IN FINAL SUSPECT IDENTIFICATION)
--Why LIKE?--
--Because you know her first name is Annabel, but we don't know her full name
--% is a wildcard that means: "match any characters after this point."
SELECT *
FROM person
WHERE name LIKE 'Annabel%'
  AND address_street_name = 'Franklin Ave';
