DROP PROCEDURE fill_transaction;

DELIMITER $$

CREATE PROCEDURE fill_transaction()
BEGIN
	DECLARE random_date DATETIME DEFAULT "";
    DECLARE random_date_num INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
	DECLARE j INT DEFAULT 0;
    DECLARE k INT DEFAULT 0;
	DECLARE l INT DEFAULT 0;
    DECLARE bar_phone_num INT DEFAULT 0;
	DECLARE bar_name varchar(45) DEFAULT "";
	DECLARE bar_open_time TIME DEFAULT "";
    DECLARE bar_close_time TIME DEFAULT "";
    DECLARE random_ssn INT DEFAULT 0;
    DECLARE random_drinker_num INT DEFAULT 0;
    DECLARE drinker_name varchar(45) DEFAULT "";
	DECLARE drinker_phone_num INT DEFAULT 0;
    DECLARE rand_product_name varchar(45) DEFAULT "";
    DECLARE rand_product_num INT DEFAULT 0;
    DECLARE rand_num_of_products INT DEFAULT 0;
	DECLARE rand_drinker_num INT DEFAULT 0;
    DECLARE rand_num_of_drinkers INT DEFAULT 0;
    DECLARE num_of_bars INT DEFAULT 0;
    DECLARE num_of_products INT DEFAULT 0;
    DECLARE num_of_employees INT DEFAULT 0;
    DECLARE num_of_drinkers INT DEFAULT 0;
    DECLARE rand_employee_num INT DEFAULT 0;
    DECLARE tip_amount DOUBLE DEFAULT 0;
	DECLARE tax_Amount DOUBLE DEFAULT 0;
    DECLARE subtotal DOUBLE DEFAULT 0;
    DECLARE total DOUBLE DEFAULT 0;
    DECLARE tip DOUBLE DEFAULT 0;
    DECLARE more_random INT DEFAULT 0;
    DECLARE even_more_random INT DEFAULT 0;
	DECLARE product_type varchar(45) DEFAULT "";

    
    SELECT COUNT(*) INTO num_of_bars FROM Bar;
    SELECT COUNT(*) INTO num_of_employees FROM Employee;
    SELECT COUNT(*) INTO num_of_products FROM Product;
    SELECT COUNT(*) INTO num_of_drinkers FROM Drinker;
    
    /* loop through every bar */
    WHILE i < num_of_bars DO
		/* store each bar name and phone number */
		SELECT `Bar Name`, `Bar Phone #` INTO bar_name, bar_phone_num FROM Bar LIMIT i,1;
        
        /* begin assignming random number of drinkers */
        SET rand_num_of_drinkers := FLOOR(RAND() * 80);
        WHILE j < rand_num_of_drinkers DO
			/* Change day of the week */
            SET random_date_num := FLOOR(RAND() * random_date_num);
			SELECT `Open Hour`, `Close Hour` INTO bar_open_time, bar_close_time FROM `Opening/Closing Hours` WHERE `Opening/Closing Hours`.`Bar Name` = bar_name AND `Opening/Closing Hours`.`Bar Phone #` = bar_phone_num LIMIT random_date_num,1;
			SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(bar_open_time) + FLOOR(RAND() * UNIX_TIMESTAMP(TIMESTAMPDIFF(SECOND, bar_open_time, bar_close_time)))) INTO random_date;
            SET random_date := CONCAT('2016:01:01 ', time(random_date));
            SELECT random_date;
			/* random drinker */
            SET random_drinker_num := FLOOR(RAND() * num_of_drinkers);
            SELECT `Drinker Name`, `Drinker Phone #` INTO drinker_name, drinker_phone_num FROM Drinker LIMIT random_drinker_num,1;
            
			/* random employer */
			SET rand_employee_num := FLOOR(RAND() * num_of_employees);
			SELECT `Employee SSN` INTO random_ssn FROM Employee LIMIT rand_employee_num,1;
            
			SET rand_num_of_products := FLOOR(RAND() * 10);
			/* find a random products */
			WHILE k < rand_num_of_products DO
				SET rand_product_num := FLOOR(RAND() * num_of_products);
				SELECT `Product Name`, `Type` INTO rand_product_name, product_type FROM Product LIMIT rand_product_num,1;
                /* increment time between transactions */
                SET random_date := DATE_ADD(random_date, INTERVAL 120 SECOND);
                SELECT `Open Hour`, `Close Hour` FROM `Opening/Closing Hours` WHERE `Opening/Closing Hours`.`Bar Name` = bar_name AND `Opening/Closing Hours`.`Bar Phone #` = bar_phone_num LIMIT random_date_num,1;
                SELECT bar_open_time, bar_close_time, random_date;
                /* generate random tip, subtotal */
                SET tip := RAND()*4;
                SET subtotal := 5 + RAND()*40;
				SELECT bar_name, random_ssn, drinker_name, bar_phone_num, drinker_phone_num, rand_product_name, random_date;
				INSERT INTO `Transaction` (`Tip`, `Tax Amount`, `Subtotal`, `Total`, `Date`, `Name`, `Phone #`)
					VALUES(tip, .07*subtotal, subtotal, (tip + (.07*subtotal) + subtotal), random_date, drinker_name, drinker_phone_num);
                INSERT INTO `Initiates` VALUES(bar_name, random_ssn, drinker_name, bar_phone_num, drinker_phone_num, rand_product_name, random_date, product_type);
                /* now create more transactions with random dates */
                SET more_random := RAND()*3;
                WHILE l < more_random DO
					SET rand_product_num := FLOOR(RAND() * num_of_products);
					SELECT `Product Name` INTO rand_product_name FROM Product LIMIT rand_product_num,1;
					/* increment time between transactions */
					SET even_more_random := FLOOR(RAND() * 150);
					SET random_date := DATE_ADD(random_date, INTERVAL 10 DAY);
					SELECT `Open Hour`, `Close Hour` FROM `Opening/Closing Hours` WHERE `Opening/Closing Hours`.`Bar Name` = bar_name AND `Opening/Closing Hours`.`Bar Phone #` = bar_phone_num LIMIT random_date_num,1;
					SELECT bar_open_time, bar_close_time, random_date;
					/* generate random tip, subtotal */
					SET tip := RAND()*4;
					SET subtotal := 5 + RAND()*40;
					SELECT bar_name, random_ssn, drinker_name, bar_phone_num, drinker_phone_num, rand_product_name, random_date;
					INSERT INTO `Transaction` (`Tip`, `Tax Amount`, `Subtotal`, `Total`, `Date`, `Name`, `Phone #`)
						VALUES(tip, .07*subtotal, subtotal, (tip + (.07*subtotal) + subtotal), random_date, drinker_name, drinker_phone_num);
					INSERT INTO `Initiates` VALUES(bar_name, random_ssn, drinker_name, bar_phone_num, drinker_phone_num, rand_product_name, random_date, product_type);
					SET l := l + 1;
                END WHILE;
                SET k := k + 1;
                SET l := 0;
			END WHILE;
            SET j := j + 1;
            SET k := 0;
		END WHILE;
        SET i := i + 1;
        SET j := 0;
    END WHILE;
END $$
DELIMITER ;