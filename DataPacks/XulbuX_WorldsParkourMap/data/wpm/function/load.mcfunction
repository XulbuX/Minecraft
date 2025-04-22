################################ ANNOUNCE RELOAD  -  START ##############################
tellraw @a ["",{"text":""}]
tellraw @a ["",{"text":"················································································","italic":false,"bold":false,"color":"#4060FF"}]
tellraw @a ["",{"text":">>","italic":false,"bold":true,"color":"#2A8BA7"},{"text":" Loading: ","italic":false,"bold":true,"color":"#5FDCFF"},{"text":"W","italic":true,"bold":false,"underlined":true,"color":"#7580FF"},{"text":"M","italic":true,"bold":false,"underlined":true,"color":"#8471F9"},{"text":"P","italic":true,"bold":false,"underlined":true,"color":"#9363F3"},{"text":"-","italic":true,"bold":false,"underlined":true,"color":"#A355EE"},{"text":"e","italic":true,"bold":false,"underlined":true,"color":"#B247E8"},{"text":"n","italic":true,"bold":false,"underlined":true,"color":"#C138E2"},{"text":"g","italic":true,"bold":false,"underlined":true,"color":"#D12ADD"},{"text":"i","italic":true,"bold":false,"underlined":true,"color":"#E01CD7"},{"text":"n","italic":true,"bold":false,"underlined":true,"color":"#EF0ED1"},{"text":"e","italic":true,"bold":false,"underlined":true,"color":"#FF00CC"}]

################################ SCOREBOARD  -  SETUP ##############################
# BUILDING BLOCKS & MAP  -  COMPONENTS
scoreboard objectives add wpm_air_lift_setup dummy
scoreboard objectives add wpm_air_lift_timer dummy
scoreboard objectives add wpm_air_lift_active dummy
scoreboard objectives add wpm_is_on_checkpoint dummy
scoreboard objectives add wpm_jump_pad_setup dummy
scoreboard objectives add wpm_jump_pad_timer dummy
scoreboard objectives add wpm_title_lava_cave dummy
scoreboard objectives add wpm_remove_deleter dummy
scoreboard objectives add wpm_snake_block_before_id dummy
scoreboard objectives add wpm_snake_block_after_id dummy
scoreboard objectives add wpm_snake_block_id dummy
scoreboard objectives add wpm_snake_timer dummy
scoreboard objectives add wpm_snake_delay dummy
scoreboard objectives add wpm_color_block_id dummy
scoreboard objectives add wpm_moving_distance dummy
scoreboard objectives add wpm_moving_break dummy
scoreboard objectives add wpm_moving_dir dummy
scoreboard objectives add wpm_pos_y dummy
# RACE ITEMS & PLAYER  -  SETUP
scoreboard objectives add wpm_homing_missile minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add wpm_homing_ammo dummy
scoreboard objectives add wpm_homing_launcher_timer dummy
scoreboard objectives add wpm_frozen_timer dummy
scoreboard objectives add wpm_freeze_launcher_timer dummy
scoreboard objectives add wpm_slap_timer_green dummy
scoreboard objectives add wpm_slap_timer_red dummy
scoreboard objectives add wpm_rotation_0 dummy
scoreboard objectives add wpm_rotation_1 dummy
scoreboard objectives add wpm_throw_x1 dummy
scoreboard objectives add wpm_throw_y1 dummy
scoreboard objectives add wpm_throw_z1 dummy
scoreboard objectives add wpm_throw_x2 dummy
scoreboard objectives add wpm_throw_y2 dummy
scoreboard objectives add wpm_throw_z2 dummy
# scoreboard objectives add wpm_save_x dummy
# scoreboard objectives add wpm_save_y dummy
# scoreboard objectives add wpm_save_z dummy
# PARKOUR PLAYERS  -  SETUP
# scoreboard objectives add wpm_setups dummy
scoreboard objectives add wpm_buy_price dummy
scoreboard objectives add wpm_buy_amount dummy
scoreboard objectives add wpm_text_rotation dummy
scoreboard objectives add wpm_show_buy_values dummy
scoreboard objectives add wpm_death_count deathCount
scoreboard objectives add wpm_last_death_count dummy
scoreboard objectives add wpm_death_msg_id dummy
scoreboard objectives add wpm_single_buy_price dummy
scoreboard objectives add wpm_items_to_purchase dummy
scoreboard objectives add wpm_death_msg_timer dummy
scoreboard objectives add wpm_players_deaths deathCount
scoreboard objectives modify wpm_players_deaths displayname ["",{"text":"》","italic":false,"bold":false,"color":"#5055FF"},{"text":"DEATHS","italic":false,"bold":true,"color":"#8085FF"},{"text":"《","italic":false,"bold":false,"color":"#5055FF"}]
scoreboard objectives add wpm_players_health health
scoreboard objectives modify wpm_players_health displayname ["",{"text":"》","italic":false,"bold":false,"color":"#D03530"},{"text":"HEALTH","italic":false,"bold":true,"color":"#FF5550"},{"text":"《","italic":false,"bold":false,"color":"#D03530"}]
scoreboard objectives modify wpm_players_health rendertype hearts
scoreboard objectives add wpm_players_money dummy
scoreboard objectives modify wpm_players_money displayname ["",{"text":"》","italic":false,"bold":false,"color":"#E06020"},{"text":"MONEY","italic":false,"bold":true,"color":"#FF8540"},{"text":"《","italic":false,"bold":false,"color":"#E06020"}]
# FUNCTIONS  -  GENERAL
scoreboard objectives add wpm_check_blocks dummy
scoreboard objectives add wpm_check_blocks_2 dummy
# OTHER FUNCTIONS  -  SETUP
scoreboard objectives add _wpm_give_item_id dummy
scoreboard objectives add wpm_chat_expanded_01 dummy
scoreboard objectives add wpm_chat_expanded_02 dummy
scoreboard objectives add wpm_chat_expanded_03 dummy

