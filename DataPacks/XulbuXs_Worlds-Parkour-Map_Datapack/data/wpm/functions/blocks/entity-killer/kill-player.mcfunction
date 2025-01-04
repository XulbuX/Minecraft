execute at @s run particle cloud ~ ~ ~ .6 .6 .6 .04 200 force @a
scoreboard players set @s DeathMessage_ID 1
gamerule showDeathMessages false
kill @s
