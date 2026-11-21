-- Join crashes to a weekday lookup table to show readable day names.
SELECT w.day_name, COUNT(*) AS crashes,
       ROUND(100.0 * SUM(c.HAS_INJURY) / COUNT(*), 1) AS injury_rate_pct
FROM crashes AS c JOIN weekday_lookup AS w ON c.CRASH_DAY_OF_WEEK = w.day_num
GROUP BY w.day_name ORDER BY injury_rate_pct DESC;