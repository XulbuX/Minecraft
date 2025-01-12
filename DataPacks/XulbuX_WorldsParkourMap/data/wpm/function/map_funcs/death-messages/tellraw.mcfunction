execute if entity @s[scores={death_message_id=0}] run tellraw @a [{"selector":"@s","bold":true},{"text":" died for some unknown reason","italic":false,"bold":false,"color":"white"}]
execute if entity @s[scores={death_message_id=1}] run tellraw @a [{"selector":"@s","bold":true},{"text":" vaperized into thin air","italic":false,"bold":false,"color":"white"}]
execute if entity @s[scores={death_message_id=2}] run tellraw @a [{"selector":"@s","bold":true},{"text":" had to reset himself","italic":false,"bold":false,"color":"white"}]
execute if entity @s[scores={death_message_id=3}] run tellraw @a [{"selector":"@s","bold":true},{"text":" got obliterated by his follower","italic":false,"bold":false,"color":"white"}]
execute if entity @s[scores={death_message_id=4}] run tellraw @a [{"selector":"@s","bold":true},{"text":" stepped on an explosive","italic":false,"bold":false,"color":"white"}]
execute if entity @s[scores={death_message_id=5}] run tellraw @a [{"selector":"@s","bold":true},{"text":" was shot in the head by a sniper","italic":false,"bold":false,"color":"white"}]
execute if entity @s[scores={death_message_id=6}] run tellraw @a [{"selector":"@s","bold":true},{"text":" was shot in the chest by a sniper","italic":false,"bold":false,"color":"white"}]
execute if entity @s[scores={death_message_id=7}] run tellraw @a [{"selector":"@s","bold":true},{"text":" was shot in his knee by a sniper","italic":false,"bold":false,"color":"white"}]
execute if entity @s[scores={death_message_id=8}] run tellraw @a [{"selector":"@s","bold":true},{"text":" got blasted into orbit from a ...","italic":false,"bold":false,"color":"white"}]
execute if entity @s[scores={death_message_id=9}] run tellraw @a [{"selector":"@s","bold":true},{"text":" didn't know how to use an elevator.","italic":false,"bold":false,"color":"white"}]

scoreboard players reset @s death_message_id
