-- Sara Ogorzalek
-- May 2, 2017
-- Final Project
-- Daycare Center

-- People  
CREATE TABLE people (
    pid 			CHAR(6) not null,
    firstName		text,
    lastName		text,
    streetAddress	text,
    birthDate		date not null,
    zipCode			integer not null,
    primary key(pid),
    foreign key(zipCode) references states(zipCode)
    );

-- States
CREATE TABLE states (
    zipCode		integer not null unique,
    city 		text not null,
    state		text not null,
    primary key(zipCode)
    );
    
-- Staff
CREATE TABLE staff (
    sid				char(6) not null references people(pid),
    dateHired		date not null,
    primary key(sid)
    );
    
-- Caretakers
CREATE TABLE caretakers (
    careID			char(6) not null references people(pid),
    weeklyHours		numeric not null,
    salaryUSD		numeric not null,
    primary key(careID)
    );
    
-- Parent/Guardian
CREATE TABLE guardian (
    gid				char(4) not null references people(pid),
    homeContact		numeric not null,
    mobileContact	numeric not null,
    primary key(gid)
    ); 
    
-- Age Groups
CREATE TABLE agegroup (
    groupID			char(6) not null,
    ageGroup		text,
    primary key(groupID)
    );
    
-- Rooms
CREATE TABLE rooms (
    roomID			char(4) not null,
    name			text,
    capacity		numeric not null,
    groupID			char(6) not null,
    careID			char(6) not null,
    primary key(roomID),
    foreign key(groupID) references agegroup(groupID),
    foreign key(careID) references caretakers(careID)
    );
    
-- Children
CREATE TABLE children (
    cid				char(6) not null references people(pid),
    gid				char(6) not null,
    gender			text,
    weightLBS		numeric not null,
    heightIN		numeric not null,
    eyeColor		text,
    hairColor		text,
    roomID			char(6) not null,
    primary key(cid),
    foreign key(gid) references guardian(gid),
    foreign key(roomID) references rooms(roomID)
    );
    
-- Child Incidents
CREATE TABLE incidents (
    incidentID		char(6) not null,
    cid				char(6) not null,
    gid				char(6) not null,
    timeOfIncident	numeric not null,
    typeOfIncident	text,
    primary key(incidentID),
    foreign key(cid) references children(cid),
    foreign key(gid) references guardian(gid)
    );
    
-- Special Needs
CREATE TABLE specialneeds (
    cid				char(6) not null references children(cid),
    disorders		text,
    allergies		text,
    primary key(cid) 
    );
    
-- Toys
CREATE TABLE toys (
    toyID			char(6) not null,
    roomID			char(6) not null,
    name			text,
    cost			integer not null,
    manufacturer	text,
    purchaseDate	date not null,
    primary key(toyID),
    foreign key(roomID) references rooms(roomID)
    );
    
-- Staff Positions
CREATE TABLE positions (
    positionID		char(6) not null,
    sid				char(6) not null,
    title			text,
    salaryUSD		integer not null,
    primary key(positionID),
    foreign key(sid) references staff(sid)
    );

-- People  
-- staff
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p001', 'Alan', 'Laboseur', '3399 North Road', '1987-07-21', '12601');
-- CT    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p002', 'Sara', 'Ogorzalek', '194 David Road', '1995-07-06', '12601');
-- staff    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p003', 'Murray', 'Hanes', '12 Jerry Lane', '1980-04-22', '12538');
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p004', 'Kristi', 'Marksberry', '64 South Drive', '1970-01-21', '12524');
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p005', 'Marty', 'Vina', '9 West Lane', '1987-03-12', '12538');
    
