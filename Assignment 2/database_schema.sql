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
CREATE TABLE Title_Actor (
    actor int,
    title int
);
-- o actor FK Member(id)
-- o title FK Title(id)
CREATE TABLE Title_Writer (
    writer,
    title
);
-- o writer FK Member(id)
-- o title FK Title(id)
CREATE TABLE Title_Director (
    director, 
    title
);
-- o director FK Member(id)
-- o title FK Title(id)
CREATE TABLE Title_Producer (
    producer, 
    title
);
-- o producer FK Member(id)
-- o title FK Title(id)
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






-- class Solution:
--     def productExceptSelf(self, nums: List[int]) -> List[int]:
--         post = [nums[-1]] * len(nums)
--         pre = [nums[0]]* len(nums)
--         for x in range(1,len(nums)):
--             pre[x] = pre[x - 1] * nums[x]
--         for x in range(len(nums) - 2, -1, -1):
--             post[x] = post[x + 1] * nums[x]
        
--         print(pre)
--         print(post)
        
--         for x in range(len(nums)):
--             temp = x - 1
--             temp2 = x + 1
--             if x - 1 < 1:
--                 temp = pre[0]
--                 print(pre[0])
--             if x + 1 == len(nums):
--                 temp2 = 1

--             nums[x] = pre[temp] * post[temp2]
            
--         return nums

        
