CREATE VIEW player_statistics
AS
SELECT total_total.name as name, total_won.won_games as won_games, total_total.total_games as total_games, total_tie.tie_games as tie_games, penalty_per_game.penalty_per_game as avg_penalty_per_game
	FROM(
-- 	Количесто выигранных игр всего
		SELECT ht_won.name, ht+gt as won_games
		FROM (
-- 		Количество игр выигранных дома
			SELECT name, COUNT(game.host_team) as ht
			FROM player
			FULL JOIN game
			ON player.team = game.host_team
			WHERE game.host_score>game.guest_score
			GROUP BY player.name) as ht_won
		FULL JOIN
			(
-- 	    Количество игр выигранных в гостях
			SELECT name, COUNT(game.guest_team) as gt
			FROM player 
			FULL JOIN game
			ON player.team = game.guest_team
			WHERE game.host_score<game.guest_score
			GROUP BY player.name) as gt_won
		ON ht_won.name = gt_won.name) as total_won
	FULL JOIN
		(
-- 	Количество игр всего
		SELECT ht_total.name, ht+gt as total_games
		FROM (
-- 		Количество игр сыгранных дома
			SELECT name, COUNT(game.host_team) as ht
			FROM player
			FULL JOIN game
			ON player.team = game.host_team
			GROUP BY player.name) as ht_total
		FULL JOIN
			(
-- 		Количество игр сыгранных в гостях
			SELECT name, COUNT(game.guest_team) as gt
			FROM player 
			FULL JOIN game
			ON player.team = game.guest_team
			GROUP BY player.name) as gt_total
		ON ht_total.name = gt_total.name) as total_total
	ON total_won.name = total_total.name
	FULL JOIN 
		(
-- 	Количество игр сыгранных в ничью всего
-- 		Количество игр сыгранных в ниxью дома
				SELECT player.name as name, COUNT(game.host_team) as tie_games
				FROM player
				FULL JOIN game
				ON player.team = game.host_team
				WHERE game.host_score=game.guest_score
				GROUP BY player.name
			UNION
-- 		Количество игр сыгранных в ничью в гостях
				SELECT player.name as name, COUNT(game.guest_team) as tie_games
				FROM player 
				FULL JOIN game
				ON player.team = game.guest_team
				WHERE game.host_score=game.guest_score
				GROUP BY player.name) as total_tie
	ON total_total.name = total_tie.name
FULL JOIN	
-- Количество штрафов в среднем за игру
	(SELECT total_total.name as name, CAST((CAST(player_penalty_game.total_penalty AS NUMERIC)/total_total.total_games) AS NUMERIC(3,2)) as penalty_per_game
FROM(
	SELECT ht_total.name as name, ht+gt as total_games
	FROM (
-- 		Количество игр сыгранных дома
		SELECT name, COUNT(game.host_team) as ht
		FROM player
		FULL JOIN game
		ON player.team = game.host_team
		GROUP BY player.name) as ht_total
	FULL JOIN
		(
-- 		Количество игр сыгранных в гостях
		SELECT name, COUNT(game.guest_team) as gt
		FROM player 
		FULL JOIN game
		ON player.team = game.guest_team
		GROUP BY player.name) as gt_total
	ON ht_total.name = gt_total.name) as total_total
FULL JOIN
	(SELECT player_name as name, COUNT(penalty) as total_penalty 
	 FROM player_penalty_game
	 GROUP BY NAME
	) as player_penalty_game
ON total_total.name = player_penalty_game.name) as penalty_per_game
ON total_total.name = penalty_per_game.name;