execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_deleter_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_air_lift_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_jump_pad_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_portal1_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_portal2_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_reset_button_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_buy_station_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_fake_portal_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_snake_block_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_moving_platform_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_display_item_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_int_lock_spawnegg:1}}}},tag=wpm_op] run function wpm:setups/_run_all_

execute if entity @a[nbt={SelectedItem:{id:"minecraft:light"}}] run function wpm:setups/_run_all_

################################ GENERAL: NOT-ALLOWED / BUILDING-MODE OFF > DELETE ##############################
   execute at @e[tag=new,tag=!wpm_portal] run tellraw @a[distance=..6] ["",{"text":"You have no permission to use this item!","italic":false,"bold":false,"color":"red"}]
   kill @e[tag=new,tag=!wpm_portal]
################################ SPECIAL: NOT-ALLOWED / BUILDING-MODE OFF > DELETE ##############################
   # PORTALS
      execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_portal1_spawnegg:1}}}},tag=wpm_op] as @e[tag=new,tag=!placed,tag=wpm_portal] run tag @s remove new
      execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_portal1_spawnegg:1}}}},tag=wpm_op] as @e[tag=!new,tag=!placed,tag=wpm_portal] run tag @s add placed
      execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_portal2_spawnegg:1}}}},tag=wpm_op] as @e[tag=new,tag=!placed,tag=wpm_portal] run tag @s remove new
      execute if entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_portal2_spawnegg:1}}}},tag=wpm_op] as @e[tag=!new,tag=!placed,tag=wpm_portal] run tag @s add placed
      execute unless entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_portal1_spawnegg:1}}}},tag=wpm_op] at @e[tag=new,tag=!placed,tag=wpm_portal_1] run tellraw @a[distance=..6] ["",{"text":"You have no permission to use this item!","italic":false,"bold":false,"color":"red"}]
      execute unless entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_portal1_spawnegg:1}}}},tag=wpm_op] run kill @e[tag=new,tag=!placed,tag=wpm_portal_1]
      execute unless entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_portal2_spawnegg:1}}}},tag=wpm_op] at @e[tag=new,tag=!placed,tag=wpm_portal_2] run tellraw @a[distance=..6] ["",{"text":"You have no permission to use this item!","italic":false,"bold":false,"color":"red"}]
      execute unless entity @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{wpm_portal2_spawnegg:1}}}},tag=wpm_op] run kill @e[tag=new,tag=!placed,tag=wpm_portal_2]
