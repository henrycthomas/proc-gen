DELIMITER $$
DROP PROCEDURE IF EXISTS `album_read`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `album_read`(
in _id int(11)
)
BEGIN
SELECT
id,
title,
event_id,
tree_left,
tree_right,
tree_level
FROM
album
WHERE
id = _id;
END$$
DELIMITER ;
