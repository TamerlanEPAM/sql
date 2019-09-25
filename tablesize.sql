SELECT 'game' AS "relation",  pg_size_pretty(pg_total_relation_size('game')) AS "total_size"
UNION
SELECT 'logging' AS "relation",  pg_size_pretty(pg_total_relation_size('logging')) AS "total_size"
UNION
SELECT 'penalty' AS "relation",  pg_size_pretty(pg_total_relation_size('penalty')) AS "total_size"
UNION
SELECT 'player' AS "relation",  pg_size_pretty(pg_total_relation_size('player')) AS "total_size"
UNION
SELECT 'player_penalty_game' AS "relation",  pg_size_pretty(pg_total_relation_size('penalty')) AS "total_size"
UNION
SELECT 'team' AS "relation",  pg_size_pretty(pg_total_relation_size('player')) AS "total_size"