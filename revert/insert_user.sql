-- Revert flipr:insert_user from mysql

BEGIN;

DROP PROCEDURE insert_user;

COMMIT;
