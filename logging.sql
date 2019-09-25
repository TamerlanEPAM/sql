-- Функция и триггер для таблицы team

CREATE OR REPLACE FUNCTION logging_func_team() RETURNS trigger AS 
$$
BEGIN
 IF (TG_OP = 'DELETE') THEN
                        INSERT INTO logging SELECT now(), TG_TABLE_NAME, CONCAT(
																	CASE WHEN OLD.team IS NOT NULL THEN CONCAT('team: ',OLD.team)
																	END,
																	CASE WHEN OLD.team IS NOT NULL AND OLD.city IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.city IS NOT NULL THEN CONCAT('city: ', OLD.city)
																	END,
																	CASE WHEN (OLD.city IS NOT NULL OR OLD.team IS NOT NULL) AND OLD.coach IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.coach IS NOT NULL THEN CONCAT('coach: ', OLD.coach)
																	END,
																	CASE WHEN (OLD.coach IS NOT NULL OR OLD.city IS NOT NULL OR OLD.team IS NOT NULL) AND OLD.captain IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.captain IS NOT NULL THEN CONCAT('captain: ', OLD.captain)
																	END
																	);
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
                        INSERT INTO logging SELECT now(), TG_TABLE_NAME, CONCAT(
																	CASE WHEN NEW.team IS NOT NULL THEN CONCAT('team: ',NEW.team)
																	END,
																	CASE WHEN NEW.team IS NOT NULL AND NEW.city IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.city IS NOT NULL THEN CONCAT('city: ', NEW.city)
																	END,
																	CASE WHEN (NEW.city IS NOT NULL OR NEW.team IS NOT NULL) AND NEW.coach IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.coach IS NOT NULL THEN CONCAT('coach: ', NEW.coach)
																	END,
																	CASE WHEN (NEW.coach IS NOT NULL OR NEW.city IS NOT NULL OR NEW.team IS NOT NULL) AND NEW.captain IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.captain IS NOT NULL THEN CONCAT('captain: ', NEW.captain)
																	END
																	);
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO logging SELECT now(), TG_TABLE_NAME, CONCAT(
																	CASE WHEN NEW.team IS NOT NULL THEN CONCAT('team: ',NEW.team)
																	END,
																	CASE WHEN NEW.team IS NOT NULL AND NEW.city IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.city IS NOT NULL THEN CONCAT('city: ', NEW.city)
																	END,
																	CASE WHEN (NEW.city IS NOT NULL OR NEW.team IS NOT NULL) AND NEW.coach IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.coach IS NOT NULL THEN CONCAT('coach: ', NEW.coach)
																	END,
																	CASE WHEN (NEW.coach IS NOT NULL OR NEW.city IS NOT NULL OR NEW.team IS NOT NULL) AND NEW.captain IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.captain IS NOT NULL THEN CONCAT('captain: ', NEW.captain)
																	END
																	);
            RETURN NEW;
        END IF;
        RETURN NULL;
END;
$$
LANGUAGE  plpgsql;

CREATE TRIGGER logging_trigger_team BEFORE INSERT OR UPDATE OR DELETE 
ON team
FOR EACH ROW
EXECUTE PROCEDURE logging_func_team();


