/*
CSE 572 Group Project - Group 2
Winter 2020

Brett Evrist
Andrew Loop-Perez
Gilberto Pineda
Edsson Santarriaga-meza

*/

/*
=====================================================================
                           DROP TABLES
=====================================================================
*/
drop table SERVICE_USER cascade constraints;
drop table MOVIE cascade constraints;
drop table DIRECTOR cascade constraints;
drop table DISTRIBUTOR cascade constraints;
drop table COUNTRY cascade constraints;
drop table GENRE cascade constraints;
drop table WATCHED_LIST cascade constraints;
drop table WATCH_LIST cascade constraints;
drop table FRIENDS_LIST cascade constraints;
drop table RECOMMENDATIONS cascade constraints;

/*
=====================================================================
                           CREATE TABLES
=====================================================================
*/
create table SERVICE_USER (
    user_id number(4) GENERATED by default on null as IDENTITY unique,
    first_name varchar(15) not null,
    last_name varchar(15) not null,
    email varchar(35) unique not null,
    primary key (user_id, email)
);
-- insert into service_user(first_name, last_name, email) values ('John', 'Doe', 'johndoe@gmail.com');
create table DIRECTOR (
    director_id number(4) GENERATED by default on null as IDENTITY primary key,
    director_fname varchar(15) not null,
    director_lname varchar(15) not null
);
-- insert into director(director_fname, director_lname) values ('John', 'Doe');

create table DISTRIBUTOR (
    dist_id number(4) GENERATED by default on null as IDENTITY primary key,
    dist_name varchar(25) not null unique
);
-- insert into distributor(dist_name) values ('Movie Studio Inc.');

create table GENRE (
    genre_id number(4) GENERATED by default on null as IDENTITY primary key,
    genre_name varchar(15) not null unique
);
-- insert into genre(genre_name) values ('Action');

create table COUNTRY (
    country_id number(4) GENERATED by default on null as IDENTITY primary key,
    country varchar(15) not null unique
);
-- insert into country(country) values ('United States');

create table MOVIE (
    movie_id number(4) GENERATED by default on null as IDENTITY primary key,
    title varchar(40) not null,
    director_id number(4) references DIRECTOR(director_id) not null,
    dist_id number(4) references DISTRIBUTOR(dist_id) not null,
    genre_id number(4) references GENRE(genre_id) not null,
    country_id number(4) references COUNTRY(country_id) not null,
    release_year number(4) not null
);
-- insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('The Movie',2,2,4,4,2002);

create table WATCHED_LIST (
    id NUMBER(4) GENERATED by default on null as IDENTITY primary key,
    user_id number(4) references SERVICE_USER(user_id) not null,
    movie_id number(4) references MOVIE(movie_id) not null,
    rating varchar(10) CHECK (rating='good' OR rating='bad' OR rating=null)
);
-- insert into watched_list(user_id, movie_id, rating) values (1234,4332,'good');
-- insert into watched_list(user_id, movie_id) values (1234,4332);

create table WATCH_LIST (
    id NUMBER(4) GENERATED by default on null as IDENTITY primary key,
    user_id number(4) references SERVICE_USER(user_id) not null,
    movie_id number(4) references MOVIE(movie_id) not null
);
-- insert into watch_list(user_id, movie_id) values (11,23);

create table FRIENDS_LIST (
    id NUMBER(4) GENERATED by default on null as IDENTITY primary key,
    user_id number(4) references SERVICE_USER(user_id) not null,
    friend_id number(4) references SERVICE_USER(user_id) not null
);
-- insert into friends_list(user_id, friend_id) values (2,23);

create table RECOMMENDATIONS (
    id NUMBER(4) GENERATED by default on null as IDENTITY primary key,
    user_id number(4) references SERVICE_USER(user_id) not null,
    movie_id number(4) references MOVIE(movie_id) not null
);
-- insert into recommendations(user_id, movie_id) values(23,11);

/*
=====================================================================
                            INSERT DATA
=====================================================================
*/

