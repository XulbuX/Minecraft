# KILL PLAYER WITH CUSTOM DEATH MESSAGE
   execute as @a[gamemode=!spectator,gamemode=!creative] at @s run execute if block ~ ~ ~ light[level=0] run function wpm:blocks/entity-killer/kill-player
execute as @e[type=!player,type=!#wpm:not_mob] at @s run execute if block ~ ~ ~ light[level=0] run function wpm:blocks/entity-killer/kill-general