-- Функция и триггер для таблицы player
CREATE OR REPLACE FUNCTION logging_func_player() RETURNS trigger AS 
$$
BEGIN
 IF (TG_OP = 'DELETE') THEN
                        INSERT INTO logging SELECT now(), TG_TABLE_NAME, CONCAT(
																	CASE WHEN OLD.player IS NOT NULL THEN CONCAT('player: ',OLD.player)
																	END,
																	CASE WHEN OLD.player IS NOT NULL AND OLD.name IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.name IS NOT NULL THEN CONCAT('name: ', OLD.name)
																	END,
																	CASE WHEN (OLD.name IS NOT NULL OR OLD.player IS NOT NULL) AND OLD.position IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.position IS NOT NULL THEN CONCAT('position: ', OLD.position)
																	END,
																	CASE WHEN (OLD.position IS NOT NULL OR OLD.name IS NOT NULL OR OLD.player IS NOT NULL) AND OLD.skill_level IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.skill_level IS NOT NULL THEN CONCAT('skill_level: ', OLD.skill_level)
																	END,
																	CASE WHEN (OLD.position IS NOT NULL OR OLD.name IS NOT NULL OR OLD.player IS NOT NULL OR OLD.skill_level IS NOT NULL) AND OLD.team IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.team IS NOT NULL THEN CONCAT('team: ',OLD.team)
																	END
																	);
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
                        INSERT INTO logging SELECT now(), TG_TABLE_NAME, CONCAT(
																	CASE WHEN NEW.player IS NOT NULL THEN CONCAT('player: ',NEW.player)
																	END,
																	CASE WHEN NEW.player IS NOT NULL AND NEW.name IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.name IS NOT NULL THEN CONCAT('name: ', NEW.name)
																	END,
																	CASE WHEN (NEW.name IS NOT NULL OR NEW.player IS NOT NULL) AND NEW.position IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.position IS NOT NULL THEN CONCAT('position: ', NEW.position)
																	END,
																	CASE WHEN (NEW.position IS NOT NULL OR NEW.name IS NOT NULL OR NEW.player IS NOT NULL) AND NEW.skill_level IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.skill_level IS NOT NULL THEN CONCAT('skill_level: ', NEW.skill_level)
																	END,
																	CASE WHEN (NEW.position IS NOT NULL OR NEW.name IS NOT NULL OR NEW.player IS NOT NULL OR NEW.skill_level IS NOT NULL) AND NEW.team IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.team IS NOT NULL THEN CONCAT('team: ',NEW.team)
																	END
																	);
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO logging SELECT now(), TG_TABLE_NAME, CONCAT(
																	CASE WHEN NEW.player IS NOT NULL THEN CONCAT('player: ',NEW.player)
																	END,
																	CASE WHEN NEW.player IS NOT NULL AND NEW.name IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.name IS NOT NULL THEN CONCAT('name: ', NEW.name)
																	END,
																	CASE WHEN (NEW.name IS NOT NULL OR NEW.player IS NOT NULL) AND NEW.position IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.position IS NOT NULL THEN CONCAT('position: ', NEW.position)
																	END,
																	CASE WHEN (NEW.position IS NOT NULL OR NEW.name IS NOT NULL OR NEW.player IS NOT NULL) AND NEW.skill_level IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.skill_level IS NOT NULL THEN CONCAT('skill_level: ', NEW.skill_level)
																	END,
																	CASE WHEN (NEW.position IS NOT NULL OR NEW.name IS NOT NULL OR NEW.player IS NOT NULL OR NEW.skill_level IS NOT NULL) AND NEW.team IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.team IS NOT NULL THEN CONCAT('team: ',NEW.team)
																	END
																	);
            RETURN NEW;
        END IF;
        RETURN NULL;
END;
$$
LANGUAGE  plpgsql;

CREATE TRIGGER logging_trigger_player AFTER INSERT OR UPDATE OR DELETE 
ON player
FOR EACH ROW
EXECUTE PROCEDURE logging_func_player();

-- Триггер и функция для таблицы game

