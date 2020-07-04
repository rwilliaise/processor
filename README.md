# processor
Testing some CS stuff. Mostly for an attempt at emulating a processor using Lua.

To run the program, simply run in the main directory:
```bash
lua MainProcess.lua [romfile]
```
Where `romfile` is an optional paramater that can replace which ROM is loaded. By default it loads `rom.bin`. The first byte of the ROM should, if possible, be either a 1 or a 0. If it is a one, then it will turn on debugging mode. If it is any other value, it will default debugging mode to be off.
