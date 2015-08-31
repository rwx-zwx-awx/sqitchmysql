-- Deploy flipr:insert_user to mysql
-- requires: users
-- requires: appuser

BEGIN;

DELIMITER //
 
DROP PROCEDURE  insert_user;
CREATE PROCEDURE insert_user(
    nickname VARCHAR(512),
    password VARCHAR(512)
) SQL SECURITY DEFINER
BEGIN
    INSERT INTO users (nickname, password, timestamp)
    VALUES (nickname, ENCRYPT(md5(password), md5(FLOOR(RAND() * 0xFFFFFFFF))), UTC_TIMESTAMP(6));
END
//
 
DELIMITER ;
 
GRANT EXECUTE ON PROCEDURE insert_user to flipr;

COMMIT;
