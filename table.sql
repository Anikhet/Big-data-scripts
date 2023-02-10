DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS ratevote;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS contacts;

CREATE TABLE movie(
    title_id int NOT NULL PRIMARY KEY,
    title_name VARCHAR(1000) ,
    isAdult int,
    release_year int
);
COPY movie FROM '/Users/anikhetmulky/Downloads/title.csv' WITH (FORMAT csv,null '\N') WHERE isAdult = 0;

CREATE TABLE person (
    name_id int NOT NULL PRIMARY KEY,
    firstname VARCHAR(500) 
);

COPY person FROM '/Users/anikhetmulky/Downloads/person.csv' WITH (FORMAT csv,null '\N');

CREATE TABLE people(
    id serial PRIMARY KEY,
    title_id int,
    name_id int,
    CONSTRAINT fk_title FOREIGN KEY (title_id) REFERENCES movie (title_id) ON UPDATE CASCADE,
    CONSTRAINT fk_name FOREIGN KEY (name_id) REFERENCES person (name_id) ON UPDATE CASCADE,
    role VARCHAR(20)
    
);
DELETE FROM movie
WHERE  NOT EXISTS (
   SELECT FROM people
   WHERE  people.title_id = movie.title_id
   );
 
COPY people (title_id,name_id,role) FROM '/Users/anikhetmulky/Downloads/principals.csv' WITH (FORMAT csv,null '\N');

CREATE TABLE ratevote(
    title_id int PRIMARY KEY,
    ratings real,
    vote int,
    CONSTRAINT fk_rate_id FOREIGN KEY (title_id) REFERENCES movie (title_id) ON UPDATE CASCADE

);
COPY ratevote FROM '/Users/anikhetmulky/Downloads/ratings.csv' WITH (FORMAT csv,null '\N');

CREATE TABLE genre_table(
    genre_id int PRIMARY KEY,
    genre VARCHAR(20)
);
COPY genre_table FROM '/Users/anikhetmulky/Downloads/genre.csv' WITH (FORMAT csv,null '\N');

CREATE TABLE Genre(
    title_id int,
    genre VARCHAR(100),
    PRIMARY KEY (title_id),
    genre_id int,
    CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre_table (genre_id) ON UPDATE CASCADE,
    CONSTRAINT fk_title FOREIGN KEY (title_id) REFERENCES movie (title_id) ON UPDATE CASCADE

);
COPY genre FROM '/Users/anikhetmulky/Downloads/genre_table.csv' WITH (FORMAT csv,null '\N');

-- SELECT * FROM movie
-- WHERE  NOT EXISTS (SELECT FROM people WHERE people.title_id = movie.title_id);

-- DELETE FROM movie
-- WHERE  NOT EXISTS (
--    SELECT FROM link_reply lr
--    WHERE  lr.which_group = lg.link_group_id
--    );


-- DELETE FROM crew1
-- WHERE tconst IN (
--     SELECT c.tconst 
--     FROM crew1 c LEFT JOIN movies m ON c.const=m.const
--     WHERE m.const IS NULL)