################################ TEAMS  -  SETUP ##############################
team add wpm_item_lock
team add wpm_players ["",{"text":"[","italic":false,"bold":false,"color":"blue"},{"text":"PARKOUR","italic":false,"bold":false,"color":"#7575FF"},{"text":"]","italic":false,"bold":false,"color":"blue"}," ",{"text":"Players","italic":false,"bold":true,"color":"#E8FF00"}]
team modify wpm_players collisionRule pushOtherTeams
team modify wpm_players color blue

################################ ANNOUNCE RELOAD  -  SUCCESS ##############################
tellraw @a ["",{"text":">>","italic":false,"bold":true,"color":"#2A8BA7"},{"text":" ","italic":false,"bold":false,"color":"#5FDCFF"},{"text":"W","italic":true,"bold":false,"underlined":true,"color":"#7580FF"},{"text":"M","italic":true,"bold":false,"underlined":true,"color":"#8471F9"},{"text":"P","italic":true,"bold":false,"underlined":true,"color":"#9363F3"},{"text":"-","italic":true,"bold":false,"underlined":true,"color":"#A355EE"},{"text":"e","italic":true,"bold":false,"underlined":true,"color":"#B247E8"},{"text":"n","italic":true,"bold":false,"underlined":true,"color":"#C138E2"},{"text":"g","italic":true,"bold":false,"underlined":true,"color":"#D12ADD"},{"text":"i","italic":true,"bold":false,"underlined":true,"color":"#E01CD7"},{"text":"n","italic":true,"bold":false,"underlined":true,"color":"#EF0ED1"},{"text":"e","italic":true,"bold":false,"underlined":true,"color":"#FF00CC"},{"text":" is now ","italic":false,"bold":false,"color":"#9B75FF"},{"text":"started\n   up","italic":false,"bold":true,"color":"#9B75FF"},{"text":" and ready to use.","italic":false,"bold":false,"color":"#9B75FF"}]
tellraw @a ["",{"text":"················································································","italic":false,"bold":false,"color":"#4060FF"}]
tellraw @a ["",{"text":""}]
