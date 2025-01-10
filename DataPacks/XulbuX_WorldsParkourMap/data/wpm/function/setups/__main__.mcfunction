execute if entity @a[nbt={SelectedItem:{tag:{Tags:["deleter_spawnegg"]}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["air_lift_spawnegg"]}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["jump_pad_spawnegg"]}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["portal1_spawnegg"]}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["portal2_spawnegg"]}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["reset_button_spawnegg"]}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["buy_station_spawnegg"]}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["fake_portal_spawnegg"]}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["snake_block_spawnegg"]}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["moving_platform_spawnegg"]}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["display_item_spawnegg"]}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["int_lock_spawnegg"]}}},tag=wpm_op] run function wpm:setups/_run_all_

execute if entity @a[nbt={SelectedItem:{id:"minecraft:light"}}] run function wpm:setups/_run_all_

################################ GENERAL: NOT-ALLOWED / BUILDING-MODE OFF > DELETE ##############################
   execute at @e[tag=new,tag=!portal] run tellraw @a[distance=..6] ["",{"text":"Player has no permission\nto use an item!","color":"red"},"\n",{"text":"OR:","color":"dark_red","bold":true},{"text":" Building mode failed to activate.","color":"#CC0000"}]
   kill @e[tag=new,tag=!portal]
################################ SPECIAL: NOT-ALLOWED / BUILDING-MODE OFF > DELETE ##############################
   # PORTALS
      execute if entity @a[nbt={SelectedItem:{tag:{Tags:["portal1_spawnegg"]}}},tag=wpm_op] as @e[tag=new,tag=!placed,tag=portal] run tag @s remove new
      execute if entity @a[nbt={SelectedItem:{tag:{Tags:["portal1_spawnegg"]}}},tag=wpm_op] as @e[tag=!new,tag=!placed,tag=portal] run tag @s add placed
      execute if entity @a[nbt={SelectedItem:{tag:{Tags:["portal2_spawnegg"]}}},tag=wpm_op] as @e[tag=new,tag=!placed,tag=portal] run tag @s remove new
      execute if entity @a[nbt={SelectedItem:{tag:{Tags:["portal2_spawnegg"]}}},tag=wpm_op] as @e[tag=!new,tag=!placed,tag=portal] run tag @s add placed
      execute unless entity @a[nbt={SelectedItem:{tag:{Tags:["portal1_spawnegg"]}}},tag=wpm_op] at @e[tag=new,tag=!placed,tag=portal1] run tellraw @a[distance=..6] ["",{"text":"Player has no permission\nto use an item!","color":"red"},"\n",{"text":"OR:","color":"dark_red","bold":true},{"text":" Building mode failed to activate.","color":"#CC0000"}]
      execute unless entity @a[nbt={SelectedItem:{tag:{Tags:["portal1_spawnegg"]}}},tag=wpm_op] run kill @e[tag=new,tag=!placed,tag=portal1]
      execute unless entity @a[nbt={SelectedItem:{tag:{Tags:["portal2_spawnegg"]}}},tag=wpm_op] at @e[tag=new,tag=!placed,tag=portal2] run tellraw @a[distance=..6] ["",{"text":"Player has no permission\nto use an item!","color":"red"},"\n",{"text":"OR:","color":"dark_red","bold":true},{"text":" Building mode failed to activate.","color":"#CC0000"}]
      execute unless entity @a[nbt={SelectedItem:{tag:{Tags:["portal2_spawnegg"]}}},tag=wpm_op] run kill @e[tag=new,tag=!placed,tag=portal2]
