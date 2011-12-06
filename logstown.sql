DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
    email                   varchar(255)    NOT NULL UNIQUE,
    hash                    char(40)        NOT NULL,
    teacher                 boolean         DEFAULT FALSE,
    session_token           char(36)        DEFAULT NULL,
    session_expires         timestamp       DEFAULT 'now',
    payment_method_token    text            DEFAULT NULL
);

INSERT INTO users (email, hash) 
    VALUES ('chad@zetaweb.com', 'cabd1aba5b11a4eef45d4015c003510e6a7c682c');
INSERT INTO users (email, hash) 
    VALUES ('christian@dowski.com', '657faae1aef3c3e7e806f8354a3e3f5b6839a76f');

DROP TABLE IF EXISTS payments;
CREATE TABLE payments (
    email   varchar(255)    REFERENCES users (email),
    amount  int             NOT NULL,
    ts      timestamp       NOT NULL DEFAULT 'now'
);