-- child    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p006', 'David', 'Anding', '87 Alan Road', '2015-02-21', '12601');
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p007', 'Racheal', 'Lesh', '31 Pemprick Lane', '2015-08-20', '12601');
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p008', 'Jessica', 'Schiro', '1007 Pennsylvania Ave', '2015-09-11', '12524');    
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p009', 'Mark', 'Valencia', '6 Hollywood Blvd', '2015-02-14', '12601');
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p010', 'Matthew', 'Holland', '33 East Drive', '2014-03-07', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p011', 'Jenna', 'Abers', '3 Dis Drive', '2014-03-07', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p012', 'Mary', 'Erts', '1 Eighties Street', '2014-01-01', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p013', 'James', 'Baylor', '33 Victoria Lane', '2014-05-06', '12524'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p014', 'Ethan', 'Craft', '14 Main Street', '2014-04-04', '12601');  
-- child    
-- CT    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p015', 'Lynn', 'Books', '14 River Road', '1990-07-10', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p016', 'Linda', 'Maries', '1 Main Street', '1970-09-13', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p017', 'Marcus', 'Brown', '39 Marist Street', '1960-08-07', '12601');     
-- parents
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p018', 'Lila', 'Anding', '87 Alan Road', '1980-01-21', '12601');
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p019', 'Justine', 'Lesh', '31 Pemprick Lane', '1970-05-20', '12601');
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p020', 'Kimberly', 'Schiro', '1007 Pennsylvania Ave', '1988-07-01', '12524');    
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p021', 'Mike', 'Valencia', '6 Hollywood Blvd', '1986-03-04', '12601');
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p022', 'Megan', 'Holland', '33 East Drive', '1989-09-09', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p023', 'Paloma', 'Abers', '3 Dis Drive', '1990-10-10', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p024', 'Lisa', 'Erts', '1 Eighties Street', '1993-12-12', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p025', 'James', 'Baylor', '33 Victoria Lane', '1987-11-12', '12524'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p026', 'Emily', 'Craft', '14 Main Street', '1987-11-10', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p027', 'Hannah', 'White', '18 Fox Lane', '1990-10-09', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p028', 'Kathryn', 'Moore', '5 Wendy Way', '1989-10-12', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p029', 'Jacob', 'Brushe', '90 Lola Street', '1986-06-12', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p030', 'Lauren', 'Pack', '1009 Terren Street', '1982-05-11', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p031', 'Elizabeth', 'Torns', '3 Shadow Street', '1889-03-05', '12524');    
    
-- child
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p032', 'Jamie', 'White', '18 Fox Lane', '2013-08-09', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p033', 'Cody', 'Moore', '5 Wendy Way', '2013-07-08', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p034', 'Chris', 'Brushe', '90 Lola Street', '2013-06-07', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p035', 'Jennifer', 'Pack', '1009 Terren Street', '2013-05-06', '12601'); 
    
INSERT INTO people (pid, firstName, lastName, streetAddress, birthDate, zipCode)
    VALUES('p036', 'Nick', 'Torns', '3 Shadow Street', '2013-04-05', '12524');  
    
select *
from people;

-- States
INSERT INTO states (zipCode, city, state)
	VALUES('12601', 'Poughkeepsie', 'New York');
    
INSERT INTO states (zipCode, city, state)
	VALUES('12524', 'Fishkill', 'New York');
   
INSERT INTO states (zipCode, city, state)
	VALUES('12538', 'Hyde Park', 'New York');  
    
select *
from states;

-- Staff    
INSERT INTO staff (sid, dateHired)
	VALUES('p001', '2016-06-05');
    
INSERT INTO staff (sid, dateHired)
	VALUES('p003', '2016-01-02');
    
INSERT INTO staff (sid, dateHired)
	VALUES('p004', '2016-01-09'); 
    
INSERT INTO staff (sid, dateHired)
	VALUES('p005', '2017-01-01'); 
    
select * 
from staff;
    
-- Caretakers
INSERT INTO caretakers (careID, weeklyHours, salaryUSD)
	VALUES('p002', '30', '30000');

INSERT INTO caretakers (careID, weeklyHours, salaryUSD)
	VALUES('p015', '30', '31000');
    
