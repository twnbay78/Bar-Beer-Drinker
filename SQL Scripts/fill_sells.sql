DROP PROCEDURE fill_sells;

DELIMITER $$
CREATE PROCEDURE fill_sells()
BEGIN

	DECLARE num_of_bars INT DEFAULT 960;
    DECLARE num_of_beers INT DEFAULT 6135;
    DECLARE i INT DEFAULT 0;
    DECLARE j INT DEFAULT 0;
	DECLARE bar_name varchar(45) DEFAULT "";
	DECLARE bar_phone_num INT DEFAULT "";
	DECLARE rand_beer_num INT DEFAULT (FLOOR(RAND()*num_of_beers));
	DECLARE rand_beer_name varchar(45) DEFAULT "";
    DECLARE product_type varchar(45) DEFAULT "";
    
    WHILE i < num_of_bars DO
        SELECT `Bar Name`, `Bar Phone #` INTO bar_name, bar_phone_num FROM Bar LIMIT i,1;
        beer_loop: WHILE j < 10 DO
			SET rand_beer_num = (FLOOR(1+RAND()*num_of_beers));
            SELECT `Product Name`, `Type` INTO rand_beer_name, product_type FROM `Product` LIMIT rand_beer_num,1;
            IF EXISTS(SELECT Sells.`Product Name`, Sells.`Bar Name` FROM Sells WHERE rand_beer_name = Sells.`Product Name` AND Sells.`Bar Name` = bar_name)THEN 
				leave beer_loop;
            END IF;
            INSERT INTO Sells (`Bar Name`, `Bar Phone #`, `Product Name`, `Price`, `Type`) 
				VALUE (bar_name, bar_phone_num, rand_beer_name, rand()*15, product_type);
			SET j = j + 1;
        END WHILE;
		SET i = i + 1;
        SET j = 0;
    END WHILE;

END$$
DELIMITER ;