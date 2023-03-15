-- Drop Sequence
drop table Scores;
drop table Results;
drop table Matches;
drop table Players;
drop table Teams;
drop table Stadiums;

-- Table Creation
create table Stadiums
(
	id_stadium integer NOT NULL,
	full_name varchar(32) NOT NULL,
	capacity integer NOT NULL,
	city varchar(32) NOT NULL,
	primary key (id_stadium)
);

create table Teams(
	id_team integer,
	id_stadium integer,
	name varchar(32) NOT NULL,
	primary key (id_team),
	Foreign key (id_stadium) references Stadiums On delete cascade
);

create table Players(
	id_player integer,
	id_team integer NOT NULL,
	name varchar(32),
	position varchar(10) not null check(position = 'Goalkeeper' OR position = 'Defender' OR position = 'Midfielder' OR position = 'Forward'),
	country varchar(32) not null,
	Primary key (id_player),
	Foreign key (id_team) references Teams On delete cascade
);

create table Matches(
	id_match integer,
	id_home integer not null,
	id_away integer not null,
	id_stadium integer not null,
	date_time varchar(32) not null,
	attendance integer not NULL,
	primary key (id_match),
	Foreign key (id_home) references Teams On delete cascade,
	Foreign key (id_away) references Teams On delete cascade,
	Foreign key (id_stadium) references Stadiums On delete cascade
);

create table Results(
	id_match integer primary key references Matches(id_match),
	home integer not NULL check(home >= 0),
	away integer not NULL check(away >= 0)
);

create table Scores(
	id_score integer,
	id_match integer,
	id_team integer,
	id_player integer,
	goals integer not NULL check(goals >= 0),
	assists integer not NULL check(assists >= 0),
	primary key (id_score),
	Foreign key (id_player) references Players On delete cascade,
	Foreign key (id_match) references Matches On delete cascade,
	Foreign key (id_team) references Teams On delete cascade
);

-- ALTER TABLE command allows to add, modify, rename or drop a column
ALTER TABLE Stadiums ADD Test_column varchar(10);
ALTER TABLE Stadiums ADD (T1 integer,T2 integer,T3 integer);
ALTER TABLE Stadiums MODIFY Test_column integer;
ALTER TABLE Stadiums MODIFY (T1 varchar(10),T2 varchar(10), T3 varchar(10));
ALTER TABLE Stadiums RENAME COLUMN Test_column to T0;
ALTER TABLE Stadiums DROP COLUMN T0;
ALTER TABLE Stadiums DROP COLUMN T1;
ALTER TABLE Stadiums DROP COLUMN T2;
ALTER TABLE Stadiums DROP COLUMN T3;


-- Insert into Stadiums
insert into stadiums values(1, 'San Siro', 80018, 'Milan');
insert into stadiums values(2, 'Camp Nou', 99354, 'Barcelona');
insert into stadiums values(3, 'Westfalenstadion', 81365, 'Dortmund');
insert into stadiums values(4, 'Groupama Stadium', 59186, 'Décines');
insert into stadiums values(5, 'Borisov Arena', 13126, 'Barysaw');
insert into stadiums values(6, 'Veltins-Arena', 61673, 'Gelsenkirchen');
insert into stadiums values(7, 'Stadion im. Henryka Reymana', 32804, 'Kraków');
insert into stadiums values(8, 'Parc des Princes', 48527, 'Paris');
insert into stadiums values(9, 'Allianz Stadium', 41507, 'Munich');
insert into stadiums values(10, 'Johan Cruyff Arena', 54033, 'Amsterdam');
insert into stadiums values(11, 'Stadion Wojska Polskiego', 30800, 'Warsaw');
insert into stadiums values(12, 'Otkritie Arena', 45360, 'Moscow');

-- Insert into Teams
insert into teams values(1, 1, 'AC Milan');
insert into teams values(2, 2, 'FC Barcelona');
insert into teams values(3, 3, 'Borussia Dortmund');
insert into teams values(4, 4, 'Lyon');

insert into teams values(5, 5, 'BATE Borisov');
insert into teams values(6, 6, 'Schalke 04');
insert into teams values(7, 7, 'Wisła Cracow');
insert into teams values(8, 8, 'Paris Saint-Germain');
insert into teams values(9, 9, 'Juventus');

