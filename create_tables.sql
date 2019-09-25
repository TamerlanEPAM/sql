CREATE TABLE team(
	team VARCHAR(50) PRIMARY KEY,
	city VARCHAR(50) NOT NULL,
	coach VARCHAR(50) NOT NULL,
 captain INTEGER UNIQUE
);

CREATE TABLE player(
	player SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	position VARCHAR(50) NOT NULL,
	skill_level VARCHAR(50) NOT NULL,
	team VARCHAR(50),
	FOREIGN KEY (team) REFERENCES team(team)
);

ALTER TABLE team
ADD FOREIGN KEY (captain) REFERENCES player(player);

CREATE TABLE game(
	game SERIAL PRIMARY KEY,
	date DATE NOT NULL,
	host_score INTEGER NOT NULL,
	guest_score INTEGER NOT NULL,
	host_team VARCHAR(50) NOT NULL,
	guest_team VARCHAR(50) NOT NULL,
	FOREIGN KEY (host_team) REFERENCES team(team),
	FOREIGN KEY (guest_team) REFERENCES team(team)
);

CREATE TABLE penalty(
	penalty VARCHAR(50) PRIMARY KEY,
	description VARCHAR(255) NOT NULL
);

CREATE TABLE player_penalty_game(
	player_penalty_game SERIAL PRIMARY KEY,
	player INTEGER NOT NULL,
	player_name VARCHAR(50) NOT NULL,
	penalty VARCHAR(50) NOT NULL,
	game INTEGER NOT NULL,
	FOREIGN KEY (player) REFERENCES player(player),
	FOREIGN KEY (penalty) REFERENCES penalty(penalty),
	FOREIGN KEY (game) REFERENCES game(game)
);

CREATE TABLE logging(
	insert_date DATE,
	table_name VARCHAR,
	description VARCHAR,
	PRIMARY KEY(insert_date, table_name, description)
);

----------------------------- BEFORE UNCOMMIT RUN LOGGING.SQL-----------------------------

-- -- TEAMS
-- INSERT INTO team (team, city, coach)  
-- VALUES ('Tampa Bay Lightning', 'Tampa', 'Jon Cooper');
-- INSERT INTO team (team, city, coach)  
-- VALUES ('Washington Capitals', 'Washington', 'Todd Reirden');
-- INSERT INTO team (team, city, coach)  
-- VALUES ('Pittsburgh Penguins', 'Pittsburgh', 'Mike Sullivan');

-- -- PLAYERS
-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('Nikita Kucherov', 'forward', 'master','Tampa Bay Lightning');
-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('Steven Stamkos', 'forward', 'master','Tampa Bay Lightning');
-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('Ondřej Palát', 'forward', 'middle','Tampa Bay Lightning');
-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('Erik Černák', 'defenseman', 'junior','Tampa Bay Lightning');
-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('Mikhail Sergachev', 'defenseman', 'junior','Tampa Bay Lightning');

-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('Alexander Ovechkin', 'forward', 'master','Washington Capitals');
-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('Evgeny Kuznetsov', 'forward', 'middle','Washington Capitals');
-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('T. J. Oshie', 'forward', 'master','Washington Capitals');
-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('Dmitry Orlov', 'defenseman', 'master','Washington Capitals');
-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('Michal Kempný', 'defenseman', 'junior','Washington Capitals');

-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('Sidney Crosby', 'forward', 'master','Pittsburgh Penguins');
-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('Evgeni Malkin', 'forward', 'master','Pittsburgh Penguins');
-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('Bryan Rust', 'forward', 'middle','Pittsburgh Penguins');
-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('Justin Schultz', 'defenseman', 'junior','Pittsburgh Penguins');
-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('Kris Letang', 'defenseman', 'junior','Pittsburgh Penguins');
-- INSERT INTO player (name, position, skill_level)  
-- VALUES ('Tamerlan Zhabassov', 'defenseman', 'junior');

