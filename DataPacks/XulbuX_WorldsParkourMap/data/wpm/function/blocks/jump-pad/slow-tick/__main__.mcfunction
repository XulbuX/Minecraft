# JUMP-PAD PARTICLES
   execute as @e[type=interaction,nbt={Tags:["JumpPad"]}] at @s run execute if entity @s[scores={JumpPad=1}] run function wpm:blocks/jump-pad/slow-tick/particles
# JUMP-PAD TIMER
   execute as @e[scores={JumpPad_timer=1..}] run scoreboard players remove @s JumpPad_timer 1
