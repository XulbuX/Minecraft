execute as @e[type=snowball,nbt={Item:{tag:{pig:1b}}}] as @p at @s anchored eyes run function wpm:items/throwable/pig/throw
execute as @e[type=pig,tag=player,tag=!motion] at @s rotated as @p run function wpm:items/throwable/pig/motion
