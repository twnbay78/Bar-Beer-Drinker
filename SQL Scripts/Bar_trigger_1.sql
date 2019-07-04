CREATE DEFINER=`ls949`@`%` TRIGGER `Insert_into_drinker_without_person_existent` BEFORE INSERT ON `Drinker` FOR EACH ROW BEGIN
    IF NOT EXISTS(SELECT `Name` FROM Person 
                  WHERE `Name` = NEW.`Drinker name`) THEN
      INSERT INTO Person (`Name`, `Phone #`) 
      VALUES(NEW.`Drinker Name`, NEW.`Drinker Phone #`);
    END IF;
END