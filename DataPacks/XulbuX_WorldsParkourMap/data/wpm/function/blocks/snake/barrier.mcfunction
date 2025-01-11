# BARRIER IF PLAYER HOLDING SPAWNEGG NEARBY
   # PLACE BARRIER
      execute if entity @s[tag=!block_player,tag=!barrier_placed,tag=!block_placed] at @s if entity @a[distance=..25,nbt={SelectedItem:{components:{"minecraft:custom_data":{snake_block_spawnegg:1}}}}] unless block ~ ~ ~ air run tag @s add block_player
      execute if entity @s[tag=block_player,tag=!barrier_placed,tag=!block_placed] at @s if entity @a[distance=..25,nbt={SelectedItem:{components:{"minecraft:custom_data":{snake_block_spawnegg:1}}}}] if block ~ ~ ~ air run tag @s remove block_player
      execute if entity @s[tag=!block_player,tag=!barrier_placed,tag=!block_placed] at @s if entity @a[distance=..25,nbt={SelectedItem:{components:{"minecraft:custom_data":{snake_block_spawnegg:1}}}}] if block ~ ~ ~ air run setblock ~ ~ ~ barrier
      execute if entity @s[tag=block_reset] at @s if entity @a[distance=..25,nbt={SelectedItem:{components:{"minecraft:custom_data":{snake_block_spawnegg:1}}}}] if block ~ ~ ~ air run setblock ~ ~ ~ barrier
      execute if entity @s[tag=!block_player,tag=!barrier_placed,tag=!block_placed] at @s if entity @a[distance=..25,nbt={SelectedItem:{components:{"minecraft:custom_data":{snake_block_spawnegg:1}}}}] if block ~ ~ ~ barrier run tag @s add barrier_placed
      # DELETE IF BARRIER GETS DESTROYED
         execute if entity @s[tag=barrier_placed] at @s if entity @a[distance=..25,nbt={SelectedItem:{components:{"minecraft:custom_data":{snake_block_spawnegg:1}}}}] unless block ~ ~ ~ barrier run function wpm:setups/blocks/snake/delete
   # REMOVE BARRIER
      execute if entity @s[tag=!block_player,tag=!block_placed,tag=barrier_placed] at @s unless entity @a[distance=..25,nbt={SelectedItem:{components:{"minecraft:custom_data":{snake_block_spawnegg:1}}}}] if block ~ ~ ~ barrier run setblock ~ ~ ~ air
      execute if entity @s[tag=!block_player,tag=!block_placed,tag=barrier_placed] at @s unless entity @a[distance=..25,nbt={SelectedItem:{components:{"minecraft:custom_data":{snake_block_spawnegg:1}}}}] if block ~ ~ ~ air run tag @s remove barrier_placed
execute if entity @s[tag=block_reset] run tag @s remove block_reset
