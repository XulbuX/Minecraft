# POSITIONING
   execute unless entity @s[tag=positioned] at @s align xyz run tp @s ~.5 ~.5 ~.5
# GET IDs
   execute unless entity @s[scores={wpm_snake_block_id=0..}] run scoreboard players set @s wpm_snake_block_id 0
   execute if entity @s[tag=!id_defined] run function wpm:setups/blocks/snake/get_id-block
execute if entity @s[tag=new] run tag @s remove new
