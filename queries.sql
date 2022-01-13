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

------------------DAY 3----------------------
-- What animals belong to Melody Pond?
SELECT animals.name FROM animals 
JOIN owners ON animals.owner_id=owners.id 
WHERE full_name='Melody Pond';
--     name    
-- ------------
--  Squirtle
--  Charmander
--  Blossom
-- (3 rows)

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals 
JOIN species ON animals.species_id=species.id 
WHERE species.name = 'Pokemon';
--     name    
-- ------------
--  Pikachu
--  Squirtle
--  Charmander
--  Blossom
-- (4 rows)

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT animals.name, full_name FROM owners 
LEFT JOIN animals ON animals.owner_id=owners.id;
--     name    |    full_name    
-- ------------+-----------------
--  Agumon     | Sam Smith
--  Pikachu    | Jennifer Orwell
--  Gabumon    | Jennifer Orwell
--  Devimon    | Bob
--  Squirtle   | Melody Pond
--  Charmander | Melody Pond
--  Blossom    | Melody Pond
--  Angemon    | Dean Winchester
--  Boarmon    | Dean Winchester
--             | Jodie Whittaker
-- (10 rows)

-- How many animals are there per species?
SELECT species.name, COUNT(*) FROM animals
JOIN species ON animals.species_id=species.id
GROUP BY species.name;
--   name   | count 
-- ---------+-------
--  Pokemon |     4
--  Digimon |     5
-- (2 rows)

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name FROM animals
JOIN owners ON animals.owner_id=owners.id
WHERE owners.full_name='Jennifer Orwell' AND species_id=2;
--   name   
-- ---------
--  Gabumon
-- (1 row)

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name FROM animals
JOIN owners ON animals.owner_id=owners.id 
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts=0;
--  name 
-- ------
-- (0 rows)

-- Who owns the most animals?
SELECT owners.full_name, COUNT(*) AS tcount FROM animals
JOIN owners ON animals.owner_id=owners.id
GROUP BY owners.full_name
ORDER BY tcount DESC LIMIT 1;
--   full_name  | tcount 
-- -------------+--------
--  Melody Pond |      3
-- (1 row)


------------------ DAY 4 -------------------

-- Who was the last animal seen by William Tatcher?
SELECT vets.name AS vetName, animals.name AS animalName, visit_date FROM vets
JOIN visits ON vets.id=visits.vet_id
JOIN animals ON animals.id= visits.animals_id 
WHERE vets.id =1
ORDER BY visits.visit_date DESC LIMIT 1;

--      vetname     | animalname | visit_date 
-- -----------------+------------+------------
--  WIlliam Tatcher | Blossom    | 2021-01-11
-- (1 row)


-- How many different animals did Stephanie Mendez see?
SELECT COUNT(*) AS total from vets
JOIN visits ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez';
--  total 
-- -------
--      4
-- (1 row)

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name AS spec FROM vets
LEFT JOIN specializations ON specializations.vet_id = vets.id
LEFT JOIN species ON specializations.species_id = species.id;
--        name       |  spec   
-- ------------------+---------
--  WIlliam Tatcher  | Pokemon
--  Stephanie Mendez | Pokemon
--  Stephanie Mendez | Digimon
--  Jack Harness     | Digimon
--  Maisy Smith      | 
-- (5 rows)

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name, visit_date FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez' AND visit_date BETWEEN '2020-04-01' AND '2020-08-30';
--   name   | visit_date 
-- ---------+------------
--  Agumon  | 2020-07-22
--  Blossom | 2020-05-24
-- (2 rows)

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(*) as totalVisits FROM animals
JOIN visits ON visits.animals_id = animals.id
GROUP BY animals.name
ORDER BY totalVisits DESC LIMIT 1;
--   name   | totalvisits 
-- ---------+-------------
--  Boarmon |           4
-- (1 row)

-- Who was Maisy Smith's first visit?
SELECT animals.name, vets.name, visit_date FROM vets
JOIN visits ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visit_date ASC LIMIT 1;
--   name   |    name     | visit_date 
-- ---------+-------------+------------
--  Boarmon | Maisy Smith | 2019-01-24
-- (1 row)

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT
visit_date,
animals.name,
animals.date_of_birth,
animals.weight_kg,
animals.neutered,
animals.escape_attempts,
vets.name AS vet_name,
vets.age AS vet_age,
vets.date_of_graduation FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vet_id
ORDER BY visit_date DESC LIMIT 1;
--  visit_date |  name   | date_of_birth | weight_kg | neutered | escape_attempts |     vet_name     | vet_age | date_of_graduation 
-- ------------+---------+---------------+-----------+----------+-----------------+------------------+---------+--------------------
--  2021-05-04 | Devimon | 2017-05-12    |        11 | t        |               5 | Stephanie Mendez |      64 | 1981-05-04
-- (1 row)

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT
COUNT(*) FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vet_id
JOIN specializations ON specializations.vet_id = visits.vet_id
WHERE animals.species_id != specializations.species_id;
--  count 
-- -------
--      7
-- (1 row)

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name AS suggested,  COUNT(visits.animals_id) FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animals_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name;
--  suggested | count 
-- -----------+-------
--  Digimon   |     6
--  Pokemon   |     3
-- (2 rows)
