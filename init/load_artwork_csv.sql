-- Create the artworks table
CREATE TABLE IF NOT EXISTS artworks (
    artwork_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL DEFAULT 'Untitled',
    artist_id TEXT,
    artist_name TEXT,
    date TEXT,
    medium TEXT,
    dimensions TEXT,
    acquisition_date TEXT,  -- Changed from DATE to TEXT
    credit TEXT,
    catalogue BOOLEAN,
    department VARCHAR(100),
    classification VARCHAR(100),
    object_number VARCHAR(50),
    -- Measurements
    diameter_cm DECIMAL(10,2),
    circumference_cm DECIMAL(10,2),
    height_cm DECIMAL(10,2),
    length_cm DECIMAL(10,2),
    width_cm DECIMAL(10,2),
    depth_cm DECIMAL(10,2),
    weight_kg DECIMAL(10,2),
    duration_seconds INTEGER
);

-- Create a temporary table WITHOUT copying constraints
CREATE TEMPORARY TABLE temp_artworks (
    artwork_id INTEGER,
    title TEXT,
    artist_id TEXT,
    artist_name TEXT,
    date TEXT,
    medium TEXT,
    dimensions TEXT,
    acquisition_date TEXT,  -- Changed from DATE to TEXT
    credit TEXT,
    catalogue BOOLEAN,
    department VARCHAR(100),
    classification VARCHAR(100),
    object_number VARCHAR(50),
    diameter_cm DECIMAL(10,2),
    circumference_cm DECIMAL(10,2),
    height_cm DECIMAL(10,2),
    length_cm DECIMAL(10,2),
    width_cm DECIMAL(10,2),
    depth_cm DECIMAL(10,2),
    weight_kg DECIMAL(10,2),
    duration_seconds INTEGER
);

-- Copy data into temporary table
COPY temp_artworks(
    artwork_id, title, artist_id, artist_name, date, medium, dimensions, 
    acquisition_date, credit, catalogue, department, classification, 
    object_number, diameter_cm, circumference_cm, height_cm, length_cm, 
    width_cm, depth_cm, weight_kg, duration_seconds
)
FROM '/data/artworks.csv'
DELIMITER ','
CSV HEADER;

-- Insert into final table with COALESCE
INSERT INTO artworks
SELECT 
    artwork_id,
    COALESCE(NULLIF(title, ''), 'Untitled') as title,
    artist_id,
    artist_name,
    date,
    medium,
    dimensions,
    acquisition_date,
    credit,
    catalogue,
    department,
    classification,
    object_number,
    diameter_cm,
    circumference_cm,
    height_cm,
    length_cm,
    width_cm,
    depth_cm,
    weight_kg,
    duration_seconds
FROM temp_artworks;

-- Create indexes
CREATE INDEX idx_artworks_artist_id ON artworks(artist_id);
CREATE INDEX idx_artworks_department ON artworks(department);
CREATE INDEX idx_artworks_classification ON artworks(classification);

-- Clean up
DROP TABLE temp_artworks;