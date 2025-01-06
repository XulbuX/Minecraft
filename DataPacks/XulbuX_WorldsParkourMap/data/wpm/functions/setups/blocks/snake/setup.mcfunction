# POSITIONING
   execute unless entity @s[tag=Positioned] at @s align xyz run tp @s ~.5 ~.5 ~.5
# GET IDs
   execute unless entity @s[scores={SnakeBlock_ID=0..}] run scoreboard players set @s SnakeBlock_ID 0
   execute if entity @s[tag=!ID_defined] run function wpm:setups/blocks/snake/get_id-block
execute if entity @s[tag=NEW] run tag @s remove NEW
