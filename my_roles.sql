-- DROP ROLES
DROP ROLE
IF EXISTS 'read_only_classicmodels_db'@'%';

-- CHECK TO SEE GONE
SELECT user, show_db_priv, account_locked
FROM mysql.user;

-- CREATE ROLE
CREATE ROLE
IF NOT EXISTS
      'read_only_classicmodels_db', 'admin_user',
      'read_only_employess_db', 'app_user';

SELECT user, show_db_priv, account_locked
FROM mysql.user;

-- GRANT PRIVILEGES
GRANT SELECT
ON classicmodels.*
TO 'read_only_classicmodels_db'@'%';

GRANT CREATE
ON *.*
TO 'admin_user'@'%';

GRANT INSERT, UPDATE
ON employees.employees
TO 'app_user'@'%';

GRANT SELECT
ON employees.*
TO 'read_only_employees_db'@'%';
