-- SIMPLE SELECT
SELECT * FROM us_states;

-- SELECT ONLY TWO COLUMNS FROM A TABLE
SELECT state_name, state_abbr FROM us_states;

-- WHERE
SELECT * FROM us_states WHERE state_id >= 2;

-- SIMPLE CREATE
CREATE TABLE weather (
	id SERIAL PRIMARY KEY,
	city VARCHAR(60),
	temp_low INT,
	temp_high INT,
	precipitation REAL,
	date DATE
);

-- INSERT
INSERT INTO weather (city,temp_low,temp_high,precipitation,date) VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');

-- DROP
DROP TABLE weather;