-- SERVICE USER TABLE
insert into service_user(first_name, last_name, email) values ('Reece', 'Kian', 'ReeceKian50@hotmail.com');
insert into service_user(first_name, last_name, email) values ('Kai', 'Jack', 'KaiJack46@yahoo.com');
insert into service_user(first_name, last_name, email) values ('Finn', 'Christopher', 'FinnChristopher57@outlook.com');
insert into service_user(first_name, last_name, email) values ('Harris', 'Andrew', 'HarrisAndrew25@hotmail.com');
insert into service_user(first_name, last_name, email) values ('Callum', 'Alexander', 'CallumAlexander48@outlook.com');
insert into service_user(first_name, last_name, email) values ('Harris', 'Sam', 'HarrisSam49@hotmail.com');
insert into service_user(first_name, last_name, email) values ('Rhys', 'Aidan', 'RhysAidan30@msn.com');
insert into service_user(first_name, last_name, email) values ('Tyler', 'Harrison', 'TylerHarrison82@gmail.com');
insert into service_user(first_name, last_name, email) values ('Oliver', 'Aiden', 'OliverAiden31@gmail.com');
insert into service_user(first_name, last_name, email) values ('Joseph', 'Alexander', 'JosephAlexander51@msn.com');
insert into service_user(first_name, last_name, email) values ('Jayden', 'Matthew', 'JaydenMatthew67@hotmail.com');
insert into service_user(first_name, last_name, email) values ('Daniel', 'Lucas', 'DanielLucas31@hotmail.com');
insert into service_user(first_name, last_name, email) values ('Riley', 'Sam', 'RileySam11@yahoo.com');
insert into service_user(first_name, last_name, email) values ('Lewis', 'Ryan', 'LewisRyan95@icloud.com');
insert into service_user(first_name, last_name, email) values ('Jamie', 'Joseph', 'JamieJoseph79@msn.com');
insert into service_user(first_name, last_name, email) values ('Alex', 'Tyler', 'AlexTyler47@outlook.com');
insert into service_user(first_name, last_name, email) values ('Robbie', 'Tyler', 'RobbieTyler98@msn.com');
insert into service_user(first_name, last_name, email) values ('Benjamin', 'William', 'BenjaminWilliam53@msn.com');
insert into service_user(first_name, last_name, email) values ('David', 'Kaiden', 'DavidKaiden63@hotmail.com');
insert into service_user(first_name, last_name, email) values ('Luke', 'Cody', 'LukeCody53@icloud.com');
insert into service_user(first_name, last_name, email) values ('Robbie', 'Benjamin', 'RobbieBenjamin22@msn.com');
insert into service_user(first_name, last_name, email) values ('Muhammad', 'Ethan', 'MuhammadEthan28@yahoo.com');
insert into service_user(first_name, last_name, email) values ('Caleb', 'Michael', 'CalebMichael10@hotmail.com');
insert into service_user(first_name, last_name, email) values ('Alfie', 'Max', 'AlfieMax32@icloud.com');
insert into service_user(first_name, last_name, email) values ('Lewis', 'Rory', 'LewisRory5@outlook.com');
insert into service_user(first_name, last_name, email) values ('Aiden', 'Euan', 'AidenEuan55@gmail.com');
insert into service_user(first_name, last_name, email) values ('Leo', 'Harris', 'LeoHarris82@gmail.com');
insert into service_user(first_name, last_name, email) values ('Harrison', 'Andrew', 'HarrisonAndrew87@outlook.com');
insert into service_user(first_name, last_name, email) values ('Max', 'Craig', 'MaxCraig7@yahoo.com');
insert into service_user(first_name, last_name, email) values ('Caleb', 'Sam', 'CalebSam12@msn.com');

