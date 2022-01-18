#System memory map
Byte-addressable

|Register|Start address|End address|Notes|
|--------|-------------|-----------|-----|
|Reserved|0x0000|0x007F||
|Memory||||
|Data|0x00A0|0x011F||
|Spi controller||||
|recv_buffer|0x01A0|0x010F||
|status|0x0110||Bit 0 indicates when received transfer is complete|
|send_bufer|0x0111|0x0120||
|control|0x0121||Bit 0 indicates when to start transfer |
|Sum Buffer||||
|new_value|0x01B0|0x01B3||
|new_result|0x01B4|0x01B7||
