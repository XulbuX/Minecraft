# BARRIER IF PLAYER HOLDING SPAWNEGG NEARBY
   # PLACE BARRIER
      execute if entity @s[tag=!Block_player,tag=!Barrier_placed,tag=!Block_placed] at @s if entity @a[distance=..25,nbt={SelectedItem:{tag:{Tags:["SnakeBlock_Spawnegg"]}}}] unless block ~ ~ ~ air run tag @s add Block_player
      execute if entity @s[tag=Block_player,tag=!Barrier_placed,tag=!Block_placed] at @s if entity @a[distance=..25,nbt={SelectedItem:{tag:{Tags:["SnakeBlock_Spawnegg"]}}}] if block ~ ~ ~ air run tag @s remove Block_player
      execute if entity @s[tag=!Block_player,tag=!Barrier_placed,tag=!Block_placed] at @s if entity @a[distance=..25,nbt={SelectedItem:{tag:{Tags:["SnakeBlock_Spawnegg"]}}}] if block ~ ~ ~ air run setblock ~ ~ ~ barrier
      execute if entity @s[tag=Block_reset] at @s if entity @a[distance=..25,nbt={SelectedItem:{tag:{Tags:["SnakeBlock_Spawnegg"]}}}] if block ~ ~ ~ air run setblock ~ ~ ~ barrier
      execute if entity @s[tag=!Block_player,tag=!Barrier_placed,tag=!Block_placed] at @s if entity @a[distance=..25,nbt={SelectedItem:{tag:{Tags:["SnakeBlock_Spawnegg"]}}}] if block ~ ~ ~ barrier run tag @s add Barrier_placed
      # DELETE IF BARRIER GETS DESTROYED
         execute if entity @s[tag=Barrier_placed] at @s if entity @a[distance=..25,nbt={SelectedItem:{tag:{Tags:["SnakeBlock_Spawnegg"]}}}] unless block ~ ~ ~ barrier run function wpm:setups/blocks/snake/delete
   # REMOVE BARRIER
      execute if entity @s[tag=!Block_player,tag=!Block_placed,tag=Barrier_placed] at @s unless entity @a[distance=..25,nbt={SelectedItem:{tag:{Tags:["SnakeBlock_Spawnegg"]}}}] if block ~ ~ ~ barrier run setblock ~ ~ ~ air
      execute if entity @s[tag=!Block_player,tag=!Block_placed,tag=Barrier_placed] at @s unless entity @a[distance=..25,nbt={SelectedItem:{tag:{Tags:["SnakeBlock_Spawnegg"]}}}] if block ~ ~ ~ air run tag @s remove Barrier_placed
execute if entity @s[tag=Block_reset] run tag @s remove Block_reset
