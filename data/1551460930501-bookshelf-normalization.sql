qCREATE DATABASE lab14_normal WITH TEMPLATE lab14;
CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;
ALTER TABLE books ADD COLUMN bookshelf_id INT;
UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;
ALTER TABLE books DROP COLUMN bookshelf;
ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
-- breaks bookshelf names out into a new table, adds foreign key to books table