INSERT INTO caretakers (careID, weeklyHours, salaryUSD)
	VALUES('p016', '30', '30000');
    
INSERT INTO caretakers (careID, weeklyHours, salaryUSD)
	VALUES('p017', '15', '16000');  
    
select *
from caretakers;
    
-- Parent/Guardian
INSERT INTO guardian (gid, homeContact, mobileContact)
	VALUES('p018', '8451001000', '8456776777');

INSERT INTO guardian (gid, homeContact, mobileContact)
	VALUES('p019', '8457891099', '8456123477');
    
INSERT INTO guardian (gid, homeContact, mobileContact)
	VALUES('p020', '8451001456', '8456267777');
    
INSERT INTO guardian (gid, homeContact, mobileContact)
	VALUES('p021', '8451000324', '8456770990');
    
INSERT INTO guardian (gid, homeContact, mobileContact)
	VALUES('p022', '8451010865', '8456778822');
    
INSERT INTO guardian (gid, homeContact, mobileContact)
	VALUES('p023', '8451010111', '8456775647');
    
INSERT INTO guardian (gid, homeContact, mobileContact)
	VALUES('p024', '8450010020', '8457660077');
    
INSERT INTO guardian (gid, homeContact, mobileContact)
	VALUES('p025', '8450010857', '8456776111');
    
INSERT INTO guardian (gid, homeContact, mobileContact)
	VALUES('p026', '8451014442', '8456776094');
    
INSERT INTO guardian (gid, homeContact, mobileContact)
	VALUES('p027', '845117132', '8456754782');
    
INSERT INTO guardian (gid, homeContact, mobileContact)
	VALUES('p028', '8451018733', '8445776773');
    
INSERT INTO guardian (gid, homeContact, mobileContact)
	VALUES('p029', '8451019999', '8459766755');
    
INSERT INTO guardian (gid, homeContact, mobileContact)
	VALUES('p030', '8450013474', '8456776744');
   
INSERT INTO guardian (gid, homeContact, mobileContact)
	VALUES('p031', '8451001131', '8456776122'); 
    
select *
from guardian;

-- Age Groups
INSERT INTO agegroup (groupID, ageGroup)  
	VALUES('grp1', 'toddler');
    
INSERT INTO agegroup (groupID, ageGroup)  
	VALUES('grp2', 'early preschool');
    
INSERT INTO agegroup (groupID, ageGroup)  
	VALUES('grp3', 'preschool');  
    
select * 
from agegroup;

-- Rooms
INSERT INTO rooms (roomID, name, capacity, groupID, careID)
	VALUES('rm1', 'Caterpillar Room', '10', 'grp1', 'p002');

INSERT INTO rooms (roomID, name, capacity, groupID, careID)
	VALUES('rm2', 'Butterfly Room', '12', 'grp2', 'p015');
    
INSERT INTO rooms (roomID, name, capacity, groupID, careID)
	VALUES('rm3', 'Sunnyside Room', '15', 'grp3', 'p016');
    
select *
from rooms;
    
-- Children
INSERT INTO children (cid, gid, gender, weightLBS, heightIN, eyecolor, hairColor, roomID)
    VALUES('p006', 'p018', 'male', '30', '36', 'blue', 'blonde', 'rm1');
    
INSERT INTO children (cid, gid, gender, weightLBS, heightIN, eyecolor, hairColor, roomID)
    VALUES('p007', 'p019', 'female', '25', '30', 'blue', 'brown', 'rm1');
        
INSERT INTO children (cid, gid, gender, weightLBS, heightIN, eyecolor, hairColor, roomID)
    VALUES('p008', 'p020', 'female', '29', '32', 'brown', 'brown', 'rm1');   
      
INSERT INTO children (cid, gid, gender, weightLBS, heightIN, eyecolor, hairColor, roomID)
    VALUES('p009', 'p021', 'male', '32', '34', 'hazel', 'red', 'rm1');
      
