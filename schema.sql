-- create author table

CREATE TABLE dbo.author
(
    id INT NOT NULL PRIMARY KEY,
    first_name [NVARCHAR](100) NOT NULL,
    last_name [NVARCHAR](100) NOT NULL
);
GO

-- create games table

CREATE TABLE dbo.games
(
    id INT NOT NULL PRIMARY KEY,
    multiplayer [NVARCHAR](100) NOT NULL,
    last_played DATE,
    archived BOOLEAN,
    publish_date DATE,
    author_id INT,
    genre_id INT,
    label_id INT,
    source_id INT,

    FOREIGN KEY (author_id) REFERENCES  author(id),
    FOREIGN KEY (genre_id) REFERENCES  genre(id),
    FOREIGN KEY (label_id) REFERENCES  label(id),
    FOREIGN KEY (source_id) REFERENCES  source(id)
);
GO