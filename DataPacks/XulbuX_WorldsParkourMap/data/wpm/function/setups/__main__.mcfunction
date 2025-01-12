execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{deleter_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{air_lift_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{jump_pad_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{portal1_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{portal2_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{reset_button_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{buy_station_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{fake_portal_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{snake_block_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{moving_platform_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{display_item_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{int_lock_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_

execute if entity @a[nbt={SelectedItem:{id:"minecraft:light"}}] run function wpm:setups/_run_all_

################################ GENERAL: NOT-ALLOWED / BUILDING-MODE OFF > DELETE ##############################
   execute at @e[tag=new,tag=!portal] run tellraw @a[distance=..6] ["",{"text":"You have no permission to use this item!","italic":false,"bold":false,"color":"red"}]
   kill @e[tag=new,tag=!portal]
################################ SPECIAL: NOT-ALLOWED / BUILDING-MODE OFF > DELETE ##############################
   # PORTALS
      execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{portal1_spawnegg:1}}}},tag=wpm_op] as @e[tag=new,tag=!placed,tag=portal] run tag @s remove new
      execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{portal1_spawnegg:1}}}},tag=wpm_op] as @e[tag=!new,tag=!placed,tag=portal] run tag @s add placed
      execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{portal2_spawnegg:1}}}},tag=wpm_op] as @e[tag=new,tag=!placed,tag=portal] run tag @s remove new
      execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{portal2_spawnegg:1}}}},tag=wpm_op] as @e[tag=!new,tag=!placed,tag=portal] run tag @s add placed
      execute unless entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{portal1_spawnegg:1}}}},tag=wpm_op] at @e[tag=new,tag=!placed,tag=portal1] run tellraw @a[distance=..6] ["",{"text":"You have no permission to use this item!","italic":false,"bold":false,"color":"red"}]
      execute unless entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{portal1_spawnegg:1}}}},tag=wpm_op] run kill @e[tag=new,tag=!placed,tag=portal1]
      execute unless entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{portal2_spawnegg:1}}}},tag=wpm_op] at @e[tag=new,tag=!placed,tag=portal2] run tellraw @a[distance=..6] ["",{"text":"You have no permission to use this item!","italic":false,"bold":false,"color":"red"}]
      execute unless entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{portal2_spawnegg:1}}}},tag=wpm_op] run kill @e[tag=new,tag=!placed,tag=portal2]
