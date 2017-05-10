nop
nop
set 0 1
set 1 0x2B1
set 2 0x2C1
store 1 1 @bufferoi
plus 1 0
cmp 1 2
bne bufferoi
set 3 1
set 2 0x2C1
store 3 2
set 2 0x2B0
set 4 0
load 4 2 @pollaa
cmp 4 0
bne pollaa
set 1 0x2A0
set 2 0x2B0
load 5 1 @lue
plus 1 0
cmp 1 2
bne lue
nop
end