-- Insert into Players
--AC Milan
insert into players values(1, 1, 'Fredrik', 'Goalkeeper', 'Sweden');
insert into players values(2, 1, 'Marcus', 'Defender', 'Scotland');
insert into players values(3, 1, 'Matias', 'Defender', 'Sweden');
insert into players values(4, 1, 'Kalle', 'Defender', 'Finland');
insert into players values(5, 1, 'Rune', 'Defender', 'Iceland');
insert into players values(6, 1, 'Sven', 'Defender', 'Norway');
insert into players values(7, 1, 'Petr', 'Midfielder', 'Russia');
insert into players values(8, 1, 'Lars', 'Midfielder', 'Finland');
insert into players values(9, 1, 'Piter','Midfielder', 'Scotland');
insert into players values(10, 1, 'Max', 'Forward', 'England');
insert into players values(11, 1, 'Oliver', 'Forward', 'England');
-- FC Barcelona
insert into players values(12, 2, 'ter Stegen', 'Goalkeeper', 'Germany');
insert into players values(13, 2, 'Romanos', 'Defender', 'Argentina');
insert into players values(14, 2, 'Roberto', 'Defender', 'Spain');
insert into players values(15, 2, 'Fabio', 'Defender', 'Argentina');
insert into players values(16, 2, 'Piqué', 'Defender', 'Spain');
insert into players values(17, 2, 'Busquets', 'Midfielder', 'Spain');
insert into players values(18, 2, 'Karim', 'Midfielder', 'Lebanon');
insert into players values(19, 2, 'Gavi', 'Midfielder', 'Spain');
insert into players values(20, 2, 'Pedri', 'Midfielder', 'Spain');
insert into players values(21, 2, 'Aubameyang', 'Forward', 'Gabon');
insert into players values(22, 2, 'Messi', 'Forward', 'Argentina');
-- Dortmund
insert into players values(23, 3, 'Jens', 'Goalkeeper', 'Netherlands');
insert into players values(24, 3, 'Xavier', 'Defender', 'Netherlands');
insert into players values(25, 3, 'Mattias', 'Defender', 'Netherlands');
insert into players values(26, 3, 'Eaat', 'Defender', 'Netherlands');
insert into players values(27, 3, 'Olaf', 'Defender', 'England');
insert into players values(28, 3, 'Pascal', 'Defender', 'Australia');
insert into players values(29, 3, 'William', 'Midfielder', 'France');
insert into players values(30, 3, 'Roger', 'Midfielder', 'Germany');
insert into players values(31, 3, 'Oliver', 'Midfielder', 'Germany');
insert into players values(32, 3, 'Hazel', 'Midfielder', 'Germany');
insert into players values(33, 3, 'Michael', 'Forward', 'Germany');
-- Olympique Lyonnais
insert into players values(34, 4, 'Patrick', 'Goalkeeper', 'France');
insert into players values(35, 4, 'Jurgen', 'Defender', 'Belgium');
insert into players values(36, 4, 'Pablo', 'Defender', 'Lichtenstein');
insert into players values(37, 4, 'Otto', 'Defender', 'Australia');
insert into players values(38, 4, 'Marini', 'Midfielder', 'Italy');
insert into players values(39, 4, 'Thomas', 'Midfielder', 'Italy');
insert into players values(40, 4, 'Omar', 'Midfielder', 'Wales');
insert into players values(41, 4, 'Samuel', 'Midfielder', 'Cameroon');
insert into players values(42, 4, 'Javier', 'Midfielder', 'Argentina');
insert into players values(43, 4, 'Carles', 'Forward', 'Spain');
insert into players values(44, 4, 'Santos', 'Forward', 'Brazil');

-- Extra player to delete 
insert into players values(45,4, 'DEMO', 'Forward', 'DEMO');

-- Insert into Matches
-- id_match, id_home, id_away, id_stadium, time, attendance
insert into matches values(1, 1, 2, 1, '10-FEB-2007', 69454);
insert into matches values(2, 3, 4, 3, '15-FEB-2007', 59470);
insert into matches values(3, 2, 4, 2, '18-FEB-2007', 85623);
insert into matches values(4, 3, 1, 3, '11-DEC-2007', 40087);
insert into matches values(5, 4, 1, 4, '17-DEC-2007', 25639);
insert into matches values(6, 2, 3, 2, '29-DEC-2007', 77548);

