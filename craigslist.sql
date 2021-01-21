-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist


CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  cat_name TEXT NOT NULL,
);


CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT UNIQUE NOT NULL,
  post_text TEXT NOT NULL, 
  post_location TEXT UNIQUE NOT NULL, 
  users_id INT REFERENCES users(id)
  region_id INT REFERENCES region(id)
  categories_id INT REFERENCES categories(id)
);


CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  users_name TEXT UNIQUE NOT NULL,
  password VARCHAR(10) NOT NULL,
  region_id INT REFERENCES region(id)
);


CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  region_name TEXT UNIQUE NOT NULL,
);