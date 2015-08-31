-- Deploy flipr:change_pass to mysql
-- requires: users
-- requires: appuser

BEGIN;

DELIMITER //
 
CREATE FUNCTION change_pass(
    nickname VARCHAR(512),
    oldpass  VARCHAR(512),
    newpass  VARCHAR(512)
) RETURNS INTEGER SQL SECURITY DEFINER
BEGIN
    UPDATE users
       SET password = md5(newpass)
     WHERE nickname = nickname
       AND password = md5(oldpass);
    RETURN ROW_COUNT();
END;
//
 
DELIMITER ;
 
GRANT EXECUTE ON FUNCTION change_pass to flipr;

COMMIT;
