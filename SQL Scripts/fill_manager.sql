DELIMITER $$
CREATE PROCEDURE fill_manager() 
BEGIN

	DECLARE num_of_bars INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
    DECLARE drinker_phone_num INT DEFAULT 0;
    DECLARE drinker_name varchar(45) DEFAULT "";
    DECLARE ssn INT DEFAULT 0;
    DECLARE salary DOUBLE DEFAULT 0;
    
    SELECT COUNT(*) INTO num_of_bars FROM Bar;
    SET i = num_of_bars;
    
    drinker: WHILE i < 2*num_of_bars DO
    SET ssn = 100000000 + (FLOOR(RAND() * 999999999));
			SET salary = 60000 + (RAND() * 100000);
			SELECT `Drinker Name`, `Drinker Phone #` INTO drinker_name, drinker_phone_num FROM Drinker LIMIT i,1;
			INSERT INTO `Employee` (`Employee SSN`, `Salary`, `Name`, `Position`, `Phone #`)
				VALUE (ssn, salary, drinker_name, "Manager", drinker_phone_num);
        
			SET i = i + 1;
	END WHILE;
    
    SELECT COUNT(*) INTO num_of_bars FROM Bar;

END $$
DELIMITER ;