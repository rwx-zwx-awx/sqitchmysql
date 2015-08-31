-- Verify flipr:flips on mysql

BEGIN;

SELECT id
     , nickname
     , body
     , timestamp
  FROM flips
 WHERE 0;

ROLLBACK;