-- Insert into Results
-- id_match, home_team_goals, away_team_goals
insert into results values(1, 4, 1);
insert into results values(2, 1, 2);
insert into results values(3, 2, 0);
insert into results values(4, 0, 3);
insert into results values(5, 0, 3);
insert into results values(6, 2, 0);

-- Insert into Scores
-- id_score, id_match, id_team, id_player, goals, assists
insert into scores values(1, 1, 1, 7, 0, 1);
insert into scores values(2, 1, 1, 9, 1, 2);
insert into scores values(3, 1, 1, 10, 1, 0);
insert into scores values(4, 1, 1, 11, 2, 1);
insert into scores values(5, 1, 2, 18, 0, 1);
insert into scores values(6, 1, 2, 22, 1, 0);

insert into scores values(7, 2, 3, 31, 0, 1);
insert into scores values(8, 2, 3, 33, 1, 0);
insert into scores values(9, 2, 4, 40, 0, 1);
insert into scores values(10, 2, 4, 41, 0, 1);
insert into scores values(11, 2, 4, 43, 1, 0);
insert into scores values(12, 2, 4, 44, 1, 0);

insert into scores values(13, 3, 2, 18, 0, 1);
insert into scores values(14, 3, 2, 19, 0, 1);
insert into scores values(15, 3, 2, 22, 2, 0);

insert into scores values(16, 4, 1, 6, 0, 1);
insert into scores values(17, 4, 1, 7, 0, 2);
insert into scores values(18, 4, 1, 9, 1, 0);
insert into scores values(19, 4, 1, 10, 1, 0);
insert into scores values(20, 4, 1, 11, 1, 0);

insert into scores values(21, 5, 1, 7, 0, 1);
insert into scores values(22, 5, 1, 8, 0, 1);
insert into scores values(23, 5, 1, 9, 0, 1);
insert into scores values(24, 5, 1, 10, 3, 0);

insert into scores values(25, 6, 2, 19, 0, 1);
insert into scores values(26, 6, 2, 20, 1, 0);
insert into scores values(27, 6, 2, 21, 0, 1);
insert into scores values(28, 6, 2, 22, 1, 0);


select * from Stadiums;
select * from Teams;
select * from Players;
select * from Matches;
select * from Results;
select * from Scores;

--UPDATE syntax is used in case of updating a value which is already in the table

UPDATE matches set attendance=59000 where id_match = 2;
select * from Matches;

DELETE from Players where country='DEMO';

select name from Teams;

select country from players;
select DISTINCT country as C from players;

select * from Matches where attendance between 50000 AND 70000;

select * from Matches where attendance IN (59000, 70000);

select * from Matches where attendance NOT IN (59000, 70000);

select * from Players where country LIKE '%land';

select full_name,city,capacity as STD from Stadiums order by capacity desc;

--Aggregrate functions

select MAX(attendance) from matches;
select MIN(attendance) from matches;

--number of English players
select COUNT(id_player) from players where country='England';

-- Average Capacity of Stadiums
select AVG(capacity) as AVG_CAPACITY from stadiums;
select AVG(NVL(capacity,0)) as AVG_CAPACITY from Stadiums;

select SUM(attendance) as TOTAL_ATTENDACE from Matches;

select COUNT(DISTINCT(country)) from players;
select COUNT(DISTINCT(city)) from Stadiums;

-- Group BY, Having

-- How many players from each country?
select country,COUNT(id_player) as Total_Players
from players 
group by country;

-- How many players from each country? by descending order
select country,COUNT(id_player) as Total_Players
from players 
group by country
order by Total_Players desc;

-- Number of Matches where Home team won
select COUNT(id_match) from results where home>away;

-- WHERE keyword cannot be used with aggregate functions.
-- A HAVING condition can refer only to an expression in the SELECT list, 
-- or to an expression involving an aggregate function.

select country,COUNT(id_player) as Total_Players
from players 
group by country
Having COUNT(id_player) > 2
order by Total_Players desc;

