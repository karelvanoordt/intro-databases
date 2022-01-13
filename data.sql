/* Populate database with sample data. */
------------- DAY 1 ----------------------------
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', '2020-02-03', 10.23, true, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', '2018-11-15', 8, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', '2021-01-07', 15.04, false, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', '2017-05-12', 11, true, 5);

---------------DAY 2----------------------------

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

------------------DAY 3---------------------------

-- Insert the following data into the owners table:
INSERT INTO owners (full_name, age) 
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- Insert the following data into the species table:
INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

-- Modify your inserted animals so it includes the species_id value:

    -- If the name ends in "mon" it will be Digimon
    UPDATE animals 
    SET species_id = 2
    WHERE name LIKE '%mon';

    -- All other animals are Pokemon
    UPDATE animals
    SET species_id=1
    WHERE species_id IS NULL;

-- Modify your inserted animals to include owner information (owner_id):
    -- Sam Smith owns Agumon.
    UPDATE animals
    SET owner_id=1 WHERE name='Agumon';
    
    -- Jennifer Orwell owns Gabumon and Pikachu.
    UPDATE animals
    SET owner_id=2 WHERE name IN ('Gabumon', 'Pikachu');
    
    -- Bob owns Devimon and Plantmon.
    UPDATE animals
    SET owner_id=3 WHERE name IN ('Devimon', 'Plantmon');

    -- Melody Pond owns Charmander, Squirtle, and Blossom.
    UPDATE animals
    SET owner_id=4 WHERE name IN ('Charmander','Squirtle', 'Blossom');

    -- Dean Winchester owns Angemon and Boarmon.
    UPDATE animals
    SET owner_id=5 WHERE name IN ('Angemon', 'Boarmon');

   
----------------DAY 4 ---------------------

-- Insert the following data for vets:
INSERT INTO vets (name, age, date_of_graduation)
VALUES
('WIlliam Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harness', 38, '2008-06-08');

-- Insert the following data for specialties:
INSERT INTO specializations (vet_id,species_id)
VALUES
(1,1),
(3,1),
(3,2),
(4, 2);

-- Insert the following data for visits:
INSERT INTO visits (animals_id,vet_id,visit_date)
VALUES
(1, 1,'2020-05-24'),
(1, 3,'2020-07-22'),
(2, 4,'2021-02-02'),
(5,2,'2020-01-05'),
(5,2,'2020-03-04'),
(5,2,'2020-05-14'),
(3,3,'2021-05-04'),
(8,4,'2021-02-24'),
(10,2,'2019-12-21'),
(10,1,'2020-08-10'),
(10,2,'2021-04-07'),
(9,3,'2019-09-29'),
(7,4,'2020-10-03'),
(7,4,'2020-11-04'),
(4,2,'2019-01-24'),
(4,2,'2019-05-15'),
(4,2,'2020-02-27'),
(4,2,'2020-08-03'),
(6,3,'2020-05-24'),
(6,1,'2021-01-11');











