INSERT INTO authors (id, name) VALUES 
(1, 'Рэй Брэдбери'),
(2, 'Фёдор Достоевский'),
(3, 'Айзек Азимов'),
(4, 'Джон Толкин');

INSERT INTO genres (id, name) VALUES 
(1, 'Детектив'),
(2, 'Фантастика'),
(3, 'Антиутопия'),
(4, 'Фэнтези');

INSERT INTO extensions (id, name) VALUES 
(1, 'pdf'),
(2, 'epub'),
(3, 'fb2');

INSERT INTO books (id, title, year_written) VALUES 
(1, '451 градус по Фаренгейту', '1953'),
(2, 'Преступление и наказание', '1866'),
(3, 'Основание', '1951'),
(4, 'Хоббит, или Туда и обратно', '1937');

INSERT INTO users (id, name, salt, password_hash, refresh_token_uuid) VALUES
(1, 'Alice', 'salt1', 'hash1', 'uuid1'),
(2, 'Bob', 'salt2', 'hash2', 'uuid2'),
(3, 'Charlie', 'salt3', 'hash3', 'uuid3'),
(4, 'Diana', 'salt4', 'hash4', 'uuid4');

INSERT INTO books_authors (book_id, author_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO books_genres (book_id, genre_id) VALUES 
(1, 3),
(2, 1),
(3, 2),
(4, 4);

INSERT INTO books_locations (book_id, extension_id, location) VALUES 
(1, 1, '1.pdf'),
(2, 2, '2.epub'),
(3, 3, '3.fb2'),
(4, 2, '4.epub');

INSERT INTO favourite_books (user_id, book_id, added_ts) VALUES 
(1, 1, '2025-07-02T10:23:54'),
(1, 2, '2025-03-02T10:23:54'),
(2, 2, '2025-06-02T10:23:54'),
(3, 1, '2025-05-02T10:23:54'),
(4, 4, '2025-01-02T10:23:54');

INSERT INTO read_history (user_id, book_id, last_read_ts) VALUES 
(1, 1, '2024-07-02T10:23:54'),
(1, 2, '2025-03-10T10:23:54'),
(2, 3, '2025-01-12T10:23:54'),
(3, 3, '2024-04-02T10:23:54'),
(4, 4, '2025-01-02T05:44:10');
