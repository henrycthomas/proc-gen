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
