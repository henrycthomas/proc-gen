DELIMITER $$
DROP PROCEDURE IF EXISTS `album_create`;CREATE DEFINER=`root`@`localhost` PROCEDURE `album_create`(
out id int(11),
in title varchar(255),
in event_id int(11),
in tree_left int(11),
in tree_right int(11),
in tree_level int(11)
)
BEGIN
INSERT INTO
album
(
title,
event_id,
tree_left,
tree_right,
tree_level
)
VALUES
(
title,
event_id,
tree_left,
tree_right,
tree_level
);

SET @id = last_insert_id();

END$$
DELIMITER ;