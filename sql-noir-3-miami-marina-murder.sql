-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?


-- Case #003: The Miami Marina Murder
-- A body was found floating near the docks of Coral Bay Marina in the early hours of August 14, 1986. Your job, detective, is to find the murderer and bring them to justice. This case might require the use of JOINs, wildcard searches, and logical deduction. Get to work, detective.

-- Find the murderer. ( Start by finding the crime scene and go from there )
SELECT * FROM crime_scene WHERE date = 19860814;


43	19860814	Coral Bay Marina	The body of an unidentified man was found near the docks. Two people were seen nearby: one who lives on 300ish "Ocean Drive" and another whose first name ends with "ul" and his last name ends with "ez".

SELECT *
FROM person
WHERE address LIKE '%Ocean Drive%';

101	Carlos Mendez	Los Ojos	Fisherman	369 Ocean Drive

SELECT *
FROM person
WHERE name LIKE '%ul'

102	Raul Gutierrez	The Cobra	Nightclub Owner	45 Sunset Ave

SELECT *
FROM interviews
WHERE id = 101;

101	101	I saw someone check into a hotel on August 13. The guy looked nervous.

SELECT *
FROM interviews
WHERE id = 102;

102	58	NULL

SELECT *
FROM hotel_checkins
WHERE id = 102;

102	107	Coastal Paradise Resort	19860812

person_id 102
id 102

SELECT *
FROM surveillance_records
WHERE id = 102;

102	102	12	NULL

SELECT *
FROM confessions
WHERE person_id = 102;

97	102	Alright! I've been running a blackmail operation.

102	Raul Gutierrez	The Cobra	Nightclub Owner	45 Sunset Ave

So criminal is Raul Gutierrez
