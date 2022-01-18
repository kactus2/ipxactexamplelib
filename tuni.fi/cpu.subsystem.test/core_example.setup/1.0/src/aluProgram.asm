nop
set 3 0x4
set 4 0x6
minus 3 4
set 1 0xAA
set 2 0xAA
minus 1 2
nop
div 2 1
set 5 0xFFFF
set 6 0xFFFF
plus 5 6
nop
nop
cmp 5 6
cmp 1 2
nop
end