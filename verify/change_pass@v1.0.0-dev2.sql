-- Verify flipr:change_pass on mysql

BEGIN;

SELECT sqitch.checkit(COUNT(*), 'Procedure "change_pass" does not exist')
  FROM mysql.proc
 WHERE db = database()
   AND specific_name = 'change_pass';

ROLLBACK;
