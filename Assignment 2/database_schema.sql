UPDATE "title.basics" SET "tconst"= REPLACE("tconst",'tt','');
UPDATE "name.basics" SET "nconst"= REPLACE("nconst",'nm','');
UPDATE "title.principals" SET "tconst"= REPLACE("tconst",'tt','');
UPDATE "title.principals" SET "nconst"= REPLACE("nconst",'nm','');
UPDATE "title.ratings" SET "tconst"= REPLACE("tconst",'tt','');
INSERT INTO "Title_Writer "
SELECT nconst,tconst FROM "title.principals" where category = 'writer'
INSERT INTO "Title_Director"
SELECT nconst,tconst FROM "title.principals" where category = 'director';
INSERT INTO "Title_Producer"
SELECT nconst,tconst FROM "title.principals" where category = 'producer';
INSERT INTO "Title_Actor"
SELECT tconst,nconst FROM "title.principals" where category = 'actor'

INSERT INTO  "character" (character)
SELECT DISTINCT characters FROM "title.principals";

CREATE TABLE Actor_Title_Character as (
SELECT tconst,nconst,character.character_id from "title.principals"
RIGHT JOIN character on character.character = "title.principals".characters
);
CREATE TABLE Title_1 as (
             SELECT "Title".id,"Title".type,"Title".title, "Title"."originalTitle", "Title"."startYear",
                    "Title"."endYear","Title"."runtimeMinutes", "title.ratings"."averageRating",
                    "title.ratings"."numVotes"
             FROM "title.ratings"
             RIGHT JOIN "Title" on "Title".id = "title.ratings".tconst
             )


-- Q2
SELECT COUNT(*)
FROM "Title Actor"
LEFT JOIN actor_title_character
ON "Title Actor".title_id = actor_title_character.title_id
AND "Title Actor".actor_id = actor_title_character.character_id
WHERE actor_title_character.title_id IS NULL

SELECT "Member".name
FROM "Member"
WHERE "Member".name LIKE 'Phi%'
  AND "Member"."deathYear" IS NULL
  AND "Member".id NOT IN (
      SELECT "Title_Actor".actor_id
      FROM "Title_Actor"
      JOIN "Title" on "Title".id = "Title_Actor".title_id
      WHERE "Title"."startYear" Like '2014'
);








CREATE TABLE Actor_lund as (
SELECT "Title Actor".actor_id,"Title Actor".title_id from "Title"
LEFT JOIN "Title Actor" on "Title".id = "Title Actor".title_id
);

SELECT