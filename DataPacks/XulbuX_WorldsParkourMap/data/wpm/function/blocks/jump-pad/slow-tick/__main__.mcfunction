# JUMP-PAD PARTICLES
   execute as @e[type=interaction,nbt={Tags:["jump_pad"]}] at @s run execute if entity @s[scores={jump_pad=1}] run function wpm:blocks/jump-pad/slow-tick/particles
# JUMP-PAD TIMER
   execute as @e[scores={jump_pad_timer=1..}] run scoreboard players remove @s jump_pad_timer 1
