DROP USER
IF EXISTS 'admin_001'@'%';

SELECT 'ADDING USER admin_001' AS 'INSTALLATION PROGRESSING';

CREATE USER
IF NOT EXISTS 'admin_001'@'%'
IDENTIFIED BY 'guttmanGrizzlies_2024'

WITH
-- SET RESOURCE LIMITS
MAX_QUERIES_PER_HOUR 15
MAX_UPDATES_PER_HOUR 8
MAX_CONNECTIONS_PER_HOUR 3
MAX_USER_CONNECTIONS 1

-- SET PASSWORD OPTIONS
FAILED_LOGIN_ATTEMPTS 6
PASSWORD_LOCK_TIME UNBOUNDED
PASSWORD EXPIRE INTERVAL 45 DAY
PASSWORD HISTORY 7
PASSWORD REUSE INTERVAL 183 DAY;

REVOKE ALL, GRANT OPTION FROM 'admin_001'@'%';
SELECT user, show_db_priv, account_locked
FROM mysql.user;

FLUSH PRIVILEGES;
SELECT user, show_db_priv, account_locked
FROM mysql.user;
