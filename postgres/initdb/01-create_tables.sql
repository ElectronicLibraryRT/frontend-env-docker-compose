DROP TABLE IF EXISTS read_history CASCADE;
DROP TABLE IF EXISTS favourite_books CASCADE;
DROP TABLE IF EXISTS books_locations CASCADE;
DROP TABLE IF EXISTS books_authors CASCADE;
DROP TABLE IF EXISTS books_genres CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS authors CASCADE;
DROP TABLE IF EXISTS genres CASCADE;
DROP TABLE IF EXISTS extensions CASCADE;
DROP TABLE IF EXISTS users CASCADE;


CREATE TABLE authors (
    id serial NOT NULL PRIMARY KEY,
    name varchar(128) NOT NULL UNIQUE
);


CREATE TABLE genres (
    id serial NOT NULL PRIMARY KEY,
    name varchar(32) NOT NULL UNIQUE
);


CREATE TABLE extensions (
    id serial NOT NULL PRIMARY KEY,
    name varchar(8) NOT NULL UNIQUE
);


CREATE TABLE users (
    id serial NOT NULL PRIMARY KEY,
    name varchar(64) NOT NULL UNIQUE,
    salt varchar(32) NOT NULL,
    password_hash varchar(512) NOT NULL,
    refresh_token_uuid varchar(32) NOT NULL
);


CREATE TABLE books (
    id serial NOT NULL PRIMARY KEY,
    title varchar(128) NOT NULL,
    year_written smallint NULL,
    CONSTRAINT books_unique UNIQUE (title, year_written)
);


CREATE TABLE books_authors (
    author_id int NOT NULL REFERENCES authors(id) ON DELETE CASCADE ON UPDATE CASCADE,
    book_id int NOT NULL REFERENCES books(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (book_id, author_id)
);


CREATE TABLE books_genres (
    book_id int NOT NULL REFERENCES books(id) ON DELETE CASCADE ON UPDATE CASCADE,
    genre_id int NOT NULL REFERENCES genres(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (book_id, genre_id)
);


CREATE TABLE books_locations (
    book_id int NOT NULL REFERENCES books(id) ON DELETE CASCADE ON UPDATE CASCADE,
    extension_id int NOT NULL REFERENCES extensions(id) ON DELETE CASCADE ON UPDATE CASCADE,
    location varchar(256) NOT NULL UNIQUE,
    PRIMARY KEY (book_id, extension_id)
);


CREATE TABLE favourite_books (
    user_id int NOT NULL REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    book_id int NOT NULL REFERENCES books(id) ON DELETE CASCADE ON UPDATE CASCADE,
    added_ts timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, book_id)
);


CREATE TABLE read_history (
    user_id int NOT NULL REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    book_id int NOT NULL REFERENCES books(id) ON DELETE CASCADE ON UPDATE CASCADE,
    last_read_ts timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, book_id)
);