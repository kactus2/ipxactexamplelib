# System memory map

Byte-addressable, 16-bit address width

|Register|Start address|End address|Notes|
|--------|-------------|-----------|-----|
|Reserved|0x0000|0x007F||
|**Memory**||||
|Data|0x0180|0x01FF||
|**Spi controller**||||
|recv_buffer|0x0280|0x028F|8x16 bits|
|status|0x0290|0x0290|Bit 0 indicates when received transfer is complete|
|send_buffer|0x0291|0x02A0|8x16 bits|
|control|0x02A1|0x02A1|Bit 0 indicates when to start transfer |
|**Sum Buffer**||||
|new_value|0x0380|0x0383||
|new_result|0x0384|0x0387||
