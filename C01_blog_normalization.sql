-- ============================================================
-- Exercise 1: Normalize a Blog Database
-- ============================================================

-- STEP 1: Analysis
-- Raw table has redundancy: author name repeated across multiple posts
-- Normalization to 3NF requires separating authors from posts

-- 1NF: each cell has one value, each row is unique ✓
-- 2NF: add surrogate keys to eliminate partial dependencies
-- 3NF: separate author data into its own table (author info depends on author, not on post)

-- STEP 2: DDL

-- Authors table
CREATE TABLE authors (
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(255) NOT NULL
);

-- Posts table (references author)
CREATE TABLE posts (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    author_id   INT NOT NULL,
    title       VARCHAR(255) NOT NULL,
    word_count  INT,
    views       INT,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- STEP 3 (Optional): Insert sample data

INSERT INTO authors (name) VALUES
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');

INSERT INTO posts (author_id, title, word_count, views) VALUES
(1, 'Best Paint Colors',           814,  14),
(2, 'Small Space Decorating Tips', 1146, 221),
(1, 'Hot Accessories',             986,  105),
(1, 'Mixing Textures',             765,  22),
(2, 'Kitchen Refresh',             1242, 307),
(1, 'Homemade Art Hacks',          1002, 193),
(3, 'Refinishing Wood Floors',     1571, 7542);
