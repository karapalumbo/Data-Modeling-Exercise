-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music


CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL, 
  release_date DATE NOT NULL,
  artist_id INTEGER NOT NULL REFERENCES artists
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT[] NOT NULL, 
  album_id INTEGER NOT NULL REFERENCES albums
);


CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT[] NOT NULL,
  song_id INTEGER NOT NULL REFERENCES songs
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL
);


INSERT INTO albums
  (name, release_date, artist_id)
VALUES
  ('Middle of Nowhere', '04-15-1997', 1),
  ('A Night at the Opera', '10-31-1975', 2),
  ('Daydream', '11-14-1995', 3),
  ('A Star Is Born', '09-27-2018', 4),
  ('Silver Side Up', '08-21-2001', 5),
  ('The Blueprint 3', '10-20-2009', 6),
  ('Prism', '12-17-2013', 7),
  ('Hands All Over', '06-21-2011', 8),
  ('Let Go', '05-14-2002', 9),
  ('The Writing''s on the Wall', '11-07-1999', 10),



INSERT INTO producers
  (name, album_id)
VALUES 
  ('{"Dust Brothers", "Stephen Lironi"}', 1), 
  ('{"Roy Thomas Baker"}', 2),
  ('{"Walter Afanasieff"}', 3),
  ('{"Benjamin Rice"}', 4),
  ('{"Rick Parashar"}', 5),
  ('{"Al Shux"}', 6),
  ('{"Max Martin", "Cirkut"}', 7),
  ('{"Shellback", "Benny Blanco"}', 8),
  ('{"The Matrix"}', 9),
  ('{"Darkchild"}', 10);


INSERT INTO artists
  (name, song_id)
VALUES
  ('{"Hanson"}', 1), 
  ('{"Queen"}', 2),
  ('{"Mariah Cary", "Boyz II Men"}', 3),
  ('{"Lady Gaga", "Bradley Cooper"}', 4),
  ('{"Nickelback"}', 5),
  ('{"Jay Z", "Alicia Keys"}', 6),
  ('{"Katy Perry", "Juicy J"}', 7),
  ('{"Maroon 5", "Christina Aguilera"}', 8),
  ('{"Avril Lavigne"}', 9),
  ('{"Destiny''s Child"}', 10);




INSERT INTO songs
  (title, duration_in_seconds)
VALUES
  ('MMMBop', 238),
  ('Bohemian Rhapsody', 355),
  ('One Sweet Day', 282),
  ('Shallow', 216),
  ('How You Remind Me', 223),
  ('New York State of Mind', 276),
  ('Dark Horse', 215),
  ('Moves Like Jagger', 201),
  ('Complicated', 244),
  ('Say My Name', 240);
