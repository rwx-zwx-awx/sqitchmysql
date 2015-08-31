-- Revert flipr:insert_flip from mysql

BEGIN;

DROP FUNCTION insert_flip;

COMMIT;
