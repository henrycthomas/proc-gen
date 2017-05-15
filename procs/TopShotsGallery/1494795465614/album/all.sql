DELIMITER $$
DROP PROCEDURE IF EXISTS `album_create`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `album_create`(
out _id int(11),
in _title varchar(255),
in _event_id int(11),
in _tree_left int(11),
in _tree_right int(11),
in _tree_level int(11)
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
_title,
_event_id,
_tree_left,
_tree_right,
_tree_level
);

SET @_id = last_insert_id();

END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `album_update`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `album_update`(
in _id int(11),
in _title varchar(255),
in _event_id int(11),
in _tree_left int(11),
in _tree_right int(11),
in _tree_level int(11)
)
BEGIN
UPDATE
album
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

DELIMITER $$
DROP PROCEDURE IF EXISTS `album_delete`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `album_delete`(
in _id int(11)
)
BEGIN
DELETE FROM
album
WHERE
id = _id;
END$$
DELIMITER ;

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
