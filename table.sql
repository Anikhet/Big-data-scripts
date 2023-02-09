
DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS ratevote;
DROP TABLE IF EXISTS sambhog;
DROP TABLE IF EXISTS crew;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS contacts;

CREATE TABLE title(
    title_id int NOT NULL PRIMARY KEY,
    titlename VARCHAR(1000) ,
    isAdult int,
    release_year int
);
COPY person FROM '/Users/anikhetmulky/Downloads/filename.csv' WITH (FORMAT csv,null '\N')  ;

CREATE TABLE person (
    name_id int NOT NULL PRIMARY KEY,
    firstname VARCHAR(500) 
    
);
COPY person FROM '/Users/anikhetmulky/Downloads/filename.csv' WITH (FORMAT csv,null '\N');

CREATE TABLE role(
    title_id int,
    name_id int,
    CONSTRAINT fk_title FOREIGN KEY (title_id) REFERENCES title (title_id) ON UPDATE CASCADE,
    CONSTRAINT fk_name FOREIGN KEY (name_id) REFERENCES person (name_id) ON UPDATE CASCADE,
    category VARCHAR(20)
    
);

CREATE TABLE ratevote(
    title_id int ,
    ratings real,
    vote int

);







COPY ratevote FROM '/Users/anikhetmulky/Downloads/file_name.csv' WITH (FORMAT csv);

