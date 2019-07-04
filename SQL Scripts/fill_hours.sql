DROP PROCEDURE fill_hours;
DELIMITER $$

CREATE PROCEDURE fill_hours()
BEGIN

	DECLARE i INT DEFAULT 0;
    DECLARE j INT DEFAULT 1;
    DECLARE num_of_bars INT DEFAULT 0;
    DECLARE bar_name varchar(45) DEFAULT "";
    DECLARE bar_phone_num INT DEFAULT 0;
    DECLARE open_hour TIME DEFAULT 0;
    DECLARE close_hour TIME DEFAULT 0;
	DECLARE weekday INT DEFAULT 1;

    SELECT COUNT(*) INTO num_of_bars FROM Bar;
    WHILE i < num_of_bars DO
    SELECT `Bar Name`, `Bar Phone #` INTO bar_name, bar_phone_num FROM Bar LIMIT i,1;
		weekday: WHILE j < 8 DO
        
			
			/*SELECT (1 + FLOOR(RAND() * 7)) INTO weekday;
            IF EXISTS(SELECT `Bar Name`, `Bar Phone #`, `Weekday` FROM `Opening/Closing Hours` WHERE (`Bar Name` = bar_name AND `Bar Phone #` = bar_phone_num) AND `Weekday` = weekday) THEN
				SET j := j + 1;
                ITERATE weekday;
            END IF;*/

			SELECT SEC_TO_TIME(FLOOR(TIME_TO_SEC('10:00:00') + RAND() * (TIME_TO_SEC(TIMEDIFF('10:00:00', '16:00:00'))))) INTO open_hour;
			SELECT SEC_TO_TIME(FLOOR(TIME_TO_SEC('20:00:00') + RAND() * (TIME_TO_SEC(TIMEDIFF('20:00:00', '23:59:00'))))) INTO close_hour;
	

			INSERT INTO `Opening/Closing Hours` VALUE(bar_name, bar_phone_num, j, open_hour, close_hour);
			SET j := j + 1;

        END WHILE;
    SET i := i + 1;
    SET j := 1;
    END WHILE;

END $$
DELIMITER ;
