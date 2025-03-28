################################ ANNOUNCE RELOAD  -  START ##############################
tellraw @a ["",{"text":""}]
tellraw @a ["",{"text":"················································································","italic":false,"bold":false,"color":"#4060FF"}]
tellraw @a ["",{"text":">>","italic":false,"bold":true,"color":"#2A8BA7"},{"text":" Loading: ","italic":false,"bold":true,"color":"#5FDCFF"},{"text":"W","italic":true,"bold":false,"underlined":true,"color":"#7580FF"},{"text":"M","italic":true,"bold":false,"underlined":true,"color":"#8471F9"},{"text":"P","italic":true,"bold":false,"underlined":true,"color":"#9363F3"},{"text":"-","italic":true,"bold":false,"underlined":true,"color":"#A355EE"},{"text":"e","italic":true,"bold":false,"underlined":true,"color":"#B247E8"},{"text":"n","italic":true,"bold":false,"underlined":true,"color":"#C138E2"},{"text":"g","italic":true,"bold":false,"underlined":true,"color":"#D12ADD"},{"text":"i","italic":true,"bold":false,"underlined":true,"color":"#E01CD7"},{"text":"n","italic":true,"bold":false,"underlined":true,"color":"#EF0ED1"},{"text":"e","italic":true,"bold":false,"underlined":true,"color":"#FF00CC"}]

################################ SCOREBOARD  -  SETUP ##############################
# BUILDING BLOCKS & MAP  -  COMPONENTS
scoreboard objectives add checkpoint dummy
scoreboard objectives add air_lift dummy
scoreboard objectives add air_lift_active dummy
scoreboard objectives add jump_pad dummy
scoreboard objectives add title_lava_cave dummy
scoreboard objectives add remove_deleter dummy
scoreboard objectives add snake_block_before_id dummy
scoreboard objectives add snake_block_after_id dummy
scoreboard objectives add snake_block_id dummy
scoreboard objectives add snake_timer dummy
scoreboard objectives add snake_delay dummy
scoreboard objectives add color_block_id dummy
scoreboard objectives add moving_distance dummy
scoreboard objectives add moving_break dummy
scoreboard objectives add moving_dir dummy
scoreboard objectives add pos_y dummy
# RACE ITEMS & PLAYER  -  SETUP
scoreboard objectives add homing_missile minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add homing_ammo dummy
scoreboard objectives add homing_launcher_timer dummy
scoreboard objectives add frozen_timer dummy
scoreboard objectives add freeze_launcher_timer dummy
scoreboard objectives add slap_timer_green dummy
scoreboard objectives add slap_timer_red dummy
scoreboard objectives add rotation0 dummy
scoreboard objectives add rotation1 dummy
scoreboard objectives add throw_x1 dummy
scoreboard objectives add throw_y1 dummy
scoreboard objectives add throw_z1 dummy
scoreboard objectives add throw_x2 dummy
scoreboard objectives add throw_y2 dummy
scoreboard objectives add throw_z2 dummy
scoreboard objectives add save_x dummy
scoreboard objectives add save_y dummy
scoreboard objectives add save_z dummy
# PARKOUR PLAYERS  -  SETUP
scoreboard objectives add setups dummy
scoreboard objectives add buy_price dummy
scoreboard objectives add buy_amount dummy
scoreboard objectives add text_rotation dummy
scoreboard objectives add show_buy_values dummy
scoreboard objectives add death_count deathCount
scoreboard objectives add last_death_count dummy
scoreboard objectives add death_message_id dummy
scoreboard objectives add single_buy_price dummy
scoreboard objectives add items_to_purchase dummy
scoreboard objectives add death_message_timer dummy
scoreboard objectives add parkour_players_deaths deathCount
scoreboard objectives modify parkour_players_deaths displayname ["",{"text":"》","italic":false,"bold":false,"color":"#5055FF"},{"text":"DEATHS","italic":false,"bold":true,"color":"#8085FF"},{"text":"《","italic":false,"bold":false,"color":"#5055FF"}]
scoreboard objectives add parkour_players_health health
scoreboard objectives modify parkour_players_health displayname ["",{"text":"》","italic":false,"bold":false,"color":"#D03530"},{"text":"HEALTH","italic":false,"bold":true,"color":"#FF5550"},{"text":"《","italic":false,"bold":false,"color":"#D03530"}]
scoreboard objectives modify parkour_players_health rendertype hearts
scoreboard objectives add parkour_players_money dummy
scoreboard objectives modify parkour_players_money displayname ["",{"text":"》","italic":false,"bold":false,"color":"#E06020"},{"text":"MONEY","italic":false,"bold":true,"color":"#FF8540"},{"text":"《","italic":false,"bold":false,"color":"#E06020"}]
# FUNCTIONS  -  GENERAL
scoreboard objectives add check_blocks dummy
scoreboard objectives add check_blocks_2 dummy
# OTHER FUNCTIONS  -  SETUP
scoreboard objectives add _get_wpm_item_id dummy
scoreboard objectives add chat_expanded_01 dummy
scoreboard objectives add chat_expanded_02 dummy
scoreboard objectives add chat_expanded_03 dummy

################################ TEAMS  -  SETUP ##############################
team add item_lock
team add parkour_map_players ["",{"text":"[","italic":false,"bold":false,"color":"blue"},{"text":"PARKOUR","italic":false,"bold":false,"color":"#7575FF"},{"text":"]","italic":false,"bold":false,"color":"blue"}," ",{"text":"Players","italic":false,"bold":true,"color":"#E8FF00"}]
team modify parkour_map_players collisionRule pushOtherTeams
team modify parkour_map_players color blue

################################ ANNOUNCE RELOAD  -  SUCCESS ##############################
tellraw @a ["",{"text":">>","italic":false,"bold":true,"color":"#2A8BA7"},{"text":" ","italic":false,"bold":false,"color":"#5FDCFF"},{"text":"W","italic":true,"bold":false,"underlined":true,"color":"#7580FF"},{"text":"M","italic":true,"bold":false,"underlined":true,"color":"#8471F9"},{"text":"P","italic":true,"bold":false,"underlined":true,"color":"#9363F3"},{"text":"-","italic":true,"bold":false,"underlined":true,"color":"#A355EE"},{"text":"e","italic":true,"bold":false,"underlined":true,"color":"#B247E8"},{"text":"n","italic":true,"bold":false,"underlined":true,"color":"#C138E2"},{"text":"g","italic":true,"bold":false,"underlined":true,"color":"#D12ADD"},{"text":"i","italic":true,"bold":false,"underlined":true,"color":"#E01CD7"},{"text":"n","italic":true,"bold":false,"underlined":true,"color":"#EF0ED1"},{"text":"e","italic":true,"bold":false,"underlined":true,"color":"#FF00CC"},{"text":" is now ","italic":false,"bold":false,"color":"#9B75FF"},{"text":"started\n   up","italic":false,"bold":true,"color":"#9B75FF"},{"text":" and ready to use.","italic":false,"bold":false,"color":"#9B75FF"}]
tellraw @a ["",{"text":"················································································","italic":false,"bold":false,"color":"#4060FF"}]
tellraw @a ["",{"text":""}]
