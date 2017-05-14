DELIMITER $$
DROP PROCEDURE IF EXISTS `album2_create`;CREATE DEFINER=`root`@`localhost` PROCEDURE `album2_create`(
out _id int(11),
in _title varchar(255),
in _event_id int(11),
in _tree_left int(11),
in _tree_right int(11),
in _tree_level int(11)
)
BEGIN
INSERT INTO
album2
(
title,
event_id,
tree_left,
tree_right,
tree_level
)
VALUES
(
_title,
_event_id,
_tree_left,
_tree_right,
_tree_level
);

SET @_id = last_insert_id();

END$$
DELIMITER ;