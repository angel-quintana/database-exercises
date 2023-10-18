-- Use the albums_db database.
SHOW databases;
USE albums_db;
SELECT database();

-- What is the primary key for the albums table?
## primary key is 'id'
SHOW TABLES;
Describe albums;
Show create table albums;
-- CREATE TABLE `albums` (
--   `id` int unsigned NOT NULL AUTO_INCREMENT,
--   `artist` varchar(240) DEFAULT NULL,
--   `name` varchar(240) NOT NULL,
--   `release_date` int DEFAULT NULL,
--   `sales` float DEFAULT NULL,
--   `genre` varchar(240) DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1

-- What does the column named 'name' represent?
## name presents name of an album
Describe albums;

-- What do you think the sales column represents?
## How much the album has sold

-- Find the name of all albums by Pink Floyd.
## The Dark Side of the Moon, The Wall

Select database();
SHOW tables;
Describe albums;
Select * FROM albums;
SELECT 
	artist,
    name
FROM albums;

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
## 1967
Select 
	name,
    release_date
FROM albums
WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';

-- What is the genre for the album Nevermind?
## Grunge, Alternative Rock

Select
	name,
    genre
FROM albums;

-- Which albums were released in the 1990s?
/* name, release_date
'The Immaculate Collection', '1990'
'Dangerous', '1991'
'Metallica', '1991'
'Nevermind', '1991'
'The Bodyguard', '1992'
'Jagged Little Pill', '1995'
'Falling into You', '1996'
'Come On Over', '1997'
'Let\'s Talk About Love', '1997'
'Titanic: Music from the Motion Picture', '1997'
'Supernatural', '1999' */

Select 
	name,
    release_date
FROM albums
WHERE release_date >= 1990 and release_date < 2000
ORDER BY release_date desc;


-- Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
/* 
# name	sales
Sgt. Pepper's Lonely Hearts Club Band	13.1
Grease: The Original Soundtrack from the Motion Picture	14.4
Abbey Road	14.4
Dangerous	16.3
Nevermind	16.7
The Wall	17.6
Brothers in Arms	17.7
Dirty Dancing	17.9
Titanic: Music from the Motion Picture	18.1
Bad	19.3
Let's Talk About Love	19.3
The Immaculate Collection	19.4
Born in the U.S.A.	19.6
*/
Select 
	name as low_selling_albums,
    sales
FROM albums
WHERE sales < 20
order by sales desc;