-- -- INSERT CAPITANS TO TEAMS
-- UPDATE team
-- SET captain = (SELECT player FROM player WHERE name = 'Steven Stamkos')
-- WHERE team = 'Tampa Bay Lightning';
-- UPDATE team
-- SET captain = (SELECT player FROM player WHERE name = 'Alexander Ovechkin')
-- WHERE team = 'Washington Capitals';
-- UPDATE team
-- SET captain = (SELECT player FROM player WHERE name = 'Sidney Crosby')
-- WHERE team = 'Pittsburgh Penguins';

-- -- GAMES
-- INSERT INTO game (date, host_score, guest_score, host_team, guest_team)  
-- VALUES ('2015-12-17', 0, 1, 'Pittsburgh Penguins', 'Washington Capitals');
-- INSERT INTO game (date, host_score, guest_score, host_team, guest_team)  
-- VALUES ('2015-11-28', 3, 1, 'Washington Capitals', 'Tampa Bay Lightning');
-- INSERT INTO game (date, host_score, guest_score, host_team, guest_team)  
-- VALUES ('2015-12-01', 4, 4, 'Tampa Bay Lightning', 'Pittsburgh Penguins');

-- -- PENALTIES
-- INSERT INTO penalty (penalty, description)  
-- VALUES ('butt ending', 'when a player jabs an opponent with the top end of his stick.');
-- INSERT INTO penalty (penalty, description)  
-- VALUES ('checking from behind', 'whistled when a player hits an opponent who is not aware of the impending contact from behind and therefore cannot defend himself.');
-- INSERT INTO penalty (penalty, description)  
-- VALUES ('cross checking', 'when a player makes a check with both hands on the stick.');
-- INSERT INTO penalty (penalty, description)  
-- VALUES ('elbowing', 'when a player uses his elbow to foul an opponent.');
-- INSERT INTO penalty (penalty, description)  
-- VALUES ('hooking', 'when a player impedes the progress of an opponent by “hooking” him with his stick.');

-- -- -- PLAYER_PENALTY_GAME
-- INSERT INTO player_penalty_game (player, player_name, penalty, game)   
-- VALUES ((SELECT player FROM player where name='Justin Schultz'), 'Justin Schultz', 'hooking', (SELECT game FROM game WHERE guest_team = (SELECT team FROM player WHERE name = 'Justin Schultz') LIMIT 1));
-- INSERT INTO player_penalty_game (player, player_name, penalty, game)   
-- VALUES ((SELECT player FROM player where name='Justin Schultz'), 'Justin Schultz', 'elbowing', (SELECT game FROM game WHERE host_team = (SELECT team FROM player WHERE name = 'Justin Schultz') LIMIT 1));

-- INSERT INTO player_penalty_game (player, player_name, penalty, game)   
-- VALUES ((SELECT player FROM player where name='Michal Kempný'), 'Michal Kempný', 'cross checking', (SELECT game FROM game WHERE guest_team = (SELECT team FROM player WHERE name = 'Michal Kempný') LIMIT 1));
-- INSERT INTO player_penalty_game (player, player_name, penalty, game)   
-- VALUES ((SELECT player FROM player where name='Michal Kempný'), 'Michal Kempný', 'checking from behind', (SELECT  game FROM game WHERE guest_team = (SELECT team FROM player WHERE name = 'Michal Kempný') LIMIT 1));

-- INSERT INTO player_penalty_game (player, player_name, penalty, game)   
-- VALUES ((SELECT player FROM player where name='Erik Černák'), 'Erik Černák', 'checking from behind', (SELECT  game FROM game WHERE guest_team = (SELECT team FROM player WHERE name = 'Erik Černák') LIMIT 1));
-- INSERT INTO player_penalty_game (player, player_name, penalty, game)   
-- VALUES ((SELECT player FROM player where name='Erik Černák'), 'Erik Černák', 'hooking', (SELECT  game FROM game WHERE guest_team = (SELECT team FROM player WHERE name = 'Erik Černák') LIMIT 1));

