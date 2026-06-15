-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

  -- Set in the gritty 1980s, a valuable briefcase has disappeared from the Blue Note Lounge. A witness reported that a man in a trench coat was seen fleeing the scene. Investigate the crime scene, review the list of suspects, and examine interview transcripts to reveal the culprit.

  SELECT * FROM crime_scene


  76	19851120	theft	Blue Note Lounge	A briefcase containing sensitive documents vanished. A witness reported a man in a trench coat with a scar on his left cheek fleeing the scene

SELECT * FROM suspects
WHERE scar = 'left cheek';

two suspects have attire and scars that match the witness report

3	Frankie Lombardi	trench coat	left cheek
183	Vincent Malone	trench coat	left cheek

SELECT * FROM interviews;

SELECT *
FROM interviews
WHERE suspect_id = 183
   OR suspect_id = 3;

183	I wasn’t going to steal it, but I did.

So suspect 183, Vincent Malone did it!