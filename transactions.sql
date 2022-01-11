-- Update species column to unspecified
BEGIN;
UPDATE animals 
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;



-- Update species to digimon and pokemon
BEGIN;
UPDATE animals
SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * FROM animals;
--  id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+------------+---------------+-----------------+----------+-----------+---------
--     | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | 
--     | Blossom    | 1998-10-13    |               3 | t        |        17 | 
--     | Charmander | 2020-02-08    |               0 | f        |       -11 | 
--     | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | 
--     | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
--     | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
--     | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
--     | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
--     | Plantmon   | 2022-11-15    |               2 | t        |      -5.7 | digimon
--     | Angemon    | 2005-06-12    |               1 | t        |       -45 | digimon

UPDATE animals
SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
--  id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+------------+---------------+-----------------+----------+-----------+---------
--     | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
--     | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
--     | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
--     | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
--     | Plantmon   | 2022-11-15    |               2 | t        |      -5.7 | digimon
--     | Angemon    | 2005-06-12    |               1 | t        |       -45 | digimon
--     | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
--     | Blossom    | 1998-10-13    |               3 | t        |        17 | pokemon
--     | Charmander | 2020-02-08    |               0 | f        |       -11 | pokemon
--     | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | pokemon
COMMIT;

-- Delete all records and rollback
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
--  id | name | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+------+---------------+-----------------+----------+-----------+---------
-- (0 rows)
ROLLBACK;
SELECT * FROM animals;
--  id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+------------+---------------+-----------------+----------+-----------+---------
--     | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
--     | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
--     | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
--     | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
--     | Plantmon   | 2022-11-15    |               2 | t        |      -5.7 | digimon
--     | Angemon    | 2005-06-12    |               1 | t        |       -45 | digimon
--     | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
--     | Blossom    | 1998-10-13    |               3 | t        |        17 | pokemon
--     | Charmander | 2020-02-08    |               0 | f        |       -11 | pokemon
--     | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | pokemon
-- (10 rows)


-- Group by functions in a transaction
BEGIN;
-- Delete animals born after Jan 1st 2022
DELETE FROM animals WHERE date_of_birth < '2022-01-01';
SELECT * FROM animals;
--  id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+------------+---------------+-----------------+----------+-----------+---------
--     | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
--     | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
--     | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
--     | Angemon    | 2005-06-12    |               1 | t        |       -45 | digimon
--     | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
--     | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
--     | Charmander | 2020-02-08    |               0 | f        |       -11 | pokemon
--     | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | pokemon
--     | Blossom    | 1998-10-13    |               3 | t        |        17 | pokemon
-- (9 rows)

SAVEPOINT ANI1;
UPDATE animals 
SET weight_kg = (weight_kg * -1);
SELECT * FROM animals;
--  id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+------------+---------------+-----------------+----------+-----------+---------
--     | Agumon     | 2020-02-03    |               0 | t        |    -10.23 | digimon
--     | Gabumon    | 2018-11-15    |               2 | t        |        -8 | digimon
--     | Devimon    | 2017-05-12    |               5 | t        |       -11 | digimon
--     | Angemon    | 2005-06-12    |               1 | t        |        45 | digimon
--     | Boarmon    | 2005-06-07    |               7 | t        |     -20.4 | digimon
--     | Pikachu    | 2021-01-07    |               1 | f        |    -15.04 | pokemon
--     | Charmander | 2020-02-08    |               0 | f        |        11 | pokemon
--     | Squirtle   | 1993-04-02    |               3 | f        |     12.13 | pokemon
--     | Blossom    | 1998-10-13    |               3 | t        |       -17 | pokemon
-- (9 rows)

ROLLBACK TO ANI1;
SELECT * FROM animals;
--  id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+------------+---------------+-----------------+----------+-----------+---------
--     | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
--     | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
--     | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
--     | Angemon    | 2005-06-12    |               1 | t        |       -45 | digimon
--     | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
--     | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
--     | Charmander | 2020-02-08    |               0 | f        |       -11 | pokemon
--     | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | pokemon
--     | Blossom    | 1998-10-13    |               3 | t        |        17 | pokemon
-- (9 rows)

UPDATE animals
SET weight_kg = (weight_kg * -1) WHERE weight_kg < 0;
SELECT * FROM animals;
--  id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+------------+---------------+-----------------+----------+-----------+---------
--     | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
--     | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
--     | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
--     | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
--     | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
--     | Blossom    | 1998-10-13    |               3 | t        |        17 | pokemon
--     | Angemon    | 2005-06-12    |               1 | t        |        45 | digimon
--     | Charmander | 2020-02-08    |               0 | f        |        11 | pokemon
--     | Squirtle   | 1993-04-02    |               3 | f        |     12.13 | pokemon
-- (9 rows)
COMMIT;














