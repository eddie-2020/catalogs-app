-- create genre table

CREATE TABLE genre (
    id int generated always as identity primary key,
    name varchar(100)
);

-- create author table

CREATE TABLE author (
    id int generated always as identity primary key,
    first_name varchar(100)
    last_name varchar(100)
);

-- create source table

CREATE TABLE source (
    id int generated always as identity primary key,
    name varchar(100)
);

-- create label table

CREATE TABLE genre (
    id int generated always as identity primary key,
    title varchar(100)
    color varchar(100)
);

-- create music album table

CREATE TABLE music_albums (
    id int generated always as identity primary key,
    on_spotify boolean,
    archived boolean,
    publish_date date,
    genre_id int,
    author_id int,
    label_id int,
    source_id int,
    FOREIGN KEY (genre_id) REFERENCES genre(id),
    FOREIGN KEY (author_id) REFERENCES author(id)
    FOREIGN KEY (label_id) REFERENCES label(id)
    FOREIGN KEY (source_id) REFERENCES source(id)
);

-- create books table

CREATE TABLE books (
    id int generated always as identity primary key,
    cover_state varchar(100),
    publisher varcgar(100),
    archived boolean,
    publish_date date,
    genre_id int,
    author_id int,
    label_id int,
    source_id int,
    FOREIGN KEY (genre_id) REFERENCES genre(id),
    FOREIGN KEY (author_id) REFERENCES author(id)
    FOREIGN KEY (label_id) REFERENCES label(id)
    FOREIGN KEY (source_id) REFERENCES source(id)
);

-- create games table

CREATE TABLE games (
    id int generated always as identity primary key,
    multiplayer varchar(100),
    last_played date,
    archived boolean,
    publish_date date,
    genre_id int,
    author_id int,
    label_id int,
    source_id int,
    FOREIGN KEY (genre_id) REFERENCES genre(id),
    FOREIGN KEY (author_id) REFERENCES author(id)
    FOREIGN KEY (label_id) REFERENCES label(id)
    FOREIGN KEY (source_id) REFERENCES source(id)
);