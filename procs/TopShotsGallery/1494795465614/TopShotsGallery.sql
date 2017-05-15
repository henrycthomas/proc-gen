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

DELIMITER $$
DROP PROCEDURE IF EXISTS `album2_create`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `album2_create`(
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

DELIMITER $$
DROP PROCEDURE IF EXISTS `album2_update`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `album2_update`(
in _id int(11),
in _title varchar(255),
in _event_id int(11),
in _tree_left int(11),
in _tree_right int(11),
in _tree_level int(11)
)
BEGIN
UPDATE
album2
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

DELIMITER $$
DROP PROCEDURE IF EXISTS `album2_read`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `album2_read`(
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
album2
WHERE
id = _id;
END$$
DELIMITER ;

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
