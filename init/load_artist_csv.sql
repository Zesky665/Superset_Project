-- Create the artists table
CREATE TABLE IF NOT EXISTS artists (
    artist_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50),
    gender VARCHAR(20),
    birth_year INTEGER,
    death_year INTEGER
);

-- Import data from CSV file
COPY artists(artist_id, name, nationality, gender, birth_year, death_year)
FROM '/data/artists.csv'
DELIMITER ','
CSV HEADER;