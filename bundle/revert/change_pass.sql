-- Revert flipr:change_pass from mysql

BEGIN;

DROP FUNCTION change_pass;

COMMIT;
