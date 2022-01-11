/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', '2020-02-03', 10.23, true, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', '2018-11-15', 8, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', '2021-01-07', 15.04, false, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', '2017-05-12', 11, true, 5);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES
('Charmander', '2020-02-08', -11, false, 0),
('Plantmon', '2022-11-15', -5.7, true, 2),
('Squirtle', '1993-04-02', -12.13, false, 3),
('Angemon', '2005-06-12', -45, true, 1),
('Boarmon', '2005-06-07', 20.4, true, 7),
('Blossom', '1998-10-13', 17, true, 3);

SELECT * FROM animals;

--  id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+------------+---------------+-----------------+----------+-----------+---------
--     | Agumon     | 2020-02-03    |               0 | t        |     10.23 | 
--     | Gabumon    | 2018-11-15    |               2 | t        |         8 | 
--     | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | 
--     | Devimon    | 2017-05-12    |               5 | t        |        11 | 
--     | Charmander | 2020-02-08    |               0 | f        |       -11 | 
--     | Plantmon   | 2022-11-15    |               2 | t        |      -5.7 | 
--     | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | 
--     | Angemon    | 2005-06-12    |               1 | t        |       -45 | 
--     | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | 
--     | Blossom    | 1998-10-13    |               3 | t        |        17 | 
-- (10 rows)

