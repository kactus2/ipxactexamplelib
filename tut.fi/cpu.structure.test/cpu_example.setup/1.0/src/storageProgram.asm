nop
nop
set 0 2
set 1 0x120
set 2 0x1A0
store 1 1 @isoSailoo
plus 1 0
cmp 1 2
bne isoSailoo
set 1 0x1A0
set 2 0x1E0
store 1 1 @hashSailoo
plus 1 0
cmp 1 2
bne hashSailoo
set 1 0x1A0
set 2 0x220
load 3 1 @hashLukee
plus 1 0
cmp 1 2
bne hashLukee
nop
end