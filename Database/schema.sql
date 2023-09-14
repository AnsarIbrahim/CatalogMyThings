CREATE TABLE item (
    id INTEGER PRIMARY KEY,
    genre varchar(255),
    author varchar(255),
    label varchar(255),
    publish_date date,
    archived boolean
);

CREATE TABLE book (
    id INTEGER PRIMARY KEY,
    genre TEXT,
    author TEXT,
    label TEXT,
    publish_date DATE,
    publisher TEXT,
    cover_state TEXT
);

CREATE TABLE game (
    id INTEGER PRIMARY KEY,
    multiplayer INTEGER,
    last_played DATE,
    FOREIGN KEY(id) REFERENCES item(id)
);

create TABLE music_albums (
    id int INTEGER PRIMARY KEY,
    genre varchar(255) not null,
    artist varchar(255) not null,
    on_spotify boolean not null,
    publish_date timestamp not null
);

create TABLE author (
    id INTEGER PRIMARY KEY,
    first_name varchar(20),
    last_name varchar(20)
);

CREATE TABLE Genre (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE labels (
    id INTEGER PRIMARY KEY,
    title TEXT,
    color TEXT
);