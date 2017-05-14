DELIMITER $${~n}
DROP PROCEDURE IF EXISTS `{tableName}_update`;
CREATE DEFINER=`{user}`@`{host}` PROCEDURE `{tableName}_update`({~n}
	{#fields}
        {#all}
            in _{Field} {Type}{@sep},{/sep}{~n}
        {/all}
    {/fields}
){~n}
BEGIN{~n}
    UPDATE{~n}
        {tableName}{~n}
SET {~n}
        {#fields}
            {#regular}
                {Field} = _{Field}{@sep},{/sep}{~n}
            {/regular}
        {/fields}
WHERE{~n}
    {#fields}
        {#id}
            {Field} = _{Field}{@sep}and {~n}{/sep}
        {/id}
    {/fields}
    ;{~n}
END$${~n}
DELIMITER ;