DELIMITER $$
DROP PROCEDURE IF EXISTS `contact_update`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `contact_update`(
in _id int(11),
in _first_name varchar(64),
in _last_name varchar(64),
in _phone varchar(20),
in _email varchar(250),
in _address_name varchar(250),
in _address_organisation varchar(250),
in _address_line1 varchar(250),
in _address_line2 varchar(250),
in _address_town varchar(250),
in _address_county varchar(250),
in _address_postcode varchar(20),
in _address_country_code varchar(2),
in _completed tinyint(1)
)
BEGIN
UPDATE
contact
SET 
first_name = _first_name,
last_name = _last_name,
phone = _phone,
email = _email,
address_name = _address_name,
address_organisation = _address_organisation,
address_line1 = _address_line1,
address_line2 = _address_line2,
address_town = _address_town,
address_county = _address_county,
address_postcode = _address_postcode,
address_country_code = _address_country_code,
completed = _completed
WHERE
id = _id;
END$$
DELIMITER ;
