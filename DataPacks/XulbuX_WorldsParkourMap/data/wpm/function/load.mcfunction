################################ ANNOUNCE RELOAD  -  START ##############################
tellraw @a ["",{"text":""}]
tellraw @a ["",{"text":"················································································","color":"#4060FF"}]
tellraw @a ["",{"text":">>","bold":true,"color":"#2A8BA7"},{"text":" Loading: ","bold":true,"color":"#5FDCFF"},{"text":"W","italic":true,"underlined":true,"color":"#7580FF"},{"text":"M","italic":true,"underlined":true,"color":"#8471F9"},{"text":"P","italic":true,"underlined":true,"color":"#9363F3"},{"text":"-","italic":true,"underlined":true,"color":"#A355EE"},{"text":"e","italic":true,"underlined":true,"color":"#B247E8"},{"text":"n","italic":true,"underlined":true,"color":"#C138E2"},{"text":"g","italic":true,"underlined":true,"color":"#D12ADD"},{"text":"i","italic":true,"underlined":true,"color":"#E01CD7"},{"text":"n","italic":true,"underlined":true,"color":"#EF0ED1"},{"text":"e","italic":true,"underlined":true,"color":"#FF00CC"}]

################################ SCOREBOARD  -  SETUP ##############################
# BUILDING BLOCKS & MAP  -  COMPONENTS
scoreboard objectives add Checkpoint dummy
scoreboard objectives add AirLift dummy
scoreboard objectives add AirLift_active dummy
scoreboard objectives add JumpPad dummy
scoreboard objectives add Title_LavaCave dummy
scoreboard objectives add Remove_Deleter dummy
scoreboard objectives add SnakeBlock_before_ID dummy
scoreboard objectives add SnakeBlock_after_ID dummy
scoreboard objectives add SnakeBlock_ID dummy
scoreboard objectives add Snake_timer dummy
scoreboard objectives add Snake_delay dummy
scoreboard objectives add ColorBlock_ID dummy
scoreboard objectives add Moving_distance dummy
scoreboard objectives add Moving_break dummy
scoreboard objectives add Moving_dir dummy
scoreboard objectives add Pos_Y dummy
# RACE ITEMS & PLAYER  -  SETUP
scoreboard objectives add HomingMissile minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add HomingAmmo dummy
scoreboard objectives add HomingLauncher_timer dummy
scoreboard objectives add Frozen_timer dummy
scoreboard objectives add FreezeLauncher_timer dummy
scoreboard objectives add SlapTimer_green dummy
scoreboard objectives add SlapTimer_red dummy
scoreboard objectives add Rotation0 dummy
scoreboard objectives add Rotation1 dummy
scoreboard objectives add Throw_x1 dummy
scoreboard objectives add Throw_y1 dummy
scoreboard objectives add Throw_z1 dummy
scoreboard objectives add Throw_x2 dummy
scoreboard objectives add Throw_y2 dummy
scoreboard objectives add Throw_z2 dummy
scoreboard objectives add Save_X dummy
scoreboard objectives add Save_Y dummy
scoreboard objectives add Save_Z dummy
# PARKOUR PLAYERS  -  SETUP
scoreboard objectives add SETUPS dummy
scoreboard objectives add Buy_Price dummy
scoreboard objectives add Buy_Amount dummy
scoreboard objectives add Text_Rotation dummy
scoreboard objectives add Show_buy_values dummy
scoreboard objectives add DeathCount deathCount
scoreboard objectives add Last_DeathCount dummy
scoreboard objectives add DeathMessage_ID dummy
scoreboard objectives add Single_buy_price dummy
scoreboard objectives add Items_to_purchase dummy
scoreboard objectives add DeathMessage_timer dummy
scoreboard objectives add ParkourPlayers_DEATHS deathCount
scoreboard objectives modify ParkourPlayers_DEATHS displayname ["",{"text":"[","color":"#0066CC"},{"text":"DEATHS","color":"#007D62"},{"text":"]","color":"#0066CC"}]
scoreboard objectives add ParkourPlayers_HEALTH health
scoreboard objectives modify ParkourPlayers_HEALTH displayname ["",{"text":"[","color":"#D35555"},{"text":"HEALTH","color":"#FF6955"},{"text":"]","color":"#D35555"}]
scoreboard objectives modify ParkourPlayers_HEALTH rendertype hearts
scoreboard objectives add ParkourPlayers_MONEY dummy
scoreboard objectives modify ParkourPlayers_MONEY displayname ["",{"text":"[","bold":true,"color":"#CC9900"},{"text":"MONEY","bold":false,"color":"#FFCC00"},{"text":"]","bold":true,"color":"#CC9900"}]
# FUNCTIONS  -  GENERAL
scoreboard objectives add Check_Blocks dummy
scoreboard objectives add Check_Blocks_2 dummy
# OTHER FUNCTIONS  -  SETUP
scoreboard objectives add _get_wpm_item_ID dummy
scoreboard objectives add chat_expanded_01 dummy
scoreboard objectives add chat_expanded_02 dummy
scoreboard objectives add chat_expanded_03 dummy

################################ TEAMS  -  SETUP ##############################
team add ItemLock
team add ParkourMapPlayers ["",{"text":"[","color":"blue"},{"text":"PARKOUR","color":"#7575FF"},{"text":"]","color":"blue"}," ",{"text":"Players","color":"#E8FF00","bold":true}]
team modify ParkourMapPlayers collisionRule pushOtherTeams
team modify ParkourMapPlayers color blue

################################ ANNOUNCE RELOAD  -  SUCCESS ##############################
tellraw @a ["",{"text":">>","bold":true,"color":"#2A8BA7"},{"text":" ","color":"#5FDCFF"},{"text":"W","italic":true,"underlined":true,"color":"#7580FF"},{"text":"M","italic":true,"underlined":true,"color":"#8471F9"},{"text":"P","italic":true,"underlined":true,"color":"#9363F3"},{"text":"-","italic":true,"underlined":true,"color":"#A355EE"},{"text":"e","italic":true,"underlined":true,"color":"#B247E8"},{"text":"n","italic":true,"underlined":true,"color":"#C138E2"},{"text":"g","italic":true,"underlined":true,"color":"#D12ADD"},{"text":"i","italic":true,"underlined":true,"color":"#E01CD7"},{"text":"n","italic":true,"underlined":true,"color":"#EF0ED1"},{"text":"e","italic":true,"underlined":true,"color":"#FF00CC"},{"text":" is now ","color":"#9B75FF"},{"text":"started\n   up","color":"#9B75FF","bold":true},{"text":" and ready to use.","color":"#9B75FF"}]
tellraw @a ["",{"text":"················································································","color":"#4060FF"}]
tellraw @a ["",{"text":""}]
