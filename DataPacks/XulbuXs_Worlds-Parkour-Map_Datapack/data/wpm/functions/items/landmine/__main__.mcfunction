# LANDMINE  -  SETUP
   # ONLY PLACE ON FLOOR (FULL-BLOCKS, TOP-SLABS & TOP-HALT-STAIRS)!
      execute as @e[type=interaction,tag=Landmine] run function wpm:gen_funcs/check_blocks/-1/__main__
      # MOVE DOWN
         execute as @e[type=interaction,tag=Landmine,scores={Check_Blocks=-1}] run function wpm:items/landmine/position
      # IF INCORRECT: BREAK
         execute as @e[type=interaction,tag=Landmine,scores={Check_Blocks=-2}] run function wpm:items/landmine/break
   # PLACE VISIBLE LANDMINE & INTERACTION
      execute as @e[type=interaction,tag=Landmine] at @s if entity @s[scores={Check_Blocks=0}] unless block ~ ~ ~ player_head[rotation=0] if block ~ ~ ~ air run function wpm:items/landmine/place
      execute as @e[type=interaction,tag=Landmine] at @s if entity @s[scores={Check_Blocks=0}] unless block ~ ~ ~ player_head[rotation=0] unless block ~ ~ ~ air run function wpm:items/landmine/break
   # START LANDMINE FUNCTIONALITY
      execute as @e[nbt={Tags:["Landmine"]}] at @s if block ~ ~ ~ player_head[rotation=0] if entity @s[scores={Check_Blocks=0}] run scoreboard players set @s Check_Blocks 1
   # REMOVE LANDMINE & INTERACTION
      execute as @e[scores={Check_Blocks=1},nbt={Tags:["Landmine"]}] at @s unless entity @s[scores={Check_Blocks=-1}] unless block ~ ~ ~ player_head[rotation=0] run kill @s
# CHECK FOR IGNITION
   execute as @e[type=interaction,tag=Landmine,scores={Check_Blocks=1}] run function wpm:items/landmine/ignite
# EXPLODE LANDMINE
   execute as @e[type=interaction,tag=Landmine,tag=Explode] run function wpm:items/landmine/explode