CREATE OR REPLACE FUNCTION logging_func_game() RETURNS trigger AS 
$$
BEGIN
 IF (TG_OP = 'DELETE') THEN
                        INSERT INTO logging SELECT now(), TG_TABLE_NAME, CONCAT(
																	CASE WHEN OLD.game IS NOT NULL THEN CONCAT('game: ',OLD.game)
																	END,
																	CASE WHEN OLD.game IS NOT NULL AND OLD.date IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.date IS NOT NULL THEN CONCAT('date: ', OLD.date)
																	END,
																	CASE WHEN (OLD.date IS NOT NULL OR OLD.game IS NOT NULL) AND OLD.host_score IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.host_score IS NOT NULL THEN CONCAT('host_score: ', OLD.host_score)
																	END,
																	CASE WHEN (OLD.host_score IS NOT NULL OR OLD.date IS NOT NULL OR NEW.game IS NOT NULL) AND OLD.guest_score IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.guest_score IS NOT NULL THEN CONCAT('guest_score: ', OLD.guest_score)
																	END,
																	CASE WHEN (OLD.host_score IS NOT NULL OR OLD.date IS NOT NULL OR OLD.game IS NOT NULL OR OLD.guest_score IS NOT NULL) AND OLD.host_team IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.host_team IS NOT NULL THEN CONCAT('host_team: ',OLD.host_team)
																	END,
																	CASE WHEN (OLD.host_score IS NOT NULL OR OLD.date IS NOT NULL OR OLD.game IS NOT NULL OR OLD.guest_score IS NOT NULL OR OLD.host_team IS NOT NULL) AND OLD.guest_team IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.guest_team IS NOT NULL THEN CONCAT('guest_team: ',OLD.guest_team)
																	END
																	);
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
                        INSERT INTO logging SELECT now(), TG_TABLE_NAME, CONCAT(
																	CASE WHEN NEW.game IS NOT NULL THEN CONCAT('game: ',NEW.game)
																	END,
																	CASE WHEN NEW.game IS NOT NULL AND NEW.date IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.date IS NOT NULL THEN CONCAT('date: ', NEW.date)
																	END,
																	CASE WHEN (NEW.date IS NOT NULL OR NEW.game IS NOT NULL) AND NEW.host_score IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.host_score IS NOT NULL THEN CONCAT('host_score: ', NEW.host_score)
																	END,
																	CASE WHEN (NEW.host_score IS NOT NULL OR NEW.date IS NOT NULL OR NEW.game IS NOT NULL) AND NEW.guest_score IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.guest_score IS NOT NULL THEN CONCAT('guest_score: ', NEW.guest_score)
																	END,
																	CASE WHEN (NEW.host_score IS NOT NULL OR NEW.date IS NOT NULL OR NEW.game IS NOT NULL OR NEW.guest_score IS NOT NULL) AND NEW.host_team IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.host_team IS NOT NULL THEN CONCAT('host_team: ',NEW.host_team)
																	END,
																	CASE WHEN (NEW.host_score IS NOT NULL OR NEW.date IS NOT NULL OR NEW.game IS NOT NULL OR NEW.guest_score IS NOT NULL OR NEW.host_team IS NOT NULL) AND NEW.guest_team IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.guest_team IS NOT NULL THEN CONCAT('guest_team: ',NEW.guest_team)
																	END
																	);
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO logging SELECT now(), TG_TABLE_NAME, CONCAT(
																	CASE WHEN NEW.game IS NOT NULL THEN CONCAT('game: ',NEW.game)
																	END,
																	CASE WHEN NEW.game IS NOT NULL AND NEW.date IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.date IS NOT NULL THEN CONCAT('date: ', NEW.date)
																	END,
																	CASE WHEN (NEW.date IS NOT NULL OR NEW.game IS NOT NULL) AND NEW.host_score IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.host_score IS NOT NULL THEN CONCAT('host_score: ', NEW.host_score)
																	END,
																	CASE WHEN (NEW.host_score IS NOT NULL OR NEW.date IS NOT NULL OR NEW.game IS NOT NULL) AND NEW.guest_score IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.guest_score IS NOT NULL THEN CONCAT('guest_score: ', NEW.guest_score)
																	END,
																	CASE WHEN (NEW.host_score IS NOT NULL OR NEW.date IS NOT NULL OR NEW.game IS NOT NULL OR NEW.guest_score IS NOT NULL) AND NEW.host_team IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.host_team IS NOT NULL THEN CONCAT('host_team: ',NEW.host_team)
																	END,
																	CASE WHEN (NEW.host_score IS NOT NULL OR NEW.date IS NOT NULL OR NEW.game IS NOT NULL OR NEW.guest_score IS NOT NULL OR NEW.host_team IS NOT NULL) AND NEW.guest_team IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.guest_team IS NOT NULL THEN CONCAT('guest_team: ',NEW.guest_team)
																	END
																	);
            RETURN NEW;
        END IF;
        RETURN NULL;
END;
$$
LANGUAGE  plpgsql;


CREATE TRIGGER logging_trigger_game AFTER INSERT OR UPDATE OR DELETE 
ON game
FOR EACH ROW
EXECUTE PROCEDURE logging_func_game();


-- Функция и триггеры для таблицы penalty


CREATE OR REPLACE FUNCTION logging_func_penalty() RETURNS trigger AS 
$$
BEGIN
 IF (TG_OP = 'DELETE') THEN
                        INSERT INTO logging SELECT now(), TG_TABLE_NAME, CONCAT(
																	CASE WHEN OLD.penalty IS NOT NULL THEN CONCAT('penalty: ', OLD.penalty)
																	END,
																	CASE WHEN OLD.penalty IS NOT NULL AND OLD.description IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.description IS NOT NULL THEN CONCAT('description: ', OLD.description)
																	END
																	);
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
                        INSERT INTO logging SELECT now(), TG_TABLE_NAME, CONCAT(
																	CASE WHEN NEW.penalty IS NOT NULL THEN CONCAT('penalty: ',NEW.penalty)
																	END,
																	CASE WHEN NEW.penalty IS NOT NULL AND NEW.description IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.description IS NOT NULL THEN CONCAT('description: ', NEW.description)
																	END
																	);
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO logging SELECT now(), TG_TABLE_NAME, CONCAT(
																	CASE WHEN NEW.penalty IS NOT NULL THEN CONCAT('penalty: ',NEW.penalty)
																	END,
																	CASE WHEN NEW.penalty IS NOT NULL AND NEW.description IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.description IS NOT NULL THEN CONCAT('description: ', NEW.description)
																	END
																	);
            RETURN NEW;
        END IF;
        RETURN NULL;
END;
$$
LANGUAGE  plpgsql;


