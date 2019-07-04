CREATE DEFINER=`ls949`@`%` TRIGGER `drinker_frequents_bar_from_different_state` BEFORE INSERT ON `Frequents` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT b1.`State`, p1.`State` FROM Bar b1
					INNER JOIN Person p1 ON p1.`Name` = NEW.`Drinker name` AND p1.`Phone #` = NEW.`Drinker Phone #`
                  WHERE b1.`State` = p1.`State`) THEN
    SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "A drinker cannot frequent a bar from a different state";
	END IF;
END