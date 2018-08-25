DROP DATABASE IF EXISTS quiz;
CREATE DATABASE quiz;
USE quiz;
CREATE TABLE IF NOT EXISTS franquicia(ccntype VARCHAR(16),ccn VARCHAR(19),validthru DATE, key1 INT,pin INT,quota INT);
CREATE TABLE IF NOT EXISTS banco(bank VARCHAR(29),ccn VARCHAR(19),ssn VARCHAR(11)); 
CREATE TABLE IF NOT EXISTS persona(ssn VARCHAR(15),phone VARCHAR(16),city VARCHAR(40),maritalstatus VARCHAR(10),fullname VARCHAR(40),birthdate DATE);
LOAD DATA INFILE 'banco.csv' INTO TABLE banco FIELDS TERMINATED BY ',' LINES TERMINATED by '\r\n'  IGNORE 1 LINES (bank,ccn,ssn);
LOAD DATA INFILE 'franquicia.csv' INTO TABLE franquicia 	FIELDS TERMINATED BY ','  LINES TERMINATED by '\r\n' IGNORE 1 LINES (ccntype,ccn,validthru,key1,pin,quota);
LOAD DATA INFILE 'persona.csv' INTO TABLE persona FIELDS TERMINATED BY ',' LINES TERMINATED by '\r\n' IGNORE 1 LINES (ssn,phone,city,maritalstatus,fullname,birthdate);

--primera pregunta
select ccn from franquicia limit 103;

-- 02
describe franquicia;
select * from franquicia limit 10;
select quarter(validthru), count(*) from franquicia group by 1 order by 1;

--03
describe persona;
describe banco;
describe franquicia;
select t1.fullname from banco as t0 left join persona as t1 on (t0.ssn=t1.ssn) where t0.ccn = "3608-2968-5745-1497";

--04
select * from persona limit 4;
select count(*) from persona where trim(city) <> 'Portland (Oregon)';

--05
select * from banco limit 10;
select count(distinct ccn) from banco where bank='State Street Corporation';

--06
select count(*) from persona where trim(city) = 'Norfolk (Virginia)';

--07
select ssn from banco limit 100;

--08
select t1.fullname from banco as t0 left join persona as t1 on (t0.ssn=t1.ssn) where t0.ccn = "3608-1192-5766-1220";

--09
select * from franquicia limit 10;
select count(*) from franquicia where substr(ccn,6,4)='1395';

--10
select * from persona order by ssn limit 8;

--11
select * from persona limit 3;
select count(*) from persona where fullname like 'U% F%';

