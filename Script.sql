CREATE TABLE IF NOT EXISTS mus_genres
(
genre_id SERIAL PRIMARY KEY,
name VARCHAR (25) NOT NULL
);

CREATE TABLE IF NOT EXISTS singers
(
singer_id SERIAL  PRIMARY KEY,
nickname VARCHAR (50) NOT NULL
);
CREATE TABLE IF NOT EXISTS mus_genres_singers 
(
genr_id INTEGER REFERENCES mus_genres(genre_id),
sing_id INTEGER REFERENCES singers(singer_id),
CONSTRAINT pk PRIMARY KEY (genr_id, sing_id) 
);



CREATE TABLE IF NOT EXISTS mus_albums
(
mus_album_id SERIAL PRIMARY KEY,
name VARCHAR (25) NOT NULL,
year date NOT NULL
);

CREATE TABLE IF NOT EXISTS singers_mus_albums
(
sing_id INTEGER REFERENCES singers(singer_id),
mus_alb_id INTEGER REFERENCES mus_albums(mus_album_id),
CONSTRAINT singers_pk PRIMARY KEY(sing_id, mus_alb_id)
);

CREATE TABLE IF NOT EXISTS collections
(
collection_id SERIAL  PRIMARY KEY,
name VARCHAR (25) NOT NULL,
year date NOT NULL
);

CREATE TABLE IF NOT EXISTS tracks
(
track_id SERIAL PRIMARY KEY,
track_name VARCHAR (100) NOT NULL,
duration NUMERIC (3,2) NOT NULL,
mus_album_id INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS tracks_collections
(
track_id INTEGER REFERENCES tracks(track_id),
collect_id INTEGER REFERENCES collections(collection_id), 
CONSTRAINT tracks_pk PRIMARY KEY(track_id, collect_id)
);


