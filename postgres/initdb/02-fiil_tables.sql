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
(1, 1, '/1.pdf'),
(2, 2, '/2.epub'),
(3, 3, '/3.fb2'),
(4, 2, '/4.epub');