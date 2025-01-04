################################ announce Reload  -  START ##############################
tellraw @a ["",{"text":""}]
tellraw @a ["",{"text":">>","bold":true,"color":"#96dc48"},{"text":" Loading: ","bold":true,"color":"#5fdcff"},{"text":"VeryDangerous-ENGINE","color":"#ff9030"},{"text":" ·. ·. ·. ·. ·. ·. ·. ·. ·. ·. ·. ·. ·. ·. ·. ·.","color":"#5fdcff"}]

################################ Scoreboard  -  SETUP ##############################
scoreboard objectives add Countdown dummy
scoreboard objectives add COUNTDOWN dummy

################################ announce Reload  -  SUCCESS ##############################
tellraw @a ["",{"text":">>","bold":true,"color":"#96dc48"},{"text":" ","color":"#5fdcff"},{"text":"VeryDangerous-ENGINE","color":"#ff9030"},{"text":" is now ","color":"#8d5fff"},{"text":"started up","color":"#8d5fff","bold":true},{"text":" and ready to use.","color":"#8d5fff"}]
tellraw @a ["",{"text":""}]