-- Nested Query

-- Select those Teams whose Stadium has capacity less than 50000
select T.name from teams T 
where T.id_stadium 
in(select S.id_stadium from Stadiums S where S.capacity < 50000);

-- UNION
-- All players whose position-> Goalkeeper or country-> ___land
select name,position,country from players
where country like '%land'
union
select name,position,country from players
where position = 'Goalkeeper';


-- UNION ALL with Duplicates
-- All players whose position-> Goalkeeper or country-> ___land
select name,position,country from players
where country like '%land'
union
select name,position,country from players
where position = 'Goalkeeper';

-- INTERSECT
-- All players whose position-> Midfielder and country-> ___land
select name,position,country from players
where country like '%land'
INTERSECT
select name,position,country from players
where position = 'Midfielder';

-- Minus
-- All players whose position-> Midfielder but country is not ___land
select name,position,country from players
where position = 'Midfielder'
minus
select name,position,country from players
where country like '%land';

--JOIN


-- Players who have At least 1 assists in one match
select name, assists
from players
natural join scores
where assists >= 1;

-- All FC Barcelona matches
select h.name AS home, home , away, a.name AS "away"
from matches match
join teams h ON match.id_home = h.id_team
join teams a ON match.id_away = a.id_team
join results using (id_match)
where id_home = 2 OR id_away = 2;

-- Total Goals By each Team
select name,sum(goals) AS TOTAL_GOALS
from teams T
natural join scores
group by name
order by TOTAL_GOALS desc, name;

-- ALL Argentine players and their clubs
select p.name,p.country,t.name
from players p
join teams t
on p.id_team = t.id_team
where country = 'Argentina';

-- Team names with stadium and capacity
select T.name,s.full_name,s.capacity,s.city from
Stadiums s, Teams T
where s.id_stadium = T.id_stadium;

-- *same as previous* USING JOIN
select T.name,s.full_name,s.capacity,s.city from
Stadiums s JOIN Teams T
on s.id_stadium = T.id_stadium;

-- *same as previous* USING,JOIN
select T.name,s.full_name,s.capacity,s.city from
Stadiums s JOIN Teams T
using (id_stadium);

-- *same as previous* Using Natural Join
select T.name,s.full_name,s.capacity,s.city from
Stadiums s Natural JOIN Teams T;

--Cross Joins/ Cartesian Products
select * from stadiums cross join teams;

-- Left Outer join
select T.name,s.full_name,s.capacity,s.city from
Stadiums s LEFT JOIN Teams T
on s.id_stadium = T.id_stadium;

-- Right Outer join
select T.name,s.full_name,s.capacity,s.city from
Stadiums s Right JOIN Teams T
on s.id_stadium = T.id_stadium;

-- FULL Outer join
select T.name,s.full_name,s.capacity,s.city from
Stadiums s FULL OUTER JOIN Teams T
on s.id_stadium = T.id_stadium;

-- PL/SQL

BEGIN
insert into Stadiums values(13,'AAA',2121,'BBB');
END;
/

BEGIN
DELETE from Stadiums where id_stadium=13;
END;
/

-- MAX attendance in a match
SET SERVEROUTPUT ON
DECLARE
   max_attendance matches.attendance%type;
BEGIN
   SELECT MAX(attendance) INTO max_attendance  
   FROM matches;
   DBMS_OUTPUT.PUT_LINE('The max attendance is : ' || max_attendance);
 END;
/

-- The Average of all matches played in San Siro stadium.
-- print good if av is > 50000
-- print bad if av is < 50000
-- print normal otherwise
SET SERVEROUTPUT ON
DECLARE
	st_id Stadiums.id_stadium%type;
	Av int;
BEGIN
	select id_stadium into st_id from stadiums where full_name = 'San Siro';
	select AVG(attendance) INTO av from stadiums natural join matches where id_stadium = st_id;
	
    DBMS_OUTPUT.PUT_LINE('The avg : ' || av);

	if av < 50000 then
		DBMS_OUTPUT.PUT_LINE ('BAD');
	elsif av = 50000 then
		DBMS_OUTPUT.PUT_LINE ('NORMAL');
	else
		DBMS_OUTPUT.PUT_LINE ('GOOD');
	end if; 
