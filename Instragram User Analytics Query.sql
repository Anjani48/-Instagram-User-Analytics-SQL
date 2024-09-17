
A) Marketing Analysis:
-- Loyal User Reward
-> Identify the five oldest users on Instagram from the provided database.

select * from users order by created_at asc limit 5;

-- Inactive User Engagement
-> Identify users who have never posted a single photo on Instagram.

select users.id,username 
from users 
-> left join photos 
-> on users.id = photos.user_id where photos.id is NULL
-> order by username asc;

-- Contest Winner Declaration
-> Determine the winner of the contest and provide their details to the team.

select users.id,users.username ,photos.image_url,count(*) as `Total Likes` from likes 
-> inner join photos on photos.id = likes.photo_id 
-> inner join users on users.id = likes.photo_id 
-> group by photos.id 
-> order by `Total Likes` desc limit 1

-- Hashtag Research
-> Identify and suggest the top five most commonly used hashtags on the platform.

select tag_name , count(*) as `Total occurences` from tags 
-> inner join photo_tags on tags.id = photo_tags.tag_id 
-> group by tags.id 
-> order by `Total occurences` desc limit 5

-- Ad Campaign Launch
-> Determine the day of the week when most users register on Instagram. Provide insights on when to schedule an ad campaign.

select dayname(created_at) as day,count(*) as `Total registered users` 
from users 
-> group by day
-> order by `Total registered users` desc

B) Investor Metrics:
-- User Engagement
-> Calculate the average number of posts per user on Instagram. Also, provide the total number of photos on Instagram divided by the total number of users.

select (select count(*) from photos)/(select count(*) from users) as Avg_posts;

-- Bots & Fake Accounts
-> Identify users (potential bots) who have liked every single photo on the site, as this is not typically possible for a normal user.

select users.id,users.username,count(*) as `Total likes by user` 
from users 
-> inner join likes on likes.user_id = users.id 
-> group by likes.user_id 
-> order by `Total likes by user` desc;
