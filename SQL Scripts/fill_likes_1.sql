

DELIMITER $$
CREATE PROCEDURE fill_likes_alcohol()
BEGIN

	DECLARE num_of_drinkers INT DEFAULT 0;
    DECLARE num_of_products INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
    DECLARE j INT DEFAULT 0;
	DECLARE product_name varchar(45) DEFAULT "";
	DECLARE rand_product_num INT DEFAULT 0;
	DECLARE drinker_name varchar(45) DEFAULT "";
    DECLARE drinker_phone_num varchar(45) DEFAULT "";
    DECLARE product_type varchar(45) DEFAULT "";
    
    SELECT COUNT(*) INTO num_of_drinkers FROM `Drinker`;
	SELECT COUNT(*) INTO num_of_products FROM `Alcohol`;
    
    WHILE i < num_of_drinkers DO
        SELECT `Drinker Name`, `Drinker Phone #` INTO drinker_name, drinker_phone_num FROM Drinker LIMIT i,1;
        alcohol_loop: WHILE j < 5 DO
			SET rand_product_num := (FLOOR(RAND()*num_of_products));
            SELECT `Alcohol name`, `Type` INTO product_name, product_type FROM `Alcohol` LIMIT rand_product_num,1;
            IF EXISTS(SELECT `Product Name`, `Drinker Name`, `Drinker Phone #`, `Product Type` FROM Likes WHERE drinker_name = `Drinker Name` AND drinker_phone_num = `Drinker Phone #` AND product_name = `Product Name` AND `Type` = product_type)THEN 
				leave alcohol_loop;
            END IF;
            INSERT INTO Likes (`Product Name`, `Drinker Name`, `Drinker Phone #`, `Type`) 
				VALUE (product_name, drinker_name, drinker_phone_num, product_type);
			SET j := j + 1;
        END WHILE;
		SET i := i + 1;
        SET j := 0;
    END WHILE;

END$$
DELIMITER ;