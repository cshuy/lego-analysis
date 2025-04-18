SET search_path = 'analysis';


-- Question 1 - What is the total number of parts per the theme
SELECT t.name AS theme_name, SUM(s.num_parts) AS total_parts
FROM sets AS s
INNER JOIN themes AS t
ON t.id = s.theme_id
GROUP BY t.name 
ORDER BY SUM(s.num_parts) DESC;


-- Question 2 - What is the total number of parts per year
SELECT s.year AS year, SUM(s.num_parts) AS total_parts
FROM sets AS s
INNER JOIN themes AS t
ON t.id = s.theme_id
GROUP BY s.year 
ORDER BY SUM(s.num_parts) DESC;


-- Question 3 - How many sets released in each Century
SELECT (s.year / 100 + 1) AS century, COUNT(s.set_num) AS set
FROM sets AS s
GROUP BY century;


-- Question 4 - What percentage of Sets released in the 21st Century were "Trains" themed
WITH sets_21st_century AS(
	SELECT *
	FROM sets
	WHERE year >= 2001
),
trains_theme AS(
	SELECT id
	FROM themes AS t
	WHERE t.name ILIKE 'Trains'
),
trains_sets AS (
    SELECT * FROM sets_21st_century
    WHERE theme_id IN (SELECT id FROM trains_theme)
)
SELECT 
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM sets_21st_century), 2) AS percentage_trains
FROM trains_sets;


-- Question 5 - What was the popular theme by year in the 21st Century
WITH sets_21st_century AS (
    SELECT * FROM analysis.sets WHERE year >= 2001
),
theme_sets AS (
    SELECT 
        s.year,
        t.name AS theme_name,
        COUNT(*) AS total_sets
    FROM sets_21st_century s
    JOIN analysis.themes t ON s.theme_id = t.id
    GROUP BY s.year, t.name
),
ranked_themes AS (
    SELECT *,
           RANK() OVER (PARTITION BY year ORDER BY total_sets DESC) AS rk
    FROM theme_sets
)
SELECT year, theme_name, total_sets
FROM ranked_themes
WHERE rk = 1
ORDER BY year;


-- Question 6 - What is the most produced Color of LEGO
SELECT c.name AS color, SUM(ip.quantity) AS total_quantity
FROM colors AS c
INNER JOIN inventory_parts AS ip
ON c.id = ip.color_id
GROUP BY c.name 
ORDER BY SUM(ip.quantity) DESC
LIMIT 1;
