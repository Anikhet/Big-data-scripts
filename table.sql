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
COPY movie FROM '/Users/anikhetmulky/Downloads/title.csv' WITH (FORMAT csv,null '\N');

CREATE TABLE person (
    name_id int NOT NULL PRIMARY KEY,
    firstname VARCHAR(500) 
);

COPY person FROM '/Users/anikhetmulky/Downloads/person.csv' WITH (FORMAT csv,null '\N');

CREATE TABLE people(
    title_id int,
    name_id int,
    CONSTRAINT fk_title FOREIGN KEY (title_id) REFERENCES movie (title_id) ON UPDATE CASCADE,
    CONSTRAINT fk_name FOREIGN KEY (name_id) REFERENCES person (name_id) ON UPDATE CASCADE,
    role VARCHAR(20),
    PRIMARY KEY (title_id, name_id,role)
    
);
COPY people FROM '/Users/anikhetmulky/Downloads/principals.csv' WITH (FORMAT csv,null '\N');

CREATE TABLE ratevote(
    title_id int ,
    ratings real,
    vote int

);
CREATE TABLE Genre(
    title_id int,
    genre VARCHAR(100),
    PRIMARY KEY (title_id)
    CONSTRAINT fk_title FOREIGN KEY (title_id) REFERENCES title (title_id) ON UPDATE CASCADE

);
COPY ratevote FROM '/Users/anikhetmulky/Downloads/genre.csv' WITH (FORMAT csv,null '\N');
