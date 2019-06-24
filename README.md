# MicroAdventure VMF Generator

## About

Sometime in 2018 I partook in RunThinkShootLive 1 Billion Units Experimental Mapping Challenge. 
Instead of producing traditional map I decided to try and make smallest map possible 
within limits of Source Engine that provides text adventure experience. 

To do so, I wrote this program in a bit under 1.5 days to generate map source, which 
would later be compiled by external toolchain (HTCT) into playable BSP map file.

This program is exactly the same program that has been used to produce map for the challenge, except for some small bugfixes.

---
## Requirements

* Lua 5.3

---
## Usage

Program doesn't require any special parameters, just run it through Lua 5.3 interpreter  
**Windows**  
`lua53.exe vmfgen.lua`  
**\*nix**  
`lua53 vmfgen.lua`  

The program will then produce a file named 'microadventure_1-bn-emc.vmf' in current directory.

---
