CREATE TABLE Item (
    id INT PRIMARY KEY,
    genre_id INT,
    author VARCHAR(255),
    label VARCHAR(255),
    publish_date DATE,
    archived BOOLEAN
);

CREATE TABLE Book (
    id INT PRIMARY KEY,
    genre_id INT,
    author VARCHAR(255),
    label VARCHAR(255),
    publish_date DATE,
    publisher VARCHAR(255),
    cover_state VARCHAR(50),
    archived BOOLEAN
);

CREATE TABLE Game (
    id INT PRIMARY KEY,
    publish_date DATE,
    multiplayer BOOLEAN,
    last_played TIMESTAMP,
    archived BOOLEAN
);

CREATE TABLE MusicAlbum (
    id INT PRIMARY KEY,
    genre_id INT,
    artist VARCHAR(255),
    label VARCHAR(255),
    publish_date DATE,
    on_spotify BOOLEAN,
    archived BOOLEAN
);

CREATE TABLE Author (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE Genre (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Label (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(50)
);