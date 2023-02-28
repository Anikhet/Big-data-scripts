CREATE table movie_genre as(
SELECT Title,"Title_Genre".genre_id 
FROM Title
Join "Title_Genre" on "Title_Genre".id = title_main.id
) 
CREATE table movie_genre_id as( 
SELECT movie_genre.*,"Genre".genre 
FROM movie_genre 
Join "Genre" on movieandgenre.genre_id = "Genre".genre_id
)
-- Sieve out actors that play a single character.
Create Title_Actor_Character as(
SELECT nconst
FROM Character_table
GROUP BY nconst
HAVING COUNT(*) = 1
)

CREATE table movie_genre_id_member as
(SELECT movie_genre_id.*,Title_Actor_Character.member_id,Title_Actor_Character.characters 
FROM Title_Actor_Character
JOIN movie_genre_id on movie_genre_id.id = Title_Actor_Character.id 

);
CREATE table Movie as
(SELECT movie_genre_id_member.*, "Member"."birthYear" 
FROM movie_genre_id_member 
join "Member" on "Member".id = movie_genre_id_member.member_id 
where "runtimeMinutes" >= 90
)

