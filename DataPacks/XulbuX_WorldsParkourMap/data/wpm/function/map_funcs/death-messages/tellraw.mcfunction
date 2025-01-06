execute if entity @s[scores={DeathMessage_ID=0}] run tellraw @a [{"selector":"@s","bold":true},{"text":" died for some unknown reason","color":"white"}]
execute if entity @s[scores={DeathMessage_ID=1}] run tellraw @a [{"selector":"@s","bold":true},{"text":" vaperized into thin air","color":"white"}]
execute if entity @s[scores={DeathMessage_ID=2}] run tellraw @a [{"selector":"@s","bold":true},{"text":" had to reset himself","color":"white"}]
execute if entity @s[scores={DeathMessage_ID=3}] run tellraw @a [{"selector":"@s","bold":true},{"text":" got obliterated by his follower","color":"white"}]
execute if entity @s[scores={DeathMessage_ID=4}] run tellraw @a [{"selector":"@s","bold":true},{"text":" stepped on an explosive","color":"white"}]
execute if entity @s[scores={DeathMessage_ID=5}] run tellraw @a [{"selector":"@s","bold":true},{"text":" was shot in the head by a sniper","color":"white"}]
execute if entity @s[scores={DeathMessage_ID=6}] run tellraw @a [{"selector":"@s","bold":true},{"text":" was shot in the chest by a sniper","color":"white"}]
execute if entity @s[scores={DeathMessage_ID=7}] run tellraw @a [{"selector":"@s","bold":true},{"text":" was shot in his knee by a sniper","color":"white"}]
execute if entity @s[scores={DeathMessage_ID=8}] run tellraw @a [{"selector":"@s","bold":true},{"text":" got blasted into orbit from a ...","color":"white"}]
execute if entity @s[scores={DeathMessage_ID=9}] run tellraw @a [{"selector":"@s","bold":true},{"text":" didn't know how to use an elevator.","color":"white"}]

scoreboard players reset @s DeathMessage_ID
