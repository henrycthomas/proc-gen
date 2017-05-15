DELIMITER $$
DROP PROCEDURE IF EXISTS `album2_update`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `album2_update`(
in _id int(11),
in _title varchar(255),
in _event_id int(11),
in _tree_left int(11),
in _tree_right int(11),
in _tree_level int(11)
)
BEGIN
UPDATE
album2
SET 
title = _title,
event_id = _event_id,
tree_left = _tree_left,
tree_right = _tree_right,
tree_level = _tree_level
WHERE
id = _id;
END$$
DELIMITER ;
