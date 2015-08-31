-- Revert flipr:delete_flip from mysql

BEGIN;

DROP FUNCTION delete_flip;

COMMIT;
