DELIMITER $${~n}
DROP PROCEDURE IF EXISTS `{tableName}_create`;{~n}
CREATE DEFINER=`{user}`@`{host}` PROCEDURE `{tableName}_create`({~n}
	{#fields}
        {#all}
            {#isAutoIncrement}
                out _{Field} {Type}{@sep},{/sep}{~n}
            {:else}
                in _{Field} {Type}{@sep},{/sep}{~n}
            {/isAutoIncrement}
        {/all}
    {/fields}
){~n}
BEGIN{~n}
    INSERT INTO{~n}
        {tableName}{~n}
    ({~n}
        {#fields}
            {#all}
                {#isAutoIncrement}
                {:else}
                    {Field}{@sep},{/sep}{~n}
                {/isAutoIncrement}
            {/all}
        {/fields}
    ){~n}
    VALUES{~n}
    ({~n}
        {#fields}
            {#all}
                {#isAutoIncrement}
                {:else}
                    _{Field}{@sep},{/sep}{~n}
                {/isAutoIncrement}
            {/all}
        {/fields}
    );{~n}
{~n}
    {#fields}
        {#id}
            {#isAutoIncrement}
                SET @_{Field} = last_insert_id();{~n}
            {/isAutoIncrement}
        {/id}
    {/fields}
    {~n}
END$${~n}
DELIMITER ;{~n}