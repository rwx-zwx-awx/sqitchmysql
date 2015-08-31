-- Deploy flipr:change_pass to mysql
-- requires: users
-- requires: appuser

BEGIN;

DELIMITER //
 
DROP FUNCTION change_pass;
CREATE FUNCTION change_pass(
    nickname VARCHAR(512),
    oldpass  VARCHAR(512),
    newpass  VARCHAR(512)
) RETURNS INTEGER SQL SECURITY DEFINER
BEGIN
    UPDATE users
       SET password = ENCRYPT(md5(newpass), md5(FLOOR(RAND() * 0xFFFFFFFF)))
     WHERE nickname = nickname
       AND password = ENCRYPT(md5(oldpass), password);
    RETURN ROW_COUNT();
END;
//
 
DELIMITER ;
 
GRANT EXECUTE ON FUNCTION change_pass to flipr;

COMMIT;
