INSERT INTO `test` (`test_id`, `ic_id`, `test_type`, `due_date`, `test_date`, `total_items`, `total_points`, `title`, `duration`) VALUES
(1, 12, b'0', '2014-06-07', '2014-06-28', 10, 0, 'Quiz 1 - Introduction', 46),
(3, 12, b'1', '0000-10-10', '0000-10-10', 0, 0, 'sample', 0),
(4, 12, b'0', '2014-02-22', '2014-02-23', 3, 0, 'Quiz 2 - Syntax', 13),
(5, 12, b'0', '2014-02-20', '2014-02-20', 0, 0, 'Quiz 3', 0),
(6, 12, b'0', '2014-02-20', '2014-02-24', 0, 0, 'Quiz 4', 120),
(7, 12, b'0', '2014-02-20', '2014-02-24', 0, 0, 'Quiz 5', 127);


INSERT INTO `item` (`item_id`, `test_id`, `item_type`, `question`) VALUES
(25, 1, 1, 'It contains of all the users filesand only the user can view it'),
(26, 1, 1, 'Which is not a microcomputer ?'),
(27, 1, 1, 'It allows you to manage which windows are on your screen?'),
(52, 1, 2, 'gjkdhkdhfghk'),
(54, 1, 2, 'The library must be "included" in a program to make the predefined functions available'),
(55, 1, 2, 'A function is a small program'),
(56, 4, 2, 'Arguments from call by reference parameters can contain variables and numbers'),
(58, 4, 2, 'Global variables are those variables declared in the main function'),
(59, 1, 2, 'sample'),
(60, 1, 2, 'Indexed variables can be arguments to functions?'),
(61, 1, 2, 'The function can process arraysof different sizes?'),
(62, 1, 2, 'another sample'),
(63, 4, 1, 'Which of the following statements is true about the basic Diffie-Hellman key-exchange protocol.');




INSERT INTO `mpchoice` (`choice_id`, `item_id`, `choice_val`, `iscorrect`, `points`, `c_no`) VALUES
(81, 25, 'My Files folder', 0, 0, 1),
(82, 25, 'Documents', 0, 0, 2),
(83, 25, 'Home Folder', 1, 3, 3),
(84, 25, 'Users Folder', 0, 0, 4),
(85, 26, 'Laptop', 0, 0, 1),
(86, 26, 'PDA', 0, 0, 2),
(87, 26, 'terminal', 1, 3, 3),
(88, 26, 'notebook', 0, 0, 4),
(89, 27, 'Application window', 0, 0, 1),
(90, 27, 'Dialog windows', 0, 0, 2),
(91, 27, 'Workspace', 0, 0, 3),
(92, 27, 'Desktop', 1, 1, 4),
(93, 63, 'The protocol is based on the concept of a trapdoor function.', 1, 4, 1),
(94, 63, 'The basic protocol enables key exchange secure against eavesdropping, but is insecure against active', 0, 0, 2),
(95, 63, 'The protocol can be converted to a public-key encryption system called the ElGamal public-key system', 0, 0, 3),
(96, 63, 'The basic protocol provides key exchange secure against active adversaries that can inject and modif', 0, 0, 4);



INSERT INTO `t_f` (`tf_id`, `item_id`, `ans`, `points`) VALUES
(11, 52, b'0', 1),
(12, 54, b'1', 4),
(14, 55, b'1', 4),
(15, 56, b'1', 2),
(16, 58, b'1', 2),
(17, 59, b'1', 3),
(18, 60, b'1', 3),
(19, 61, b'1', 2),
(20, 62, b'1', 1);


DROP TRIGGER IF EXISTS `add_item`;
DELIMITER //
CREATE TRIGGER `add_item` AFTER INSERT ON `item`
 FOR EACH ROW begin 







   UPDATE test







   SET total_items = (total_items + 1)







   WHERE test_id=NEW.test_id;







end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `del_item`;
DELIMITER //
CREATE TRIGGER `del_item` AFTER DELETE ON `item`
 FOR EACH ROW begin

   UPDATE test



   SET total_items = (total_items - 1)

   WHERE test_id=OLD.test_id;

end
//
DELIMITER ;
