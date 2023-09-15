CREATE TABLE Item (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    genre_id INT,
    author VARCHAR(255),
    label VARCHAR(255),
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY(id) REFERENCES Genre(id),
    FOREIGN KEY(id) REFERENCES Label(id),
    FOREIGN KEY(id) REFERENCES Author(id)
);

CREATE TABLE Book (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    genre_id INT,
    author VARCHAR(255),
    label VARCHAR(255),
    publish_date DATE,
    publisher VARCHAR(255),
    cover_state VARCHAR(50),
    archived BOOLEAN
);

CREATE TABLE Game (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    multiplayer BOOLEAN,
    last_played TIMESTAMP,
    archived BOOLEAN
);

CREATE TABLE MusicAlbum (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    genre_id INT,
    artist VARCHAR(255),
    label VARCHAR(255),
    publish_date DATE,
    on_spotify BOOLEAN,
    archived BOOLEAN
);

CREATE TABLE Author (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    FOREIGN KEY(id) REFERENCES Item(id)
);

CREATE TABLE Genre (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    FOREIGN KEY(id) REFERENCES Item(id)
);

CREATE TABLE Label (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(255),
    color VARCHAR(50),
    FOREIGN KEY(id) REFERENCES Item(id)
);