END;
/

-- Count all Goals using loop, cursor
SET SERVEROUTPUT ON
DECLARE
		total NUMBER;
		CURSOR x is select home,away from results;
	y x%rowtype;
	cnt NUMBER;
BEGIN
	select count(id_match) into total from results;
	--DBMS_OUTPUT.PUT_LINE(total);
	open x;
	cnt := 0;
	Loop
		exit when x%rowcount >= total;
		fetch x into y;
		cnt := cnt + y.home + y.away;
	end loop;
	close x;
	DBMS_OUTPUT.PUT_LINE('Total Goals : ' || cnt);
Exception
WHEN others THEN
DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/

-- Count all Goals using While loop, cursor
SET SERVEROUTPUT ON
DECLARE
		total NUMBER;
		CURSOR x is select home,away from results;
	y x%rowtype;
	cnt NUMBER;
BEGIN
	select count(id_match) into total from results;
	--DBMS_OUTPUT.PUT_LINE(total);
	open x;
	cnt := 0;
	while x%rowcount < total
	loop
		fetch x into y;
		cnt := cnt + y.home + y.away;
	end loop;
	close x;
	DBMS_OUTPUT.PUT_LINE('Total Goals : ' || cnt);
Exception
WHEN others THEN
DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/


-- Procedure to count all goals using FOR loop and cursor
SET SERVEROUTPUT ON
CREATE or Replace procedure getTOTALGOALS is
		total NUMBER;
		CURSOR x is select home,away from results;
	y x%rowtype;
	cnt NUMBER;
BEGIN
	select count(id_match) into total from results;
	--DBMS_OUTPUT.PUT_LINE(total);
	open x;
	cnt := 0;
	FOR i in 1..total
	Loop
		fetch x into y;
		cnt := cnt + y.home + y.away;
	end loop;
	close x;
	DBMS_OUTPUT.PUT_LINE('Total Goals : ' || cnt);
Exception
WHEN others THEN
DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/
SHOW ERRORS;

-- Function to count all goals using FOR loop and cursor with return
SET SERVEROUTPUT ON
CREATE or Replace Function getTG RETURN NUMBER is
		total NUMBER;
		CURSOR x is select home,away from results;
	y x%rowtype;
	cnt NUMBER;
BEGIN
	select count(id_match) into total from results;
	--DBMS_OUTPUT.PUT_LINE(total);
	open x;
	cnt := 0;
	FOR i in 1..total
	Loop
		fetch x into y;
		cnt := cnt + y.home + y.away;
	end loop;
	close x;
	RETURN cnt;
Exception
WHEN others THEN
DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/
SHOW ERRORS;

SET SERVEROUTPUT on
BEGIN
DBMS_OUTPUT.PUT_LINE('**TOTAL Goals** : ' || getTG);
END;
/

-- Trigger
CREATE OR REPLACE TRIGGER check_attendance BEFORE INSERT OR UPDATE ON Matches
FOR EACH ROW
DECLARE
x stadiums.capacity%type;
BEGIN
select capacity into x from Stadiums where id_stadium = :new.id_stadium;
IF :new.attendance > x THEN
RAISE_APPLICATION_ERROR(-20000,'Attendance can''t Exceed Capacity');
END IF;
END;
/
show errors;

insert into matches values(7,2,3,2,'DEMO_DATE',100000);
seelct *from matches;

CREATE OR REPLACE TRIGGER check_goals BEFORE INSERT OR UPDATE ON Results
FOR EACH ROW
DECLARE
c_min constant number(8,2) := 0;
BEGIN
IF :new.home < c_min or :new.away < c_min THEN
RAISE_APPLICATION_ERROR(-20000,'goals can''t be negative');
END if;
end;
/
show errors;

insert into results values(7,-1,0);


-- commit and Rollback
commit;

select * from stadiums;
insert into stadiums values(13, 'AAA', 80018, 'BBB');
select * from stadiums;
rollback;
select * from stadiums;


-- SysDate
select sysdate from dual;
select systimestamp from dual;

select ADD_MONTHS(date_time,6) as Six_months_Extension
from matches;

create view abc_scores as
	select * from Scores;

select * from abc_scores;