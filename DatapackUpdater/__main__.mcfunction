execute if entity @a[nbt={SelectedItem:{tag:{Tags:["DELETER_Spawnegg"]}}},tag=wpm_OP] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["AirLift_Spawnegg"]}}},tag=wpm_OP] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["JumpPad_Spawnegg"]}}},tag=wpm_OP] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["Portal1_Spawnegg"]}}},tag=wpm_OP] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["Portal2_Spawnegg"]}}},tag=wpm_OP] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["ResetButton_Spawnegg"]}}},tag=wpm_OP] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["BuyStation_Spawnegg"]}}},tag=wpm_OP] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["FakePortal_Spawnegg"]}}},tag=wpm_OP] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["SnakeBlock_Spawnegg"]}}},tag=wpm_OP] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["MovingPlatform_Spawnegg"]}}},tag=wpm_OP] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["DisplayItem_Spawnegg"]}}},tag=wpm_OP] run function wpm:setups/_run_all_
execute if entity @a[nbt={SelectedItem:{tag:{Tags:["INT-Lock_Spawnegg"]}}},tag=wpm_OP] run function wpm:setups/_run_all_

execute if entity @a[nbt={SelectedItem:{id:"minecraft:light"}}] run function wpm:setups/_run_all_

################################ GENERAL: NOT-ALLOWED / BUILDING-MODE OFF > DELETE ##############################
   execute at @e[tag=NEW,tag=!PORTAL] run tellraw @a[distance=..6] ["",{"text":"Player has no permission\nto use an item!","color":"red"},"\n",{"text":"OR:","color":"dark_red","bold":true},{"text":" Building mode failed to activate.","color":"#CC0000"}]
   kill @e[tag=NEW,tag=!PORTAL]
################################ SPECIAL: NOT-ALLOWED / BUILDING-MODE OFF > DELETE ##############################
   # PORTALS
      execute if entity @a[nbt={SelectedItem:{tag:{Tags:["Portal1_Spawnegg"]}}},tag=wpm_OP] as @e[tag=NEW,tag=!PLACED,tag=PORTAL] run tag @s remove NEW
      execute if entity @a[nbt={SelectedItem:{tag:{Tags:["Portal1_Spawnegg"]}}},tag=wpm_OP] as @e[tag=!NEW,tag=!PLACED,tag=PORTAL] run tag @s add PLACED
      execute if entity @a[nbt={SelectedItem:{tag:{Tags:["Portal2_Spawnegg"]}}},tag=wpm_OP] as @e[tag=NEW,tag=!PLACED,tag=PORTAL] run tag @s remove NEW
      execute if entity @a[nbt={SelectedItem:{tag:{Tags:["Portal2_Spawnegg"]}}},tag=wpm_OP] as @e[tag=!NEW,tag=!PLACED,tag=PORTAL] run tag @s add PLACED
      execute unless entity @a[nbt={SelectedItem:{tag:{Tags:["Portal1_Spawnegg"]}}},tag=wpm_OP] at @e[tag=NEW,tag=!PLACED,tag=Portal1] run tellraw @a[distance=..6] ["",{"text":"Player has no permission\nto use an item!","color":"red"},"\n",{"text":"OR:","color":"dark_red","bold":true},{"text":" Building mode failed to activate.","color":"#CC0000"}]
      execute unless entity @a[nbt={SelectedItem:{tag:{Tags:["Portal1_Spawnegg"]}}},tag=wpm_OP] run kill @e[tag=NEW,tag=!PLACED,tag=Portal1]
      execute unless entity @a[nbt={SelectedItem:{tag:{Tags:["Portal2_Spawnegg"]}}},tag=wpm_OP] at @e[tag=NEW,tag=!PLACED,tag=Portal2] run tellraw @a[distance=..6] ["",{"text":"Player has no permission\nto use an item!","color":"red"},"\n",{"text":"OR:","color":"dark_red","bold":true},{"text":" Building mode failed to activate.","color":"#CC0000"}]
      execute unless entity @a[nbt={SelectedItem:{tag:{Tags:["Portal2_Spawnegg"]}}},tag=wpm_OP] run kill @e[tag=NEW,tag=!PLACED,tag=Portal2]
