--Q2
--1
select count(*)
from "Title_Actor"
where actor_id not in (
    select actor_id
    from actor_title_character
    where "Title_Actor".actor_id = actor_title_character.actor_id
);

--2
select "Member"."primaryName"
from "Member"
where "Member"."primaryName" like 'Phi%'
and "Member"."deathYear" is null
  and member_id not in (
      select "Title_Actor".actor_id
      from "Title_Actor"
      join "Title" on "Title".title_id = "Title_Actor".title_id
      where "Title"."startYear" = 2014
);

--3
select producer_id from "Title_Producer"
where title_id in (select "Title".title_id from "Title" where genres= 'Talk-Show' and "startYear" = 2017)
and producer_id in (select member_id from "Member" where "Member"."name" like '%Gill%')
GROUP BY producer_id
ORDER BY COUNT(*) ;

--4
select distinct title_id from "Title"
join "Title_Producer" on "Title".title_id = "Title_Producer".title_id
join "Member" on "Title_Producer".producer_id = "Member".member_id
where "Member"."deathYear" is null and "Title"."runtimeMinutes" > 120;

--5
select distinct "Member"."primaryName"
from "Member"
join "Title_Actor" on "Member".member_id = "Title_Actor".actor_id
join actor_title_character on "Title_Actor".actor_id = actor_title_character.member_id
where "Character".character like '%Jesus Christ%';
where "Member"."deathYear" is null

--Q5
--1
create index yearindex 
on "Title" (startYear)
select count(*)
from "Title_Actor"
where actor_id not in (
    select actor_id
    from actor_title_character
    where "Title_Actor".actor_id = actor_title_character.actor_id
);


--3
create index indexname
on "Member" ("name")
select producer_id from "Title_Producer"
where title_id in (select "Title".title_id from "Title" where genres= 'Talk-Show' and "startYear" = 2017)
and producer_id in (select member_id from "Member" where "Member"."primaryName" like '%Gill%')
GROUP BY producer_id
ORDER BY COUNT(*) ;

