# PARTICLES
  execute at @s run particle lava ~ ~ ~ .25 .25 .25 10 10 force @a
  execute at @s run particle explosion_emitter ~ ~ ~ 0 0 0 0 1 force @a
  execute at @s run particle large_smoke ~ ~ ~ .25 .25 .25 .25 50 force @a
# CUSTOM DEATH MESSAGE
  gamerule showDeathMessages false
  execute at @s as @e[sort=nearest,limit=1,type=!#wpm:not_mob] run scoreboard players set @s DeathMessage_ID 4
# SOUND
  execute at @s run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 1 0
# DAMAGE
  execute at @s as @e[distance=..1.5,type=!#wpm:not_mob] run damage @s 20 cramming
  execute at @s as @e[distance=1.5..3,type=!#wpm:not_mob] run damage @s 17 cramming
  execute at @s as @e[distance=3..5,type=!#wpm:not_mob] run damage @s 13 cramming
  execute at @s as @e[distance=5..7.5,type=!#wpm:not_mob] run damage @s 8 cramming
  execute at @s as @e[distance=7.5..10.5,type=!#wpm:not_mob] run damage @s 3 cramming
# REMOVE LANDMINE
  execute at @s run setblock ~ ~ ~ air
  kill @s
