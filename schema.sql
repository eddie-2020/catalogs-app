CREATE TABLE Book (
  id            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  genre_id      INT,
  label_id      INT,
  author_id     INT,
  publish_date  DATE,
  archived      BOOLEAN,
  publisher     VARCHAR(250),
  cover_state   VARCHAR(4),

  FOREIGN KEY (genre_id)  REFERENCES Genre(id)
  FOREIGN KEY (label_id)  REFERENCES Label(id)
  FOREIGN KEY (author_id) REFERENCES Author(id)
);

CREATE TABLE Label (
  id      INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title   VARCHAR(100),
  color   VARCHAR(100)
);
