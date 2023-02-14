CREATE TABLE title(
    title_id int NOT NULL PRIMARY KEY,
    title_type VARCHAR(20),
    title VARCHAR(200),
    originalTitle VARCHAR(200),
    startYear int,
    endYear int,
    runtime, 
    avgRating real,
    numVotes int
);

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

CREATE TABLE people(
    id serial PRIMARY KEY,
    title_id int,
    name_id int,
    job VARCHAR(20)
    CONSTRAINT fk_title FOREIGN KEY (title_id) REFERENCES movie (title_id) ON UPDATE CASCADE,
    CONSTRAINT fk_name FOREIGN KEY (name_id) REFERENCES person (name_id) ON UPDATE CASCADE,
);
   
CREATE TABLE reviews(
    title_id int PRIMARY KEY,
    ratings real,
    vote int,
    CONSTRAINT fk_rate_id FOREIGN KEY (title_id) REFERENCES movie (title_id) ON UPDATE CASCADE
);



CREATE TABLE Genre_table(
    id serial PRIMARY KEY,
    title_id int,
    genre VARCHAR(20),
    genre_id int,
    CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre (genre_id) ON UPDATE CASCADE,
    CONSTRAINT fk_title FOREIGN KEY (title_id) REFERENCES movie (title_id) ON UPDATE CASCADE
);



