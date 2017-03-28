-- Sara Ogorzalek
-- March 22, 2017
-- Lab 8

-- People  
CREATE TABLE people (
    pid 			CHAR(6) not null,
    firstName		text,
    lastName		text,
    address			text,
    birthDate		date not null,
    hairColor		text,
    eyeColor		text,
    heightIN		integer not null,
    weightLBS		integer not null,
    favoriteColor	text,
    primary key(pid)
    );

-- Actors
CREATE TABLE actors (
    pid				char(6) not null references people(pid),
    SAGdate 		date not null,
    primary key(pid)
    );
    
-- Directors
CREATE TABLE directors (
    pid				char(6) not null references people(pid),
    filmSchool		text,
    DGdate			date not null,
    favortieLens	text,
    primary key(pid)
    );
    
-- Spouses
CREATE TABLE spouses (
    pid				char(6) not null references people(pid),
    spouseFirstName	text,
    spouseLastName	text,
    primary key(pid)
    );
    
-- Movies
CREATE TABLE movies1 (
    mid				char(4) not null,
    name			text,
    yearReleased	date not null,
    mpaa			text,
    boSales			integer not null,
    fboSales		integer not null,
    dvdbrSales		integer not null,
    primary key(mid)
    );
    
-- Casting
CREATE TABLE casting1 (
    pid				char(4) not null references people(pid),
    mid				char(4) not null references movies1(mid),
    role			text,
    primary key(pid, mid, role)
    );


-- People   
INSERT INTO people (pid, firstName, lastName, address, birthDate, haircolor, eyeColor, heightIN, weightLBS, favoriteColor)
    VALUES('p001', 'Sean', 'Connery', '12 New York Ave, NY', '1990-07-21', 'Brown', 'Blue', '74', '200', 'Blue');
    
INSERT INTO people (pid, firstName, lastName, address, birthDate, haircolor, eyeColor, heightIN, weightLBS, favoriteColor)
    VALUES('p002', 'Sam', 'Mendes', '1 Pennslyvania Ave, PA', '1957-08-09', 'Red', 'Green', '78', '210', 'Yellow');
    
INSERT INTO people (pid, firstName, lastName, address, birthDate, haircolor, eyeColor, heightIN, weightLBS, favoriteColor)
    VALUES('p003', 'Pierce', 'Brosnan', '4 Remmington Road, VT', '1994-02-02', 'Blonde', 'Blue', '70', '160', 'Purple');
    
INSERT INTO people (pid, firstName, lastName, address, birthDate, haircolor, eyeColor, heightIN, weightLBS, favoriteColor)
    VALUES('p004', 'Roger', 'Moore', '27 George Street, NJ', '1981-11-20', 'Brown', 'Brown', '71', '190', 'Blue');
    
INSERT INTO people (pid, firstName, lastName, address, birthDate, haircolor, eyeColor, heightIN, weightLBS, favoriteColor)
    VALUES('p005', 'Guy', 'Hamilton', '129 Las Vegas Ave, NV', '1952-03-14', 'Blonde', 'Hazel', '72', '180', 'Orange');
    
INSERT INTO people (pid, firstName, lastName, address, birthDate, haircolor, eyeColor, heightIN, weightLBS, favoriteColor)
    VALUES('p006', 'Terence', 'Young', '161 Worth Ave, CA', '1965-01-17', 'Brown', 'Brown', '73', '175', 'Red');
 
-- Actors
INSERT INTO actors (pid, SAGdate)
	VALUES('p001', '2000-01-10');

INSERT INTO actors (pid, SAGdate)
	VALUES('p003', '2001-05-20');
    
INSERT INTO actors (pid, SAGdate)
	VALUES('p004', '2010-12-20');  
    
-- Directors    
INSERT INTO directors (pid, filmSchool, DGdate, favortieLens)
	VALUES('p002', 'New York Film Academy', '1989-06-05', 'Sony');
    
INSERT INTO directors (pid, filmSchool, DGdate, favortieLens)
	VALUES('p005', 'MET Film School', '1988-02-12', 'Samsung');
    
INSERT INTO directors (pid, filmSchool, DGdate, favortieLens)
	VALUES('p006', 'Florida Film School', '1990-10-10', 'Nikon');
    
-- Spouses
INSERT INTO spouses (pid, spouseFirstName, spouseLastName)
	VALUES('p001', 'Diane', 'Cilento');

INSERT INTO spouses (pid, spouseFirstName, spouseLastName)
	VALUES('p003', 'Cassandra', 'Harris');
    
INSERT INTO spouses (pid, spouseFirstName, spouseLastName)
	VALUES('p006', 'Sabine', 'Sun');
    
-- Movies
INSERT INTO movies1 (mid, name, yearReleased, mpaa, boSales, fboSales,dvdbrSales)
	VALUES('20', 'Spectre', '2015-01-01', 'PG', '10300400', '30020012', '4054503');
    
INSERT INTO movies1 (mid, name, yearReleased, mpaa, boSales, fboSales,dvdbrSales)
	VALUES('01', 'Goldfinger', '1964-01-01', 'PG', '90300400', '100256012', '4897503');
    
INSERT INTO movies1 (mid, name, yearReleased, mpaa, boSales, fboSales,dvdbrSales)
	VALUES('90', 'Casino Royale', '2006-01-01', 'PG', '10000000', '30362012', '32994503');   
    
-- Casting
INSERT INTO casting1 (pid, mid, role)
	VALUES('p001', '20', 'Actor');
    
INSERT INTO casting1 (pid, mid, role)
	VALUES('p002', '20', 'Director');
    
INSERT INTO casting1 (pid, mid, role)
	VALUES('p003', '20', 'Actor');
    
INSERT INTO casting1 (pid, mid, role)
	VALUES('p004', '90', 'Actor');
    
INSERT INTO casting1 (pid, mid, role)
	VALUES('p005', '90', 'Director');
    
INSERT INTO casting1 (pid, mid, role)
	VALUES('p006', '01', 'Director');
    
INSERT INTO casting1 (pid, mid, role)
	VALUES('p001', '01', 'Actor');   
    
-- SQL statements for displaying data
select *
from people;

select *
from actors;

select *
from directors;

select *
from spouses;

select *
from movies1;

select *
from casting1;
   
select *
from people p, actors a
where p.pid = a. pid;

select *
from people p, directors d
where p.pid = d.pid;

-- 4
select *
from people p, directors d
where p.pid = d.pid
	and p.pid != 'p001'
    and d.pid in (select pid
                  from casting1
                  where role = 'Director'
                  and mid in (select mid
                              from casting1
                              where pid = 'p001'
                             )
                   );