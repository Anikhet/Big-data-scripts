CREATE TABLE movie(
    title_id int NOT NULL PRIMARY KEY,
    title_name VARCHAR(1000) ,
    isAdult int,
    release_year int
);

CREATE TABLE person (
    name_id int NOT NULL PRIMARY KEY,
    firstname VARCHAR(500) 
);

CREATE TABLE people(
    id serial PRIMARY KEY,
    title_id int,
    name_id int,
    role VARCHAR(20)
    CONSTRAINT fk_title FOREIGN KEY (title_id) REFERENCES movie (title_id) ON UPDATE CASCADE,
    CONSTRAINT fk_name FOREIGN KEY (name_id) REFERENCES person (name_id) ON UPDATE CASCADE,
);
   
CREATE TABLE reviews(
    title_id int PRIMARY KEY,
    ratings real,
    vote int,
    CONSTRAINT fk_rate_id FOREIGN KEY (title_id) REFERENCES movie (title_id) ON UPDATE CASCADE
);

CREATE TABLE genre_table(
    genre_id int PRIMARY KEY,
    genre VARCHAR(20)
);

CREATE TABLE Genre(
    id serial PRIMARY KEY,
    title_id int,
    genre VARCHAR(100),
    genre_id int,
    CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre_table (genre_id) ON UPDATE CASCADE,
    CONSTRAINT fk_title FOREIGN KEY (title_id) REFERENCES movie (title_id) ON UPDATE CASCADE
);


COPY movie FROM '/Users/anikhetmulky/Downloads/title.csv' WITH (FORMAT csv,null '\N') WHERE isAdult = 0;
COPY person FROM '/Users/anikhetmulky/Downloads/person.csv' WITH (FORMAT csv,null '\N');
COPY people (title_id,name_id,role) FROM '/Users/anikhetmulky/Downloads/principals.csv' WITH (FORMAT csv,null '\N');
COPY reviews FROM '/Users/anikhetmulky/Downloads/ratings.csv' WITH (FORMAT csv,null '\N'); 
COPY genre_table FROM '/Users/anikhetmulky/Downloads/genre.csv' WITH (FORMAT csv,null '\N');
COPY genre(title_id,genre,genre_id) FROM '/Users/anikhetmulky/Downloads/genre_table.csv' WITH (FORMAT csv,null '\N');
