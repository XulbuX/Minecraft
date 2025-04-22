execute at @s run tag @e[distance=..2,sort=nearest,limit=1,tag=target] add eliminate
# CUSTOM DEATH MESSAGE
  gamerule showDeathMessages false
  execute as @a[distance=..10,limit=1] run scoreboard players set @s wpm_death_msg_id 3
# PARTICLE EFFECT
  execute at @s run summon firework_rocket ~ ~ ~ {LifeTime:0,FireworksItem:{id:"firework_rocket",Count:1,tag:{Fireworks:{Explosions:[{Flicker:1b},{Type:1,Flicker:1b},{Colors:[I;16754688,16711935,65535],FadeColors:[I;16711935,65535],Type:4},{Flicker:1b},{Type:1,Flicker:1b},{Colors:[I;16754688,16711935,65535],FadeColors:[I;16711935,65535],Type:4}]}}}}
# SOUND
  execute at @s run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 1 0
# DAMAGE
  execute at @s as @e[distance=..1.5,type=!#wpm:not_mob] run damage @s 16 cramming
  execute at @s as @e[distance=1.5..3,type=!#wpm:not_mob] run damage @s 12 cramming
  execute at @s as @e[distance=3..5,type=!#wpm:not_mob] run damage @s 7 cramming
  execute at @s as @e[distance=5..7.5,type=!#wpm:not_mob] run damage @s 2 cramming
# REMOVE MISSILE
  kill @s