INSERT INTO children (cid, gid, gender, weightLBS, heightIN, eyecolor, hairColor, roomID)
    VALUES('p010', 'p022', 'male', '37', '33', 'brown', 'brown', 'rm2');
        
INSERT INTO children (cid, gid, gender, weightLBS, heightIN, eyecolor, hairColor, roomID)
    VALUES('p011', 'p023', 'female', '27', '29', 'brown', 'brown', 'rm2'); 
        
INSERT INTO children (cid, gid, gender, weightLBS, heightIN, eyecolor, hairColor, roomID)
    VALUES('p012', 'p024', 'female', '35', '32', 'green', 'blonde', 'rm2');
        
INSERT INTO children (cid, gid, gender, weightLBS, heightIN, eyecolor, hairColor, roomID)
    VALUES('p013', 'p025', 'male', '34', '38', 'blue', 'blonde', 'rm2');
        
INSERT INTO children (cid, gid, gender, weightLBS, heightIN, eyecolor, hairColor, roomID)
    VALUES('p014', 'p026', 'male', '24', '29', 'brown', 'red', 'rm2');
        
INSERT INTO children (cid, gid, gender, weightLBS, heightIN, eyecolor, hairColor, roomID)
    VALUES('p032', 'p027', 'female', '30', '31', 'blue', 'brown', 'rm3');
        
INSERT INTO children (cid, gid, gender, weightLBS, heightIN, eyecolor, hairColor, roomID)
    VALUES('p033', 'p028', 'male', '45', '40', 'blue', 'blonde', 'rm3');
        
INSERT INTO children (cid, gid, gender, weightLBS, heightIN, eyecolor, hairColor, roomID)
    VALUES('p034', 'p029', 'male', '40', '37', 'green', 'brown', 'rm3');
        
INSERT INTO children (cid, gid, gender, weightLBS, heightIN, eyecolor, hairColor, roomID)
    VALUES('p035', 'p030', 'female', '39', '32', 'brown', 'brown', 'rm3');
        
INSERT INTO children (cid, gid, gender, weightLBS, heightIN, eyecolor, hairColor, roomID)
    VALUES('p036', 'p031', 'male', '41', '39', 'blue', 'brown', 'rm3');
        
select *
from children;

-- Child Incidents
INSERT INTO incidents (incidentID, cid, gid, timeOfIncident, typeOfIncident)
    VALUES('inc19', 'p006', 'p018', '12', 'scrape knee');
    
INSERT INTO incidents (incidentID, cid, gid, timeOfIncident, typeOfIncident)
    VALUES('inc20', 'p011', 'p023', '10', 'bumped head');

INSERT INTO incidents (incidentID, cid, gid, timeOfIncident, typeOfIncident)
    VALUES('inc21', 'p036', 'p031', '9', 'sand in eye');
    
INSERT INTO incidents (incidentID, cid, gid, timeOfIncident, typeOfIncident)
    VALUES('inc22', 'p008', 'p020', '8', 'got sick after snack');
    
INSERT INTO incidents (incidentID, cid, gid, timeOfIncident, typeOfIncident)
    VALUES('inc23', 'p014', 'p026', '9', 'fight with other child');    

select *
from incidents;

-- Special Needs    
INSERT INTO specialneeds (cid, disorders, allergies)
    VALUES('p012', '', 'milk allergy');
    
INSERT INTO specialneeds (cid, disorders, allergies)
    VALUES('p033', '', 'peanut allergy'); 
    
INSERT INTO specialneeds (cid, disorders, allergies)
    VALUES('p036', 'dyslexic', NULL); 
    
INSERT INTO specialneeds (cid, disorders, allergies)
    VALUES('p035', 'autism', NULL); 
    
INSERT INTO specialneeds (cid, disorders, allergies)
    VALUES('p007', '', 'tree nut allergy');     
    
select *
from specialneeds;

