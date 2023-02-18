-- -- CREATE TABLE Title__director as (
-- -- SELECT title_director.director_id,title_director.title_id from "Member"
-- -- LEFT JOIN title_director on title_director.director_id = "Member".id
-- -- );
-- -- SELECT director_id, COUNT(director_id)
-- -- FROM title_director
-- -- GROUP BY director_id
-- -- HAVING COUNT(director_id)> 1;
--
--
-- DELETE FROM "Title_Actor"
-- WHERE title_id IN (
--   SELECT title_id
--   FROM (
--     SELECT title_id, ROW_NUMBER() OVER(PARTITION BY title_id ORDER BY title_id) AS row_num
--     FROM "TITLE ACTOR CHARACTER"
--   ) t
--   WHERE t.row_num > 1
-- );
--
--
-- -- CREATE TABLE Title__Director as (
-- -- SELECT title_director.director_id,title_director.id from "Title"
-- -- LEFT JOIN "title_director" on "Title".id = title_director.id
-- -- );
-- -- SELECT count(*) FROM title__director where title__director.director_id is not null
-- --
-- -- SELECT count(*) FROM Title_Actor
--
--
-- CREATE TABLE Title_director as (
-- SELECT title__director.director_id,title__director.title_id from "Title"
-- LEFT JOIN title__director on title__director.title_id = "Title".id
-- );
--
-- -- SELECT director_id, COUNT(director_id)
-- -- FROM title_director
-- -- GROUP BY director_id
-- -- HAVING COUNT(director_id)> 1;
--
-- CREATE TABLE new_ as (
-- SELECT actor_title_character.title_id,actor_title_character.character_id, actor_title_character.member_id from "Title"
-- LEFT JOIN actor_title_character on "Title".id= actor_title_character.title_id
--
-- );
--
-- CREATE TABLE final1 as (
-- SELECT new__.title_id,new__.member_id,new__.character_id FROM titl
-- JOIN new__ on character.character_id = new__.character_id
--
-- );


DELETE FROM "Title" where "Title"."startYear" = '\N';

-- SELECT count(*) FROM "Title_Actor"

UPDATE "Title" SET "startYear"= REPLACE("startYear",'\N','');
UPDATE "title.principals" SET "nconst"= REPLACE("nconst",'nm','');

SELECT "Member".name
FROM "Member"
WHERE "Member".name LIKE 'Phi%'
  AND "Member"."deathYear" IS NULL
  AND "Member".id NOT IN (
      SELECT "Title_Actor".actor_id
      FROM "Title_Actor"
      JOIN "Title" on "Title".id = "Title_Actor".title_id
      WHERE "Title"."startYear" is '2014'
);
