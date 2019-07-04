CREATE DEFINER=`ls949`@`%` TRIGGER `dropFrequentsAfterStateChange` AFTER UPDATE ON `Person` FOR EACH ROW BEGIN
	IF(OLD.`Name` = NEW.`Name` AND OLD.`Phone #` = NEW.`Phone #` AND OLD.`State` <> NEW.`State`) THEN
		DELETE FROM Frequents WHERE `Drinker name` = NEW.`Name` AND `Drinker Phone #` = NEW.`Phone #`;
    END IF;
END