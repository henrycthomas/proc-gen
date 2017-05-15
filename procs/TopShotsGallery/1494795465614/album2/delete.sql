DELIMITER $$
DROP PROCEDURE IF EXISTS `album2_delete`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `album2_delete`(
in _id int(11)
)
BEGIN
DELETE FROM
album2
WHERE
id = _id;
END$$
DELIMITER ;
