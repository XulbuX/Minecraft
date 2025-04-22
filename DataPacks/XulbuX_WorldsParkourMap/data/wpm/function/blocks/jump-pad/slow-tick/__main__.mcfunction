# JUMP-PAD PARTICLES
   execute as @e[type=interaction,nbt={Tags:["wpm_jump_pad"]}] at @s run execute if entity @s[scores={wpm_jump_pad_setup=1}] run function wpm:blocks/jump-pad/slow-tick/particles
# JUMP-PAD TIMER
   execute as @e[scores={wpm_jump_pad_timer=1..}] run scoreboard players remove @s wpm_jump_pad_timer 1
