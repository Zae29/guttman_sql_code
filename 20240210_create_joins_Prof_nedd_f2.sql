SELECT '' AS 'INSTALLATION STARTING'\G

DROP DATABASE IF EXISTS guttman_202db_assign6;
-- Create database
CREATE DATABASE IF NOT EXISTS guttman_202db_assign6
CHARACTER SET  utf8mb4 COLLATE utf8mb4_0900_ai_ci;

SHOW DATABASES \G
SELECT '' AS 'DATABASE CREATED'\G
-- Use database
USE guttman_202db_assign6;


-- Create tables
SELECT '' AS 'CREATING TABLE'\G
DROP TABLE
IF EXISTS `committees`;

CREATE TABLE committees(
  committee_id    INT AUTO_INCREMENT,
  committee_name  VARCHAR(100),
                  PRIMARY KEY(committee_id)
);

SHOW CREATE TABLE committees \G
DROP TABLE
IF EXISTS `members`;


CREATE TABLE members(
  member_id       INT AUTO_INCREMENT,
  name            VARCHAR(100),
  committee_id    INT,
                  PRIMARY KEY(member_id),

  CONSTRAINT     `fk_committees`
                	FOREIGN KEY(committee_id)
                	REFERENCES committees(committee_id)
);
SHOW CREATE TABLE members \G

SELECT '' AS 'INSERTING VALUES INTO TABLE'\G

INSERT INTO committees(committee_name)
VALUES ('Governance'),
       ('Firewall Testing'),
       ('Operations'),
       ('Systems Assurance'),
       ('Infrastructure'),
       ('Corporate Advisory'),
       ('Cybersecurity'),
       ('Change Management');

INSERT INTO members(name, committee_id)
VALUES
('Aziz',(select committee_id from committees where committee_name = 'Governance')),
('Doris A',(select committee_id from committees where committee_name = 'Firewall Testing')),
('Doris Q',(select committee_id from committees where committee_name = 'Operations')),
('Peter',(select committee_id from committees where committee_name = 'Cybersecurity')),
('Devin',(select committee_id from committees where committee_name = 'Governance')),
('Jose',(select committee_id from committees where committee_name = 'Governance')),
('Jorge',(select committee_id from committees where committee_name = 'Firewall Testing')),
('Cece',(select committee_id from committees where committee_name = 'Change Management')),
('Kevin',(select committee_id from committees where committee_name = 'Infrastructure')),
('Kani',(select committee_id from committees where committee_name = 'Cybersecurity')),
('Zakeem',(select committee_id from committees where committee_name = 'Firewall Testing')),
('Thiha',(select committee_id from committees where committee_name = 'Governance')),
('Jason',(select committee_id from committees where committee_name = 'Firewall Testing')),
('Chantel',(select committee_id from committees where committee_name = 'Firewall Testing')),
('Christina',(select committee_id from committees where committee_name = 'Firewall Testing')),
('Chianti',(select committee_id from committees where committee_name = 'Governance')),
('Cynthia',(select committee_id from committees where committee_name = 'Firewall Testing')),
('Kyle',(select committee_id from committees where committee_name = 'Operations')),
('Cheri',NULL),
('Max', NULL),
('Roberta', NULL);


SELECT '' AS 'SCRIPT COMPLETED'\G

SELECT '1' AS 'JOIN STATEMENTS' \G
SELECT m.name NAME, c.committee_name AS
'Committee Assignment'
FROM    members  m
JOIN    committes  c
ON      m.committee_id = c.committee_id;

SELECT '2' AS 'INNER JOIN STATEMENTS' \G
SELECT m.name NAME, c.committee_name AS
'Committee Assignment'
FROM   members m
INNER JOIN   committees  c
ON     m.committee_id = c.committee_id;
SELECT '3' AS 'LEFT JOIN STATEMENTS' \G
SELECT m.name NAME, c.committee_name AS
'Committee Assignment'
FROM  members  m
LEFT JOIN committees c
ON     m.committee_id = c.committee_id;

SELECT '4' AS 'ANTI LEFT JOIN STATEMENTS' \G
SELECT m.name NAME, c.committee_name AS
'Committee Assignment'
FROM   members  m
LEFT JOIN   committees c
ON      m.committee_id = c.committee_id
WHERE c.committee_id IS NULL;

SELECT '5' AS 'RIGHT JOIN STATEMENTS' \G
SELECT m.name NAME, c.committee_name AS
'Committee Assignment'
FROM   members  m
RIGHT JOIN   committees c
ON     m.committee_id = c.committee_id;

SELECT '6' AS 'ANTI RIGHT JOIN STATEMENTS' \G
SELECT m.name NAME, c.committee_name AS
'Committee Assignment'
FROM   members  m
RIGHT JOIN   committees  c
ON      m.committee_id = c.committee_id
WHERE m.committee_id IS NULL;

SELECT '7' AS 'CROSS JOIN STATEMENTS' \G
SELECT m.name NAME, c.committee_name AS
'Committee Assignment'
FROM   members  m
CROSS JOIN   committees  c;
