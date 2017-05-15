DELIMITER $${~n}
DROP PROCEDURE IF EXISTS `{tableName}_delete`;{~n}
CREATE DEFINER=`{user}`@`{host}` PROCEDURE `{tableName}_delete`({~n}
	{#fields}
        {#id}
            in _{Field} {Type}{@sep},{/sep}{~n}
        {/id}
    {/fields}
){~n}
BEGIN{~n}
    DELETE FROM{~n}
        {tableName}{~n}
WHERE{~n}
    {#fields}
        {#id}
            {Field} = _{Field}{@sep}and {~n}{/sep}
        {/id}
    {/fields}
    ;{~n}
END$${~n}
DELIMITER ;{~n}