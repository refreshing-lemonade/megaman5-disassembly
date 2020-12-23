# Mega Man 5 (NES) Disassembly

Disassembly is 100% finished, including code and data. Assembles to 100% clean ROM under xkas-plus. A Windows build is included in this repository for convenience.

Version:
NTSC-U (United States)

Assembling instructions:
`./xkas -o mm5.nes assemble.asm`

This game uses the MMC3 mapper chip, and contains 32 PRG banks of $2000 bytes each, and then 32 CHR banks of $2000 bytes as well. For convenience, most code banks are bundled in together as one file.

The disassembly is complete and assembles to clean but not all code is documented yet. Feel free to contribute documentation via pull request or just message and ask me to add you as a contributor if you want to help out more seriously.
