DELIMITER $$
DROP PROCEDURE IF EXISTS `contact_delete`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `contact_delete`(
in _id int(11)
)
BEGIN
DELETE FROM
contact
WHERE
id = _id;
END$$
DELIMITER ;
