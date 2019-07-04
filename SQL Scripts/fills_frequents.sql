

DELIMITER $$
CREATE PROCEDURE fill_frequents()
BEGIN

	DECLARE num_of_drinkers INT DEFAULT 9959;
    DECLARE num_of_bars INT DEFAULT 960;
    DECLARE i INT DEFAULT 0;
    DECLARE j INT DEFAULT 0;
	DECLARE bar_name varchar(45) DEFAULT "";
	DECLARE bar_phone_num INT DEFAULT "";
	DECLARE rand_bar_num INT DEFAULT (FLOOR(RAND()*num_of_bars));
	DECLARE drinker_name varchar(45) DEFAULT "";
    DECLARE drinker_phone_num varchar(45) DEFAULT "";
    
    WHILE i < num_of_drinkers DO
        SELECT `Drinker Name`, `Drinker Phone #` INTO drinker_name, drinker_phone_num FROM Drinker LIMIT i,1;
        bar_loop: WHILE j < 5 DO
			SET rand_bar_num := (FLOOR(RAND()*num_of_bars));
            SELECT `Bar Name`, `Bar Phone #` INTO bar_name, bar_phone_num FROM `Bar` LIMIT rand_bar_num,1;
            IF EXISTS(SELECT `Bar Name`, `Drinker Name` FROM Frequents WHERE bar_name = `Bar Name` AND drinker_name = `Drinker Name`)THEN 
				leave bar_loop;
            END IF;
            IF NOT EXISTS(SELECT b1.`State`, p1.`State` FROM Bar b1, Drinker d1
				INNER JOIN Person p1 ON p1.`Name` = d1.`Drinker Name` AND d1.`Drinker Phone #` = p1.`Phone #` 
                WHERE p1.`Name` = drinker_name AND p1.`State` = b1.`State`) THEN
                SET j := j  + 1;
				ITERATE bar_loop;
            END IF;
            INSERT INTO Frequents (`Bar Name`, `Bar Phone #`, `Drinker Name`, `Drinker Phone #`) 
				VALUE (bar_name, bar_phone_num, drinker_name, drinker_phone_num);
			SET j := j + 1;
        END WHILE;
		SET i := i + 1;
        SET j := 0;
    END WHILE;

END$$
DELIMITER ;