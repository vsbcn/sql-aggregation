CREATE SCHEMA blog_decoration;
USE blog_decoration;

-- DROP TABLE authors;
CREATE TABLE authors (
	id INT NOT NULL AUTO_INCREMENT,		
    author_name VARCHAR(255),    
    PRIMARY KEY (id)    
);

-- DROP TABLE blog_entry;
CREATE TABLE blog_entry (
	id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(255) NOT NULL,
    word_count  SMALLINT,
    views SMALLINT,    
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES authors(id)
);

INSERT INTO authors (author_name) VALUES
('Maria Charlotte'),
('Juan Perez'),
('Maria Charlotte'),
('Maria Charlotte'),
('Juan Perez'),
('Maria Charlotte'),
('Gemma Alcocer');

SELECT * FROM authors;

INSERT INTO blog_entry (title, word_count, views) VALUES
('Best Paint Colors', 814, 14),
('Small Space Decorating Tips', 1146, 221),
('Hot Accessories', 986, 105),
('Mixing Textures', 765, 22),
('Kitchen Refresh', 1242, 307),
('Homemade Art Hacks', 1002, 193),
('Refinishing Wood Floors', 1571, 7542);

SELECT * FROM blog_entry;

SELECT authors.author_name AS 'Author', blog_entry.title AS 'Article''s title', views AS 'Total views'
FROM blog_entry
INNER JOIN authors
ON authors.id = blog_entry.id
HAVING views > 100
ORDER BY views;	