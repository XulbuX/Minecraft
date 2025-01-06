gamerule commandModificationBlockLimit 100000000
execute at @s if dimension overworld align xyz positioned ~.5 -63.5 ~.5 run function vd:bombs/one-chunk_fcker/replace_no-value
execute at @s if dimension the_nether align xyz positioned ~.5 0.5 ~.5 run function vd:bombs/one-chunk_fcker/replace_no-value
execute at @s if dimension the_end align xyz positioned ~.5 0.5 ~.5 run function vd:bombs/one-chunk_fcker/replace_no-value
kill @e[type=item]