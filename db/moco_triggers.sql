DROP TRIGGER IF EXISTS `moco`.`add_item`;
DELIMITER //
CREATE TRIGGER `moco`.`add_item` AFTER INSERT ON `moco`.`item`
 FOR EACH ROW begin 
   UPDATE test
   SET total_items = (total_items + 1)
   WHERE test_id=NEW.test_id;
end