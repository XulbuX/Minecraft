execute unless entity @s[scores={wpm_frozen_timer=1..}] run scoreboard players add @s Frozen_timer 200
execute at @s run particle item{item:{id:blue_ice}} ~ ~.5 ~ 0 0 0 .15 25 force @a
execute at @s run particle snowflake ~ ~ ~ 0 0 0 .15 50 force @a
tag @s remove frozen
