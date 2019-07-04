CREATE DEFINER=`ls949`@`%` TRIGGER `isBarOpen` BEFORE INSERT ON `Transaction` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT h1.Weekday, h1.`Open Hour`, h1.`Close Hour` FROM `Opening/Closing Hours` h1 
		WHERE DAYOFWEEK(NEW.Date) = Weekday AND  
        (h1.`Open Hour` < CAST(NEW.`Date` AS time) AND h1.`Close Hour` > CAST(NEW.`Date` AS time))) THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "You cannot add a transaction when a bar is not open!";
	END IF;
END