-- DIRECTOR TABLE
insert into director(director_fname, director_lname) values ('Jared', 'Arran');
insert into director(director_fname, director_lname) values ('Kyle', 'Ross');
insert into director(director_fname, director_lname) values ('Evan', 'Lewis');
insert into director(director_fname, director_lname) values ('Taylor', 'Rhys');
insert into director(director_fname, director_lname) values ('Luca', 'Taylor');
insert into director(director_fname, director_lname) values ('Kaiden', 'Joseph');
insert into director(director_fname, director_lname) values ('Calvin', 'Andrew');
insert into director(director_fname, director_lname) values ('Craig', 'Samuel');
insert into director(director_fname, director_lname) values ('Kaiden', 'Jacob');
insert into director(director_fname, director_lname) values ('Kian', 'Robert');
insert into director(director_fname, director_lname) values ('Kenzie', 'Max');
insert into director(director_fname, director_lname) values ('Oscar', 'Jake');
insert into director(director_fname, director_lname) values ('Alex', 'Andrew');
insert into director(director_fname, director_lname) values ('Euan', 'Oscar');
insert into director(director_fname, director_lname) values ('Luca', 'Joshua');

-- DISTRIBUTOR TABLE
insert into distributor(dist_name) values ('Sapling Corporation');
insert into distributor(dist_name) values ('Worldforce');
insert into distributor(dist_name) values ('Nymphoods');
insert into distributor(dist_name) values ('Houndwalk');
insert into distributor(dist_name) values ('Sprite');
insert into distributor(dist_name) values ('Phoenixwares');
insert into distributor(dist_name) values ('Lionessworth');
insert into distributor(dist_name) values ('Protonetworks');
insert into distributor(dist_name) values ('Elviations');
insert into distributor(dist_name) values ('Triumphoods');
insert into distributor(dist_name) values ('Spicurity');
insert into distributor(dist_name) values ('Orco');
insert into distributor(dist_name) values ('Herb Limited');
insert into distributor(dist_name) values ('Dragonbar');
insert into distributor(dist_name) values ('Icestar');

-- GENRE TABLE
insert into genre(genre_name) values ('Action');
insert into genre(genre_name) values ('Anime');
insert into genre(genre_name) values ('Children');
insert into genre(genre_name) values ('Comedy');
insert into genre(genre_name) values ('Documentary');
insert into genre(genre_name) values ('Drama');
insert into genre(genre_name) values ('Horror');
insert into genre(genre_name) values ('Romance');
insert into genre(genre_name) values ('Sci-fi');
insert into genre(genre_name) values ('Fantasy');

-- COUNTRY TABLE
insert into country(country) values ('United States');
insert into country(country) values ('India');
insert into country(country) values ('Japan');
insert into country(country) values ('China');
insert into country(country) values ('United Kingdom');
insert into country(country) values ('france');
insert into country(country) values ('Nigeria');
insert into country(country) values ('Egypt');
insert into country(country) values ('Korea');
insert into country(country) values ('Hong Kong');

-- MOVIE TABLE
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('Avengers: Infinity War',4,8,10,1,2018);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('Takers',1,9,10,9,2010);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('Murder Mystery',6,5,6,3,2019);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('Tall Girl',9,12,9,9,2019);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('The Irishman',6,12,5,3,2019);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('MR. RIGHT',9,11,9,5,2015);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('ZZ TOP: THAT LITTLE OL BAND FROM TEXAS',3,13,1,9,2019);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('Step Brothers',6,6,8,2,2008);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('Bee Movie',1,15,3,4,2007);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('Pete Davidson: Alive From New York',14,13,2,1,2020);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('Marriage Story',10,11,8,10,2019);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('The Foreigner',6,6,2,10,2017);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('The Other Guys',12,6,7,8,2010);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('Freaks',14,10,5,2,2018);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('Spenser Confidential',15,10,3,10,2020);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('The Dark Knight',12,5,3,1,2008);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('El Camino: A Breaking Bad Movie',1,12,3,4,2019);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('6 Underground',3,9,3,1,2019);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('End of Watch',1,6,10,5,2012);
insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('Spider-Man: Into the Spider-Verse',6,10,7,6,2018);

