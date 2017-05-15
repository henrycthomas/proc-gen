DELIMITER $${~n}
DROP PROCEDURE IF EXISTS `{tableName}_read`;{~n}
CREATE DEFINER=`{user}`@`{host}` PROCEDURE `{tableName}_read`({~n}
	{#fields}
        {#id}
            in _{Field} {Type}{@sep},{/sep}{~n}
        {/id}
    {/fields}
){~n}
BEGIN{~n}
    SELECT{~n}
    {#fields}
        {#all}
        {Field}{@sep},{/sep}{~n}
        {/all}
    {/fields}
    FROM{~n}
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