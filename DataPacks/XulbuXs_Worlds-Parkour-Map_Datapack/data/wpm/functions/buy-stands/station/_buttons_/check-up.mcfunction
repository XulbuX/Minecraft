execute if entity @p[distance=..2.5] run function wpm:buy-stands/station/_buttons_/button-up
execute unless entity @p[distance=..2.5] run execute if data entity @s interaction run data remove entity @s interaction
