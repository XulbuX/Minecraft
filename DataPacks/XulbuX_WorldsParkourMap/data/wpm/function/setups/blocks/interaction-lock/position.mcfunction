execute at @s align xyz run tp @s ~.5 ~-.005 ~.5
execute at @s if block ~ ~.005 ~ #wpm:lockable_block run tag @s add Positioned
execute at @s positioned ~ ~.5 ~ if entity @e[type=#wpm:lockable_entity,distance=...5] run tag @s add Positioned

# PLACE-PARTICLES
   execute if entity @s[tag=Play_Particles] run function wpm:setups/blocks/interaction-lock/placing-particles

# DEFINED FUNCTIONAL BLOCKS
   # SPECIAL FOR DOORS 1
      execute if entity @s[tag=!Positioned] run execute at @s if block ~ ~-.995 ~ #doors[half=upper] run tag @s add Positioned_Door
   execute if entity @s[tag=!Positioned] run execute at @s if block ~ ~-.995 ~ #wpm:lockable_block run tp @s ~ ~-1 ~
   execute at @s if block ~ ~.005 ~ #wpm:lockable_block run tag @s add Positioned

# BLOCK ENTITIES
   execute if entity @s[tag=!Positioned] run execute at @s run execute positioned ~ ~-.5 ~ if entity @e[type=#wpm:lockable_entity,distance=...5] run tp @s ~ ~-.5 ~
   execute at @s positioned ~ ~.5 ~ if entity @e[type=#wpm:lockable_entity,distance=...5] run tag @s add Positioned

# SPECIAL CASES
   # SPECIAL FOR DOORS 2
      execute if entity @s[tag=!Positioned_Door] run execute at @s if block ~ ~-.995 ~ #doors[half=lower] run tp @s ~ ~-1 ~
      execute at @s if block ~ ~.005 ~ #doors[half=lower] run tag @s add Positioned_Door
   # SPECIAL FOR hanging_signs
      execute if entity @s[tag=!Positioned_Hanging_Sign] run execute at @s if block ~ ~-.995 ~ #wall_hanging_signs run tp @s ~ ~-1 ~
      execute at @s if block ~ ~.005 ~ #wall_hanging_signs run tag @s add Positioned_Hanging_Sign

tag @s add Positioned

execute at @s run tellraw @a[distance=..6] ["",{"text":"Interaction ","color":"#FF4853","bold":true},{"text":"Lock","color":"#E5182E","bold":true},{"text":" has been placed.","color":"green"}]

execute if entity @s[tag=NEW] run tag @s remove NEW
