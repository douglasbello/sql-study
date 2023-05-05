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
INSERT INTO weather (city,temp_low,temp_high,precipitation,date) 
VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');

INSERT INTO weather (city,temp_low,temp_high,precipitation,date) 
	VALUES ('San Francisco', 46, 50, 0.25, '1994-11-29'),
	('Hayward',37,54,0.24,'1994-11-29');

INSERT INTO weather (city,temp_low,temp_high,precipitation,date)
	VALUES ('Alabama',42,48,0.19,'1994-11-30');


-- You can write expressions, not just simple column references, in the select list.
SELECT city, (temp_high+temp_low)/2 AS temp_avg, date FROM weather;

-- WHERE AND 'AND'
SELECT * FROM weather 
	WHERE city = 'San Francisco' AND precipitation > 0.0;

-- ORDER BY
SELECT * FROM weather ORDER BY city;

-- YOU CAN REQUEST THAT DUPLICATE ROWS BE REMOVED FROM THE RESULT OF A QUERY
SELECT DISTINCT city FROM weather;

-- JOINS
SELECT * FROM weather JOIN us_states ON city = state_name;

SELECT city,temp_low,temp_high,precipitation,date FROM weather JOIN us_states ON city = state_name;


-- Since the columns all had different names, the parser automatically found which table they belong to. 
-- If there were duplicate column names in the two tables you'd need to qualify the 
-- column names to show which one you meant, as in:
SELECT weather.city, weather.temp_low, weather.temp_high,
       weather.precipitation, weather.date, us_states.state_region
    FROM weather JOIN us_states ON weather.city = us_states.state_name;

-- DROP
DROP TABLE weather;