-- Deploy flipr:insert_flip to mysql
-- requires: flips
-- requires: appuser

BEGIN;
 
DELIMITER //
 
CREATE FUNCTION insert_flip(
    nickname VARCHAR(512),
    body     VARCHAR(180)
) RETURNS BIGINT SQL SECURITY DEFINER
BEGIN
    INSERT INTO flips (nickname, body)
    VALUES (nickname, body);
    RETURN LAST_INSERT_ID();
END;
//
 
DELIMITER ;
 
GRANT EXECUTE ON FUNCTION insert_flip to flipr;
 
COMMIT;
