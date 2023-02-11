COPY movie FROM '/Users/anikhetmulky/Downloads/title.csv' WITH (FORMAT csv,null '\N') WHERE isAdult = 0;
COPY person FROM '/Users/anikhetmulky/Downloads/person.csv' WITH (FORMAT csv,null '\N');
COPY people (title_id,name_id,role) FROM '/Users/anikhetmulky/Downloads/principals.csv' WITH (FORMAT csv,null '\N');
COPY reviews FROM '/Users/anikhetmulky/Downloads/ratings.csv' WITH (FORMAT csv,null '\N'); 
COPY genre FROM '/Users/anikhetmulky/Downloads/genre.csv' WITH (FORMAT csv,null '\N');
COPY genre_table(title_id,genre,genre_id) FROM '/Users/anikhetmulky/Downloads/genre_table.csv' WITH (FORMAT csv,null '\N');