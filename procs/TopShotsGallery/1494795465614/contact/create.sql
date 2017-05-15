DELIMITER $$
DROP PROCEDURE IF EXISTS `contact_create`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `contact_create`(
out _id int(11),
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
INSERT INTO
contact
(
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
)
VALUES
(
_first_name,
_last_name,
_phone,
_email,
_address_name,
_address_organisation,
_address_line1,
_address_line2,
_address_town,
_address_county,
_address_postcode,
_address_country_code,
_completed
);

SET @_id = last_insert_id();

END$$
DELIMITER ;