CREATE TRIGGER logging_trigger_penalty AFTER INSERT OR UPDATE OR DELETE 
ON penalty
FOR EACH ROW
EXECUTE PROCEDURE logging_func_penalty();

-- Функция и триггер

CREATE OR REPLACE FUNCTION logging_func_player_penalty_game() RETURNS trigger AS 
$$
BEGIN
 IF (TG_OP = 'DELETE') THEN
                        INSERT INTO logging SELECT now(), TG_TABLE_NAME, CONCAT(
																	CASE WHEN OLD.player_penalty_game IS NOT NULL THEN CONCAT('player_penalty_game: ',OLD.player_penalty_game)
																	END,
																	CASE WHEN OLD.player_penalty_game IS NOT NULL AND OLD.player IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.player IS NOT NULL THEN CONCAT('player: ', OLD.player)
																	END,
																	CASE WHEN (OLD.player_penalty_game IS NOT NULL OR OLD.player IS NOT NULL) AND OLD.player_name IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.player_name IS NOT NULL THEN CONCAT('player_name: ', OLD.player_name)
																	END,
																	CASE WHEN (OLD.player_name IS NOT NULL OR OLD.player IS NOT NULL OR OLD.player_penalty_game IS NOT NULL) AND OLD.penalty IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.penalty IS NOT NULL THEN CONCAT('penalty: ', OLD.penalty)
																	END,
																	CASE WHEN (OLD.player_name IS NOT NULL OR OLD.player IS NOT NULL OR OLD.player_penalty_game IS NOT NULL OR OLD.penalty IS NOT NULL) AND OLD.game IS NOT NULL THEN '; '
																	END,
																	CASE WHEN OLD.game IS NOT NULL THEN CONCAT('team: ',OLD.game)
																	END
																	);
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
                        INSERT INTO logging SELECT now(), TG_TABLE_NAME, CONCAT(
																	CASE WHEN NEW.player_penalty_game IS NOT NULL THEN CONCAT('player_penalty_game: ',NEW.player_penalty_game)
																	END,
																	CASE WHEN NEW.player_penalty_game IS NOT NULL AND NEW.player IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.player IS NOT NULL THEN CONCAT('player: ', NEW.player)
																	END,
																	CASE WHEN (NEW.player_penalty_game IS NOT NULL OR NEW.player IS NOT NULL) AND NEW.player_name IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.player_name IS NOT NULL THEN CONCAT('player_name: ', NEW.player_name)
																	END,
																	CASE WHEN (NEW.player_name IS NOT NULL OR NEW.player IS NOT NULL OR NEW.player_penalty_game IS NOT NULL) AND NEW.penalty IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.penalty IS NOT NULL THEN CONCAT('penalty: ', NEW.penalty)
																	END,
																	CASE WHEN (NEW.player_name IS NOT NULL OR NEW.player IS NOT NULL OR NEW.player_penalty_game IS NOT NULL OR NEW.penalty IS NOT NULL) AND NEW.game IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.game IS NOT NULL THEN CONCAT('team: ',NEW.game)
																	END
																	);
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO logging SELECT now(), TG_TABLE_NAME, CONCAT(
																	CASE WHEN NEW.player_penalty_game IS NOT NULL THEN CONCAT('player_penalty_game: ',NEW.player_penalty_game)
																	END,
																	CASE WHEN NEW.player_penalty_game IS NOT NULL AND NEW.player IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.player IS NOT NULL THEN CONCAT('player: ', NEW.player)
																	END,
																	CASE WHEN (NEW.player_penalty_game IS NOT NULL OR NEW.player IS NOT NULL) AND NEW.player_name IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.player_name IS NOT NULL THEN CONCAT('player_name: ', NEW.player_name)
																	END,
																	CASE WHEN (NEW.player_name IS NOT NULL OR NEW.player IS NOT NULL OR NEW.player_penalty_game IS NOT NULL) AND NEW.penalty IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.penalty IS NOT NULL THEN CONCAT('penalty: ', NEW.penalty)
																	END,
																	CASE WHEN (NEW.player_name IS NOT NULL OR NEW.player IS NOT NULL OR NEW.player_penalty_game IS NOT NULL OR NEW.penalty IS NOT NULL) AND NEW.game IS NOT NULL THEN '; '
																	END,
																	CASE WHEN NEW.game IS NOT NULL THEN CONCAT('team: ',NEW.game)
																	END
																	);
            RETURN NEW;
        END IF;
        RETURN NULL;
END;
$$
LANGUAGE  plpgsql;

CREATE TRIGGER logging_trigger_player_penalty_game AFTER INSERT OR UPDATE OR DELETE 
ON player_penalty_game
FOR EACH ROW
EXECUTE PROCEDURE logging_func_player_penalty_game();

