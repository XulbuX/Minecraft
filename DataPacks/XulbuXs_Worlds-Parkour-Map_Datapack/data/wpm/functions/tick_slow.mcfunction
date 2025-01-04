################################ SLOW-TICKS  -  LOOP ##############################
schedule clear wpm:tick_slow
schedule function wpm:tick_slow 1t replace

################################ SLOW-TICK  -  FUNCTIONS ##############################
# SPECIAL MAP-COMPONENTS
function wpm:blocks/interaction-lock/slow-tick/locked-particles
function wpm:blocks/moving-platform/slow-tick/move-break_timer
function wpm:blocks/snake/slow-tick/snake_particles
function wpm:blocks/air-lift/slow-tick/__main__
function wpm:blocks/jump-pad/slow-tick/__main__
function wpm:blocks/portals/slow-tick/__main__
function wpm:blocks/deleter/slow-tick/__main__

# SPECIAL RACE-ITEMS
function wpm:items/homing-launcher/slow-tick/__main__
function wpm:items/freeze-bomb/slow-tick/__main__
function wpm:items/slap-stick/slow-tick/__main__

# OTHER MAP FUNCTIONS
function wpm:map_funcs/death-messages/slow-tick/cancel-timer
