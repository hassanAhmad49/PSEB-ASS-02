-- Which lighting conditions have the highest injury rate?
SELECT LIGHTING_CONDITION, COUNT(*) AS crashes,
       ROUND(100.0 * SUM(HAS_INJURY) / COUNT(*), 1) AS injury_rate_pct
FROM crashes GROUP BY LIGHTING_CONDITION HAVING COUNT(*) >= 200
ORDER BY injury_rate_pct DESC;