execute if entity @s[tag=collision__1] at @s run tellraw @a[distance=..50] {"text":"TWO MOVING-PLATFORMS COLLIDED\nWITH EACH OTHER!","bold":true,"color":"red"}
execute at @s run particle explosion_emitter ~ ~ ~ 0 0 0 0 1 force @a
function wpm:setups/blocks/moving-platform/delete_platform-parts
kill @e[tag=moving_platform,distance=..1.45]
kill @s
