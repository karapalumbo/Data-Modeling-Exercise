-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL, 
  airline_id INTEGER REFERENCES airlines
);

CREATE TABLE travel_info
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL, 
  airline_id INTEGER REFERENCES airlines
);



INSERT INTO travel_info
  (departure, arrival, from_city, from_country, to_city, to_country, airline_id)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 'Washington DC', 'United States', 'Seattle', 'United States', 1),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 'Tokyo', 'Japan', 'London', 'United Kingdom', 2),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Los Angeles', 'United States', 'Las Vegas', 'United States', 3),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Seattle', 'United States', 'Mexico City', 'Mexico', 3),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 'Paris', 'France', 'Casablanca', 'Morocco', 5),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Dubai', 'UAE', 'Beijing', 'China', 6),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 'New York', 'United States', 'Charlotte', 'United States', 1),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 'Cedar Rapids', 'United States', 'Chicago', 'United States', 8),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 'Charlotte', 'United States', 'New Orleans', 'United States', 8),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile', 10);

  INSERT INTO passengers
    (first_name, last_name, seat, airline_id)
  VALUES 
  ('Jennifer', 'Finch', '33B', 1),
  ('Thadeus', 'Gathercoal', '8A', 2),
  ('Sonja', 'Pauley', '12F', 3), 
  ('Jennifer', 'Finch', '20A', 3), 
  ('Waneta', 'Skeleton', '23D', 5), 
  ('Thadeus', 'Gathercoal', '18C', 6), 
  ('Berkie', 'Wycliff', '9E', 1), 
  ('Alvin', 'Leathes', '1A', 8), 
  ('Berkie', 'Wycliff', '32B', 8), 
  ('Cory', 'Squibbes', '10D', 10);


  INSERT INTO airlines 
    (airline)
  VALUES
    ('United'), 
    ('British Airways'), 
    ('Delta'),
    ('TUI Fly Belgium'),
    ('Air China'),
    ('American Airlines'),
    ('Avianca Brasil');
   