/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int PRIMARY KEY,
    name varchar(100),
    date_of_birth date,
    escape_attemps int,
    neutered boolean,
    weight_kg decimal,
);

ALTER TABLE animals
ADD species varchar(100);

-- Create owners table
CREATE TABLE owners (
    id BIGSERIAL PRIMARY KEY,
    full_name varchar(100),
    age int
);

-- Create species table
CREATE TABLE species (
    id int BIGSERIAL PRIMARY KEY,
    name varchar(100),
);

-- Modify animals table
ALTER TABLE animals
DROP COLUMN id;
ALTER TABLE animals
ADD COLUMN id BIGSERIAL PRIMARY KEY;

-- Delete species column
ALTER TABLE animals
DROP COLUMN species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species(id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owners
FOREIGN KEY (owner_id)
REFERENCES owners(id);




