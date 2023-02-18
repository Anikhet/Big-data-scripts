create table Title(
    id               integer not null primary key,
    type             VARCHAR(500),
    title            VARCHAR(500),
    "originalTitle"  VARCHAR(500),
    "startYear"      int,
    "endYear"        int,
    "runtimeMinutes" int,
    "averageRating"  real,
    "numVotes"       integer
);
COPY movie FROM '/Users/anikhetmulky/Downloads/title.csv' WITH (FORMAT csv,null '\N');

create table Member (
    id          integer not null primary key,
    name        varchar(500),
    "birthYear" int,
    "deathYear" int
);

create table Genre (
    genre_id integer not null constraint genre_pk primary key,
    genre    VARCHAR(100)
);

create table Title_Genre (
    title_id integer not null constraint "Title_Genre_Title_id_fk" references public."Title",
    genre_id integer not null constraint "Title_Genre_Genre_genre_id_fk" references public."Genre",
    primary key (title_id, genre_id)
);

create table Title_Actor (
    title_id integer not null constraint "Title ACTOR_Title_id_fk" references public."Title",
    actor_id integer not null unique constraint "Title ACTOR_Member_id_fk" references public."Member"
);

create table Title_Director (
    director_id integer not null constraint "title_director_Member_id_fk" references public."Member",
    title_id    integer not null constraint "title_director_Title_id_fk" references public."Title",
    primary key (director_id, title_id)
);

create table Title_Producer (
    title_id    integer not null constraint "Final Title producer_Title_id_fk" references public."Title",
    producer_id integer not null constraint "bhag_Member_id_fk" references public."Member",
    primary key (title_id, producer_id)
);

create table Title_Writer(
    title_id  integer not null constraint "Title_Writer_Title_id_fk" references public."Title",
    writer_id integer not null constraint "Title_Writer_Member_id_fk" references public."Member",
    primary key (title_id, writer_id)
);

create table Character(
    character_id serial constraint character_pk primary key,
    character    varchar(5000)
);

create table Title_Actor_Character
(
    character_id integer not null primary key "Title_Actor_Character_Character_id_fk" references public."Character",,
    title_id     integer primary key "Title_Actor_Character_Title_Actor_id_fk" references public."Title_Actor",
    actor_id     integer primary key "Title_Actor_Character_Title_Actor_id_fk" references public."Title_Actor",
);


UPDATE "title.basics" SET "tconst"= REPLACE("tconst",'tt','');
DELETE FROM "title.basics" where "title.basics"."isAdult" = 1;
UPDATE "name.basics" SET "nconst"= REPLACE("nconst",'nm','');
UPDATE "title.principals" SET "tconst"= REPLACE("tconst",'tt','');
UPDATE "title.principals" SET "nconst"= REPLACE("nconst",'nm','');
UPDATE "title.ratings" SET "tconst"= REPLACE("tconst",'tt','');
CREATE TABLE new_principals as (
SELECT "title.principals".tconst, "title.principals".nconst, "title.principals".category, "title.principals".characters
FROM "title.basics"
INNER JOIN "title.principals" on "title.principals".tconst = "title.basics".tconst
);
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