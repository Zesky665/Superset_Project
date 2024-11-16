-- Create the table
CREATE TABLE IF NOT EXISTS nation_demonyms (
    id INTEGER PRIMARY KEY,
    nation_name VARCHAR(100) NOT NULL,
    demonym VARCHAR(100) NOT NULL
);

-- Create unique indexes
CREATE UNIQUE INDEX idx_nation_name ON nation_demonyms(nation_name);
CREATE UNIQUE INDEX idx_demonym ON nation_demonyms(demonym);

-- If you need to clear existing data
TRUNCATE TABLE nation_demonyms;

-- Import data using COPY command
-- Note: Replace '/path/to/your/file.csv' with the actual file path
COPY nation_demonyms(id, nation_name, demonym)
FROM '/data/nations.csv'
WITH (
    FORMAT CSV,
    HEADER true,
    DELIMITER ',',
    ENCODING 'UTF8'
);