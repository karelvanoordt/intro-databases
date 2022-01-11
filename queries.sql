/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

SELECT * FROM animals WHERE name LIKE('%mon');
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name ('Agumon', 'Pikachu');
SELECT (name, escape_attempts) FROM animals WHERE weight_kg > 10.5; 
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- How many animals are there?
SELECT COUNT(*) FROM animals;
 count 
-------
     9
(1 row)

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
 count 
-------
     2
(1 row)

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
         avg         
---------------------
 16.6444444444444444
(1 row)

-- Who escapes the most, neutered or not neutered animals?

SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
 neutered | sum 
----------+-----
 f        |   4
 t        |  18
(2 rows)

-- What is the minimum and maximum weight of each type of animal?

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
 
 species | min | max 
---------+-----+-----
 pokemon |  11 |  17
 digimon |   8 |  45
(2 rows)

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth < '2000-01-01' GROUP BY species;
 species |        avg         
---------+--------------------
 pokemon | 3.0000000000000000
(1 row)