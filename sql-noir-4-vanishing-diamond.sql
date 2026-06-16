-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

Case #006: The Vanishing Diamond
At Miami’s prestigious Fontainebleau Hotel charity gala, the famous “Heart of Atlantis” diamond necklace suddenly disappeared from its display.

SELECT * FROM crime_scene WHERE location = 'Fontainebleau Hotel';

48	19870520	Fontainebleau Hotel	The Heart of Atlantis necklace disappeared. Many guests were questioned but only two of them gave valuable clues. One of them is a really famous actor. The other one is a woman who works as a consultant for a big company and her first name ends with "an".


SELECT * FROM guest WHERE name LIKE '%an';

154	Atlas Hogan	Investment Banker	VIP-R

72	Orion Chapman	Investment Banker	VIP-G


SELECT * FROM guest WHERE occupation = 'Actor';

43	Ruby Baker	Actor	VIP-R
129	Clint Eastwood	Actor	VIP-G
164	River Bowers	Actor	VIP-B
189	Sage Dillon	Actor	VIP-G
192	Phoenix Pitts	Actor	VIP-G

SELECT * FROM witness_statements WHERE id = 154 OR id = 72;
72	12	From the adjacent building, I saw unusual activity in the restricted areas.

SELECT * FROM witness_statements WHERE id = 43 OR id = 129 OR id = 164 OR id = 189 OR id = 192;
43	67	I heard the sound of spray paint cans being used inside the closed gallery.

SELECT * FROM final_interviews WHERE confession LIKE '%paint%';
131	131	I was at my painting class then. I create art, not destruction.


SELECT * FROM attire_registry WHERE note LIKE '%diamond%';

74	178	purple evening gown, diamond pendant

39	156	gold cocktail dress, diamond pendant

3	3	red gown, diamond necklace

SELECT * FROM marina_rentals WHERE id = 74 OR id = 39 or ID = 3;

3	1	134	19871028	Wave Dancer
39	3	78	19870520	Sunset Mist
74	3	156	19871028	Ocean Star II

This one matches the crime_scence date: 39	3	78	19870520	Sunset Mist

SELECT * FROM final_interviews WHERE id = 39;

39	39	Check my phone records. I didnt kill anyone that night.

SELECT * FROM final_interviews WHERE guest_id = 156;

156	156	My bus pass shows I was traveling. I would never take someones life.

SELECT *
FROM guest
WHERE occupation LIKE '%Consultant%';


woman first name ending in an 

116	Vivian Nair	Consultant	VIP-R

SELECT *
FROM guest
WHERE id = 12;

12	William Davis	Entrepreneur	VIP-G


SELECT *
FROM final_interviews
WHERE id = 12;

12	12	Youre barking up the wrong tree. I didnt kill anybody.

SELECT *
FROM final_interviews
WHERE id = 116;

116	116	Check my work computer logs. I would never commit such a horrible act.

SELECT *
FROM guest
WHERE id = 67;

67	Thea Gibson	Art Collector	VIP-

SELECT *
FROM final_interviews
WHERE id = 67;

67	67	I have proof of my whereabouts. Im not someone who would kill.

SELECT * FROM final_interviews WHERE id IN (12,67);

SELECT *
FROM witness_statements
WHERE guest_id = 116;

16	116	I saw someone holding an invitation ending with "-R". He was wearing a navy suit and a white tie.

SELECT *
FROM attire_registry
WHERE note LIKE '%suit%';

30	156	navy suit, white 

42	145	navy suit, white tie

48	105	navy suit, white tie

53	112	navy suit, white tie

58	190	navy suit, white tie

61	189	navy suit, white tie

63	167	navy suit, white tie

67	190	navy suit, white tie

SELECT *
FROM guest WHERE invitation_code LIKE '%R';

too many results

SELECT *
FROM guest
WHERE invitation_code LIKE '%R'
  AND id IN (156,145,105,112,190,189,167);

  105	Mike Manning	Wealth Reallocation Expert	VIP-R

  SELECT *
FROM final_interviews
WHERE id = 105;

105	105	I was the one who took the crystal. I guess I need a lawyer now?

Mike Manning did it!