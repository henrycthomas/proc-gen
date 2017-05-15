DELIMITER $$
DROP PROCEDURE IF EXISTS `contact_read`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `contact_read`(
in _id int(11)
)
BEGIN
SELECT
id,
first_name,
last_name,
phone,
email,
address_name,
address_organisation,
address_line1,
address_line2,
address_town,
address_county,
address_postcode,
address_country_code,
completed
FROM
contact
WHERE
id = _id;
END$$
DELIMITER ;
