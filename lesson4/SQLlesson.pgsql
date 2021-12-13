CREATE TABLE users 
    (
    id  SERIAL PRIMARY KEY,
    username varchar(30) NOT NULL,
    password varchar(30) NOT NULL,
    email varchar(50) NOT NULL
    );

CREATE TABLE articles
    (
    id SERIAL PRIMARY KEY,
    user_id SERIAL NOT NULL,
    title varchar(30) NOT NULL,
    content varchar(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users (id)
    );

CREATE TABLE comments
    (
    id SERIAL PRIMARY KEY,
    user_id SERIAL NOT NULL,
    article_id SERIAL NOT NULL,
    content varchar(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (article_id) REFERENCES articles (id)
    );

INSERT INTO users (username, password, email)
VALUES ('Stepan', 'fghjkl', 's.stesh@gmail.com');
INSERT INTO users (username, password, email)
VALUES ('Bogdan', 'aezakmi', 'm.melya@gmail.com');
INSERT INTO users (username, password, email)
VALUES ('Yaro', 'qwerty123', 'yaro.m@gmail.com');

INSERT INTO articles (user_id, title, content)
VALUES (1, 'First title', 'Hello World');
INSERT INTO articles (user_id, title, content)
VALUES (2, 'Second title', 'ABOBA');
INSERT INTO articles (user_id, title, content)
VALUES (3, 'Third title', 'amogus');

INSERT INTO comments (user_id, article_id, content)
VALUES (1, 2, 'Weekend');
INSERT INTO comments (user_id, article_id, content)
VALUES (2, 3, 'dsblf');
INSERT INTO comments (user_id, article_id, content)
VALUES (3, 1, 'No way');
INSERT INTO comments (user_id, article_id, content)
VALUES (1, 2, 'Okey let`s go');

UPDATE users
SET username = 'Sasha', 
    password = '123456',
    email = 'sasha.m@gmail.com'
WHERE id = 1;

UPDATE articles
SET title = 'Da da da',
    content = 'Good luck' 
WHERE id = 2;

UPDATE comments
SET content = 'Have fun' 
WHERE article_id = 2 ;

UPDATE comments
SET content = 'Good game' 
WHERE article_id = 3;

ALTER TABLE comments 
RENAME COLUMN content TO comment_content;

ALTER TABLE articles
ADD updated_at TIMESTAMP NOT NULL 
DEFAULT NOW();

SELECT * FROM users;
SELECT * FROM articles;
SELECT * FROM comments;

SELECT COUNT(title) FROM articles
WHERE user_id = 1;

SELECT email, comments.content AS comment_content AS article_title FROM comments
LEFT JOIN users ON comments.user_id = articles.id
LEFT JOIN articles ON users.id = articles.user_id;
