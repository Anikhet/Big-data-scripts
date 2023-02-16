CREATE TABLE Genre(
    genre_id int PRIMARY KEY,
    genre VARCHAR(20)
);

CREATE TABLE Title_Genre(
    genre_id int,
    title_id int,
    CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre (genre_id) ON UPDATE CASCADE,
    CONSTRAINT fk_title FOREIGN KEY (title_id) REFERENCES title (title_id) ON UPDATE CASCADE
);


CREATE TABLE Member (
    member_id NOT NULL PRIMARY KEY ,
    member_name VARCHAR(500), 
    birthYear int, 
    deathYear int
);

CREATE TABLE Character (
    id, 
    character
);
-- Note: this table should contain individual characters
CREATE TABLE Actor_Title_Character (
    actor, 
    title, 
    character
);
-- actor,title) FK Title_Actor (actor, title)
-- o character FK Character(id)



INSERT INTO "actor table"
SELECT tconst,nconst FROM "title.principals" where category = 'actor'

UPDATE "actor table" SET "title_id"= REPLACE("title_id",'tt','');
UPDATE "actor table" SET "actor_id"= REPLACE("actor_id",'nm','');
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