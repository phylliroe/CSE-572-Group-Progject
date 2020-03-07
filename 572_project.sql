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
                           CREATE TABLES
=====================================================================
*/
create table SERVICE_USER (
    user_id number(4, 0) not null,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    email varchar(255) not null,
    primary key (user_id, email)
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
                            INSERT DATA 
=====================================================================
*/
insert into service_user
values (1000, 'John', 'Doe', 'jdoe@gmail.com');


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


-- Query #2


-- Query #3


-- Query #4


-- Query #5


-- Query #6


-- Query #7 


-- Query #8


-- Query #9


-- Query #10



select * from service_user;






















