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
    user_id number(4) GENERATED by default on null as IDENTITY,
    first_name varchar(15) not null,
    last_name varchar(15) not null,
    email varchar(35) not null,
    primary key (user_id, email)
);
-- insert into service_user(first_name, last_name, email) values ('John', 'Doe', 'johndoe@gmail.com');

create table DIRECTOR (
    director_id number(4) GENERATED by default on null as IDENTITY primary key,
    director_fname varchar(15) not null,
    director_lname varchar(15) not null
);

create table DISTRIBUTOR (
    dist_id number(4) GENERATED by default on null as IDENTITY primary key,
    dist_name varchar(25) not null unique
);

create table GENRE (
    genre_id number(4) GENERATED by default on null as IDENTITY primary key,
    genre_name varchar(15) not null unique
);

create table COUNTRY (
    country_id number(4) GENERATED by default on null as IDENTITY primary key,
    country varchar(15) not null unique
);

create table MOVIE (
    movie_id number(4) GENERATED by default on null as IDENTITY primary key,
    title varchar(35) not null,
    director_id number(4) references DIRECTOR(director_id) not null,
    dist_id number(4) references DISTRIBUTOR(dist_id) not null,
    genre_id number(4) references GENRE(genre_id) not null,
    country_id number(4) references COUNTRY(country_id) not null,
    release_year number(4) not null
);
-- insert into movie(title, director_id, distributor_id, country_id, genre_id, release_year) values ('The Movie',2,2,4,4,2002);

create table WATCHED_LIST (
    id NUMBER(4) GENERATED by default on null as IDENTITY primary key,
    user_id number(4) references SERVICE_USER(user_id) not null,
    movie_id number(4) references MOVIE(movie_id) not null,
    rating varchar(10) CHECK (rating='good' OR rating='bad' OR rating=null)
);
-- INSERT INTO WATCHED_LIST(user_id, movie_id, rating) VALUES (1234,4332,'good');
-- INSERT INTO WATCHED_LIST(user_id, movie_id) VALUES (1234,4332);
-- INSERT INTO WATCHED_LIST(user_id, movie_id, rating) VALUES (1234,4333,'good');

create table WATCH_LIST (
    id NUMBER(4) GENERATED by default on null as IDENTITY primary key,
    user_id number(4) references SERVICE_USER(user_id) not null,
    movie_id number(4) references MOVIE(movie_id) not null,
);

create table FRIENDS_LIST (
    id NUMBER(4) GENERATED by default on null as IDENTITY primary key,
    user_id number(4) references SERVICE_USER(user_id) not null,
    friend_id number(4) references SERVICE_USER(user_id) not null,
);

create table RECOMMENDATIONS (
    id NUMBER(4) GENERATED by default on null as IDENTITY primary key,
    user_id number(4) references SERVICE_USER(user_id) not null,
    movie_id number(4) references MOVIES(movie_id) not null,
);

/*
=====================================================================
                            INSERT DATA
=====================================================================
*/
-- SERVICE USER
insert into service_user(first_name, last_name, email) values ('John', 'Doe', 'johndoe@gmail.com');
insert into service_user values (1000, 'John', 'Doe', 'jdoe@gmail.com');

-- DIRECTOR
insert into director values (10, 'Steven', 'Spielberg');
insert into director values (11, 'Christopher', 'Nolan');
insert into director values (12, 'Akira', 'Kurosawa');

-- DISTRIBUTOR
insert into distributor values (10, 'Universal');
insert into distributor values (11, 'Paramount');
insert into distributor values (12, 'Toho');

-- GENRE
insert into genre values (10, 'Science Fiction');
insert into genre values (20, 'Action');
insert into genre values (30, 'Drama');

-- COUNTRY
insert into country values (10, 'United Kingdom');
insert into country values (20, 'United States');
insert into country values (30, 'Japan');

-- MOVIE
insert into movie(title, director_id, distributor_id, country_id, genre_id, release_year)
    values ('The Movie',2,2,4,4,2002);
insert into movie
values (
    1000,
    'Jurassic Park',
    (select director_id from director where director_id = 10),
    (select dist_id from distributor where dist_id = 10),
    (select genre_id from genre where genre_id = 10),
    (select country_id from country where country = 'United States'),
    1993
);

insert into movie
values (
    1001,
    'Raiders of the Lost Ark',
    (select director_id from director where director_id = 10),
    (select dist_id from distributor where dist_id = 11),
    (select genre_id from genre where genre_id = 20),
    (select country_id from country where country_id = 20),
    1981
);

insert into movie
values (
    1002,
    'Seven Samurai',
    (select director_id from director where director_id = 12),
    (select dist_id from distributor where dist_id = 12),
    (select genre_id from genre where genre_id = 30),
    (select country_id from country where country_id = 30),
    1954
);

/*
=====================================================================
                            VIEWS
=====================================================================
*/
-- CREATE 2 VIEWS

-- View #1


-- View #2


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


-- Query #3


-- Query #4


-- Query #5


-- Query #6


-- Query #7


-- Query #8


-- Query #9


-- Query #10





--- ========================================================================
select * from service_user;
select * from director;
select * from movie;
select * from country;
select * from genre;
select * from distributor;
