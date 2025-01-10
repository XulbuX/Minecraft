# LANDMINE  -  SETUP
   # ONLY PLACE ON FLOOR (FULL-BLOCKS, TOP-SLABS & TOP-HALT-STAIRS)!
      execute as @e[type=interaction,tag=landmine] run function wpm:gen_funcs/check_blocks/-1/__main__
      # MOVE DOWN
         execute as @e[type=interaction,tag=landmine,scores={check_blocks=-1}] run function wpm:items/landmine/position
      # IF INCORRECT: BREAK
         execute as @e[type=interaction,tag=landmine,scores={check_blocks=-2}] run function wpm:items/landmine/break
   # PLACE VISIBLE LANDMINE & INTERACTION
      execute as @e[type=interaction,tag=landmine] at @s if entity @s[scores={check_blocks=0}] unless block ~ ~ ~ player_head[rotation=0] if block ~ ~ ~ air run function wpm:items/landmine/place
      execute as @e[type=interaction,tag=landmine] at @s if entity @s[scores={check_blocks=0}] unless block ~ ~ ~ player_head[rotation=0] unless block ~ ~ ~ air run function wpm:items/landmine/break
   # START LANDMINE FUNCTIONALITY
      execute as @e[nbt={Tags:["landmine"]}] at @s if block ~ ~ ~ player_head[rotation=0] if entity @s[scores={check_blocks=0}] run scoreboard players set @s check_blocks 1
   # REMOVE LANDMINE & INTERACTION
      execute as @e[scores={check_blocks=1},nbt={Tags:["landmine"]}] at @s unless entity @s[scores={check_blocks=-1}] unless block ~ ~ ~ player_head[rotation=0] run kill @s
# CHECK FOR IGNITION
   execute as @e[type=interaction,tag=landmine,scores={check_blocks=1}] run function wpm:items/landmine/ignite
# EXPLODE LANDMINE
   execute as @e[type=interaction,tag=landmine,tag=explode] run function wpm:items/landmine/explode
