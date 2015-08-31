-- Deploy flipr:flips to mysql
-- requires: appuser
-- requires: users

BEGIN;

CREATE TABLE flips (
    id        INT(11)   PRIMARY KEY,
    nickname  TEXT        NOT NULL REFERENCES users(nickname),
    body      TEXT        NOT NULL DEFAULT '' CHECK ( length(body) <= 180 ),
    timestamp TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP
);

COMMIT;
