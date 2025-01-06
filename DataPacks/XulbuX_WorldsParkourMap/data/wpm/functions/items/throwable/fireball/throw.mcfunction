# AS AT PLAYER

summon fireball ^ ^ ^0.5 {Tags:["player"],ExplosionPower:0}

playsound minecraft:entity.ender_dragon.flap player @a ~ ~ ~ 1 1.2
playsound minecraft:entity.generic.burn player @a ~ ~ ~ 0.5 1

kill @e[type=snowball,nbt={Item:{tag:{fireball:1b}}},sort=nearest,limit=1]