-- WATCHED_LIST TABLE
insert into watched_list(user_id, movie_id, rating) values (1,15,'bad');
insert into watched_list(user_id, movie_id, rating) values (22,7,'bad');
insert into watched_list(user_id, movie_id, rating) values (5,1,'bad');
insert into watched_list(user_id, movie_id, rating) values (13,12,'good');
insert into watched_list(user_id, movie_id, rating) values (4,17,'bad');
insert into watched_list(user_id, movie_id, rating) values (26,1,'good');
insert into watched_list(user_id, movie_id, rating) values (17,11,'good');
insert into watched_list(user_id, movie_id, rating) values (19,11,'bad');
insert into watched_list(user_id, movie_id, rating) values (12,20,'good');
insert into watched_list(user_id, movie_id, rating) values (16,10,'bad');
insert into watched_list(user_id, movie_id, rating) values (13,10,'good');
insert into watched_list(user_id, movie_id, rating) values (28,1,'good');
insert into watched_list(user_id, movie_id, rating) values (10,6,'good');
insert into watched_list(user_id, movie_id, rating) values (20,19,'bad');
insert into watched_list(user_id, movie_id, rating) values (12,4,'bad');
insert into watched_list(user_id, movie_id, rating) values (1,7,'bad');
insert into watched_list(user_id, movie_id, rating) values (3,11,'good');
insert into watched_list(user_id, movie_id, rating) values (21,16,'bad');
insert into watched_list(user_id, movie_id, rating) values (15,12,'bad');
insert into watched_list(user_id, movie_id, rating) values (20,20,'good');

-- WATCH_LIST TABLE
insert into watch_list(user_id, movie_id) values (27,4);
insert into watch_list(user_id, movie_id) values (15,5);
insert into watch_list(user_id, movie_id) values (13,7);
insert into watch_list(user_id, movie_id) values (4,1);
insert into watch_list(user_id, movie_id) values (23,6);
insert into watch_list(user_id, movie_id) values (10,13);
insert into watch_list(user_id, movie_id) values (15,7);
insert into watch_list(user_id, movie_id) values (27,4);
insert into watch_list(user_id, movie_id) values (16,16);
insert into watch_list(user_id, movie_id) values (13,12);
insert into watch_list(user_id, movie_id) values (29,1);
insert into watch_list(user_id, movie_id) values (16,14);
insert into watch_list(user_id, movie_id) values (17,2);
insert into watch_list(user_id, movie_id) values (3,16);
insert into watch_list(user_id, movie_id) values (2,18);
insert into watch_list(user_id, movie_id) values (14,4);
insert into watch_list(user_id, movie_id) values (13,9);
insert into watch_list(user_id, movie_id) values (4,13);
insert into watch_list(user_id, movie_id) values (20,4);
insert into watch_list(user_id, movie_id) values (9,5);

-- FRIENDS_LIST TABLE
insert into friends_list(user_id, friend_id) values (5,9);
insert into friends_list(user_id, friend_id) values (24,21);
insert into friends_list(user_id, friend_id) values (6,3);
insert into friends_list(user_id, friend_id) values (25,5);
insert into friends_list(user_id, friend_id) values (20,24);
insert into friends_list(user_id, friend_id) values (22,25);
insert into friends_list(user_id, friend_id) values (21,24);
insert into friends_list(user_id, friend_id) values (3,21);
insert into friends_list(user_id, friend_id) values (28,23);
insert into friends_list(user_id, friend_id) values (2,8);
insert into friends_list(user_id, friend_id) values (6,28);
insert into friends_list(user_id, friend_id) values (3,2);
insert into friends_list(user_id, friend_id) values (28,26);
insert into friends_list(user_id, friend_id) values (19,14);
insert into friends_list(user_id, friend_id) values (28,20);

