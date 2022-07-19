rounded = Set(100:4:130)
flat    = Set(101:4:130)
headless = Set(102:4:130)
tslot   = Set(103:4:130)

hex      = Set(100:108)
phillips = Set(109:115)
slotted  = Set(116:121)
torx     = Set(122:129)

aluminium = Set(100:3:120)
brass     = Set(101:3:120)
steel     = Set(102:3:120)
plastic   = Set(121:2:130)
wood      = Set(122:2:130)

intersect(rounded, torx, wood)
intersect(phillips, steel)
setdiff(tslot, plastic)