-- INSERT INTO player_penalty_game (player, player_name, penalty, game)   
-- VALUES ((SELECT player FROM player where name='T. J. Oshie'), 'T. J. Oshie', 'checking from behind', (SELECT  game FROM game WHERE guest_team = (SELECT team FROM player WHERE name = 'T. J. Oshie') LIMIT 1));
-- INSERT INTO player_penalty_game (player, player_name, penalty, game)   
-- VALUES ((SELECT player FROM player where name='Steven Stamkos'), 'Steven Stamkos', 'elbowing', (SELECT  game FROM game WHERE guest_team = (SELECT team FROM player WHERE name = 'Steven Stamkos') LIMIT 1));

-- INSERT INTO player_penalty_game (player, player_name, penalty, game)   
-- VALUES ((SELECT player FROM player where name='T. J. Oshie'), 'T. J. Oshie', 'checking from behind', (SELECT  game FROM game WHERE guest_team = (SELECT team FROM player WHERE name = 'T. J. Oshie') LIMIT 1));
-- INSERT INTO player_penalty_game (player, player_name, penalty, game)   
-- VALUES ((SELECT player FROM player where name='Steven Stamkos'), 'Steven Stamkos', 'elbowing', (SELECT  game FROM game WHERE guest_team = (SELECT team FROM player WHERE name = 'Steven Stamkos') LIMIT 1));

-- INSERT INTO player_penalty_game (player, player_name, penalty, game)   
-- VALUES ((SELECT player FROM player where name='Ondřej Palát'), 'Ondřej Palát', 'checking from behind', (SELECT  game FROM game WHERE guest_team = (SELECT team FROM player WHERE name = 'Ondřej Palát') LIMIT 1));
-- INSERT INTO player_penalty_game (player, player_name, penalty, game)   
-- VALUES ((SELECT player FROM player where name='Ondřej Palát'), 'Ondřej Palát', 'elbowing', (SELECT  game FROM game WHERE guest_team = (SELECT team FROM player WHERE name = 'Ondřej Palát') LIMIT 1));
-- INSERT INTO player_penalty_game (player, player_name, penalty, game)   
-- VALUES ((SELECT player FROM player where name='Ondřej Palát'), 'Ondřej Palát', 'elbowing', (SELECT game FROM game WHERE guest_team = (SELECT team FROM player WHERE name = 'Ondřej Palát') LIMIT 1));


-- -- CHECKING LOGGING 
-- INSERT INTO team (team, city, coach)  
-- VALUES ('Barys', 'Astana', 'Daren Diz');

-- INSERT INTO player (name, position, skill_level, team)  
-- VALUES ('Talgat Zhailaylov', 'forward', 'middle','Barys');

-- INSERT INTO team (team, city, coach)  
-- VALUES ('Sibir', 'Novosibirsk', 'Tarasenko Sergey');

-- INSERT INTO team (team, city, coach)  
-- VALUES ('Amur', 'Khabarovsk', 'Alexandr Kovalchuk');

-- INSERT INTO team (team, city, coach)  
-- VALUES ('Dinamo', 'Minsk', 'Ruslan Solei');

-- INSERT INTO team (team, city, coach)  
-- VALUES ('Dinamo Rg', 'Riga', 'Ozilinish  Darznish');

-- INSERT INTO team (team, city, coach)  
-- VALUES ('Dinamo Msk', 'Moskow', 'alexandr Radulow');

-- INSERT INTO team (team, city, coach)  
-- VALUES ('Ak Bars', 'Kazan', 'Nikoly Antropov');

-- INSERT INTO team (team, city, coach)  
-- VALUES ('Yikerrit', 'Helsenki', 'Irra Kapaanen');

-- INSERT INTO team (team, city, coach)  
-- VALUES ('Admiral', 'Vlodivostok', 'Hotel by znat');

-- INSERT INTO game (date, host_score, guest_score, host_team, guest_team)  
-- VALUES ('2015-11-26', 3, 2, 'Barys', 'Admiral');