-- RECOMMENDATIONS TABLE
insert into recommendations(user_id, movie_id) values(19,6);
insert into recommendations(user_id, movie_id) values(2,5);
insert into recommendations(user_id, movie_id) values(22,5);
insert into recommendations(user_id, movie_id) values(2,3);
insert into recommendations(user_id, movie_id) values(23,9);
insert into recommendations(user_id, movie_id) values(19,15);
insert into recommendations(user_id, movie_id) values(23,11);
insert into recommendations(user_id, movie_id) values(17,11);
insert into recommendations(user_id, movie_id) values(29,2);
insert into recommendations(user_id, movie_id) values(11,1);
insert into recommendations(user_id, movie_id) values(29,4);
insert into recommendations(user_id, movie_id) values(8,3);
insert into recommendations(user_id, movie_id) values(24,18);
insert into recommendations(user_id, movie_id) values(20,17);
insert into recommendations(user_id, movie_id) values(9,3);
insert into recommendations(user_id, movie_id) values(26,6);
insert into recommendations(user_id, movie_id) values(13,16);
insert into recommendations(user_id, movie_id) values(16,19);
insert into recommendations(user_id, movie_id) values(7,18);
insert into recommendations(user_id, movie_id) values(23,12);

/*
=====================================================================
                            VIEWS
=====================================================================
*/
-- CREATE 2 VIEWS

-- View #1 If user wishes to a list of the most recent releases
create view NEWEST_MOVIES as select m.title as Title, g.genre_name as Genre, 
    m.release_year as ReleaseDate, d.director_fname || ' ' || d.director_lname as Director
        from Movie m join Director d on m.director_id = d.director_id
            join Genre g on g.genre_id = m.genre_id
            where m.release_year > 2018;

-- View #2 View that list friends name of a specific user
create view FRIENDS as select s.first_name || ' ' || s.last_name as FriendsName
    from SERVICE_USER s join FRIENDS_LIST f on s.user_id = f.friend_id 
        where f.user_id like 28;
      
/*
=====================================================================
                            QUERIES
=====================================================================
*/

/*
10 QUERIES
    AT LEAST 2 GROUP BY and HAVING
    AT LEAST 2 JOIN STATEMENTS
    AT LEAST 1 INSERT STATEMENTS
    AT LEAST 2 UPDATE STATEMNETS
    AT LEAST 1 DELETE
*/
-- Query #1
select
    m.title,
    dir.director_lname || ', ' || dir.director_fname as DIRECTOR,
    g.genre_name as GENRE,
    m.release_year
from movie m
join director dir on dir.director_id = m.director_id
join genre g on g.genre_id = m.genre_id;

-- Query #2
select
    m.title,
    dir.director_lname || ', ' || dir.director_fname as DIRECTOR,
    g.genre_name as GENRE,
    m.release_year
from movie m
join director dir on dir.director_id = m.director_id
join genre g on g.genre_id = m.genre_id
join recommendations r on r.movie_id = m.movie_id
    where r.user_id = 23;

-- Query #3
select user_id, count(*) as NUMBER_OF_RECOMENDATIONS from recommendations group by user_id;

-- Query #4
select release_year, count(movie_id) as NUMBER_OF_FILMS from movie 
group by release_year having release_year >= 2010 order by release_year;

-- Query #5
select 
    m.title,
    count(r.movie_id) as TIMES_RECOMMENDED
from movie m
join recommendations r on r.movie_id = m.movie_id
group by m.title;

-- Query #6
delete from FRIENDS_LIST where USER_ID like 6 and FRIEND_ID like 3;

-- Query #7
insert into service_user(first_name, last_name, email) values ('John', 'Doe', 'johndoe@gmail.com');

-- Query #8
update service_user set first_name = 'Kevin', last_name = 'Hart' where user_id = 2;
-- select * from service_user where user_id = 2;

-- Query #9
update watched_list set rating = 'good' where user_id = 1 and movie_id = 15;
-- select * from watched_list where user_id = 1;

-- Query #10
select * from recommendations;
-- select * from recommendations;

--- ========================================================================
select * from service_user;
select * from movie;
select * from director;
select * from distributor;
select * from country;
select * from genre;
select * from watched_list;
select * from watch_list;
select * from friends_list;
select * from recommendations;