-- Toys
INSERT INTO toys (toyID, roomID, name, cost, manufacturer, purchaseDate)
	VALUES('toy001', 'rm1', 'Jack-in-the-Box', '10', 'Mattel', '2016-02-01');

INSERT INTO toys (toyID, roomID, name, cost, manufacturer, purchaseDate)
	VALUES('toy002', 'rm1', 'Work Bench', '30', 'Fisher-Price', '2016-01-01');
    
INSERT INTO toys (toyID, roomID, name, cost, manufacturer, purchaseDate)
	VALUES('toy003', 'rm1', 'Easel', '30', 'Fisher-Price', '2016-01-01');
    
INSERT INTO toys (toyID, roomID, name, cost, manufacturer, purchaseDate)
	VALUES('toy004', 'rm1', 'Art Toy Box', '50', 'Mattel', '2016-01-01');
    
INSERT INTO toys (toyID, roomID, name, cost, manufacturer, purchaseDate)
	VALUES('toy005', 'rm1', 'Sandbox', '60', 'Mattel', '2016-03-01');
    
INSERT INTO toys (toyID, roomID, name, cost, manufacturer, purchaseDate)
	VALUES('toy006', 'rm2', 'toy car', '15', 'Hot Wheels', '2016-04-07');
    
INSERT INTO toys (toyID, roomID, name, cost, manufacturer, purchaseDate)
	VALUES('toy007', 'rm2', 'Buzz Lightyear', '30', 'Mattel', '2016-02-09');
    
INSERT INTO toys (toyID, roomID, name, cost, manufacturer, purchaseDate)
	VALUES('toy008', 'rm2', 'Kitchen Set', '40', 'Fisher-Price', '2016-01-03');
    
INSERT INTO toys (toyID, roomID, name, cost, manufacturer, purchaseDate)
	VALUES('toy009', 'rm2', 'Dollhouse', '35', 'Mattel', '2016-01-10');
    
INSERT INTO toys (toyID, roomID, name, cost, manufacturer, purchaseDate)
	VALUES('toy010', 'rm2', 'Crayola Touch', '15', 'Mattel', '2016-02-11');
    
INSERT INTO toys (toyID, roomID, name, cost, manufacturer, purchaseDate)
	VALUES('toy011', 'rm3', 'Dinosaur Play Set', '20', 'Mattel', '2016-03-01');
    
INSERT INTO toys (toyID, roomID, name, cost, manufacturer, purchaseDate)
	VALUES('toy012', 'rm3', 'Art Sketcher', '10', 'Mattel', '2016-04-01');
    
INSERT INTO toys (toyID, roomID, name, cost, manufacturer, purchaseDate)
	VALUES('toy013', 'rm3', 'Ken doll', '20', 'Mattel', '2016-01-01');
    
INSERT INTO toys (toyID, roomID, name, cost, manufacturer, purchaseDate)
	VALUES('toy014', 'rm3', 'Barbie doll', '20', 'Mattel', '2016-01-01');    
    
INSERT INTO toys (toyID, roomID, name, cost, manufacturer, purchaseDate)
	VALUES('toy015', 'rm3', 'Lego', '40', 'LEGO', '2016-01-01');        
    
select *
from toys;

-- Staff Positions
INSERT INTO positions (positionID, sid, title, salaryUSD)
    VALUES('pos1', 'p001', 'supervisor', '100000000');
    
INSERT INTO positions (positionID, sid, title, salaryUSD)
    VALUES('pos2', 'p003', 'janitor', '25000');
    
INSERT INTO positions (positionID, sid, title, salaryUSD)
    VALUES('pos3', 'p004', 'nurse', '30000');
    
INSERT INTO positions (positionID, sid, title, salaryUSD)
    VALUES('pos4', 'p005', 'security guard', '27000'); 
    
select *
from positions;

-- VIEWS
CREATE VIEW ChildrenGuardian AS
SELECT firstName, lastName, guardian.mobileContact as GuardianContact 
FROM people
inner join guardian
ON people.pid = guardian.gid;

