-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league


CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  team_name TEXT UNIQUE NOT NULL,
  start_date DATE, 
  end_date DATE
);


CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  team_name TEXT NOT NULL REFERENCES teams(team_name),
  player_name TEXT NOT NULL REFERENCES players(player_name),
  goal_time INT NOT NULL,
  ranking INT REFERENCES teams(team_id)
);


CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  player_name TEXT UNIQUE NOT NULL,
  team_name TEXT NOT NULL REFERENCES teams(team_name),
  coach TEXT 
);