select *
from ChildrenGuardian;

CREATE VIEW CaretakerRoom AS
SELECT firstName, lastName, caretakers.careID as TeacherID, rooms.name as RoomName
FROM people
inner join caretakers
ON people.pid = caretakers.careID
inner join rooms
ON people.pid = rooms.careID;

select *
from CaretakerRoom;

-- Reports
-- number of children w blue eyes 
SELECT COUNT(pid) as blueEyeChildren
FROM people
inner join children
on people.pid = children.cid
WHERE eyeColor = 'blue';

-- names of toys whos price is above the average cost in alpha order
SELECT t.name, t.cost
FROM toys t
where t.cost > (SELECT AVG(t.cost)
                FROM toys t
                )
ORDER BY t.name ASC;

-- num of people who live in hyde park 
SELECT COUNT(pid) as HydeParkResidents
FROM people
inner join states
on states.zipCode = people.zipCode
WHERE city = 'Hyde Park';

-- ids and names of children who have an allergy
SELECT pid, firstName, lastName, specialneeds.allergies
FROM people
inner join specialneeds
ON people.pid = specialneeds.cid
WHERE specialneeds.allergies is not null;

-- Stored procedures
-- returns all type of incidents for given child id number
CREATE OR REPLACE FUNCTION IncidentsOf (char(6), REFCURSOR) returns refcursor as $$
DECLARE	
			targetIncident	char(6) :=$1;
            resultset		REFCURSOR :=$2;
BEGIN 
			open resultset for
            SELECT typeOfIncident
            FROM incidents
            WHERE cid = targetIncident;
        RETURN resultset;
END;
$$
language plpgsql;

select IncidentsOf('p036', 'results');
fetch all from results;

-- returns room name for given toy name
CREATE OR REPLACE FUNCTION InRoom (text, REFCURSOR) returns refcursor as $$
DECLARE	
			targetRoom		text :=$1;
            resultset		REFCURSOR :=$2;
BEGIN 
			open resultset for
            SELECT rooms.name
            FROM rooms
            inner join toys
    		ON rooms.roomID = toys.roomID
            WHERE toys.name = targetRoom;
        RETURN resultset;
END;
$$
language plpgsql;

select InRoom('Barbie doll', 'results');
fetch all from results;

-- Trigger
CREATE OR REPLACE FUNCTION NewChild()
RETURNS trigger AS 
$$
BEGIN
	IF NEW.is_children = true THEN
    	INSERT INTO children VALUES(NEW.cid, NEW.gid, NEW.gender, NEW.weightLBS, 
                                    NEW.heightIN, NEW.eyeColor, NEW.hairColor, NEW.roomID);
    END IF;
    RETURN NEW;
END;
$$
language plpgsql;

CREATE TRIGGER addChild
AFTER INSERT OR UPDATE ON people
FOR EACH ROW
EXECUTE PROCEDURE NewChild();

-- Security

CREATE ROLE admin;
GRANT ALL ON ALL TABLES IN SCHEMA PUBLIC TO admin;

CREATE ROLE staff;
REVOKE ALL ON ALL TABLES IN SCHEMA PUBLIC FROM staff;
GRANT SELECT ON ALL TABLES IN SCHEMA PUBLIC TO staff;
GRANT INSERT ON  people, guardian, staff, incidents
TO staff;
GRANT UPDATE ON  people, guardian, staff, incidents
TO staff;

CREATE ROLE caretakers;
REVOKE ALL ON ALL TABLES IN SCHEMA PUBLIC FROM caretakers;
GRANT SELECT ON ALL TABLES IN SCHEMA PUBLIC TO caretakers;
GRANT INSERT ON people, guardian, incidents, specialneeds
TO caretakers;
GRANT UPDATE ON people, guardian, incidents, specialneeds
TO caretakers;




    
