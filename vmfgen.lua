--[[
=== ============================================================ ===

Text adventure vmf generator

=== ============================================================ ===
]]

--[[
bugs
fixed but untested
emissary poker'd switch
forgetful sultan

-- needs linkcheck along with length check 
]]

math.randomseed(os.time())

local charfadetime = 0.01
local worldspawnmessage = "microadventure by krassell"
local mapfilename = "microadventure_1-bn-emc.vmf"

local obf2targ = {}
local targ2obf = {}

--local obfsymbols = {'1','I','l','|','!'}
--local obfsymbols = {'1','I','l'}
local obfsymbols = {'I','l'} -- BARC0DE!
local function GenerateObfuscatedTargetname()
	ret = ""
	for i=1,32 do
		ret = ret..obfsymbols[math.random(#obfsymbols)]
	end
	return ret
end

local function GetObfuscatedTargetname(str)
	--if true then return str end -- TODO: REMOVE
	if targ2obf[str] then
		return targ2obf[str]
	end

	local name, ok 

	repeat
		name = GenerateObfuscatedTargetname()
		if not obf2targ[name] then
			ok = true
		end
	until (ok) -- until waits for true to stop

	targ2obf[str] = name
	obf2targ[name] = str
	return name
end
--[[
local function GetObfuscatedTargetname(str)
	return str
end
--]]

local GOT = GetObfuscatedTargetname



local function GenerateVMFPreamble(file)
	file:write("versioninfo\r\n{\r\n\"editorversion\" \"400\"\r\n\"editorbuild\" \"6412\"\r\n\"mapversion\" \"0\"\r\n\"formatversion\" \"100\"\r\n\"prefab\" \"0\"\r\n}\r\n")
	file:write("visgroups\r\n{\r\n}\r\n")
	file:write("viewsettings\r\n{\r\n\"bSnapToGrid\" \"0\"\r\n\"bShowGrid\" \"1\"\r\n\"bShowLogicalGrid\" \"0\"\r\n\"nGridSpacing\" \"16\"\r\n\"bShow3DGrid\" \"0\"\r\n}\r\n")
	--file:write("world\r\n{\r\n\"id\" \"1\"\r\n\"mapversion\" \"0\"\r\n\"classname\" \"worldspawn\"\r\n\"detailmaterial\" \"detail/detailsprites\"\r\n\"detailvbsp\" \"detail.vbsp\"\r\n\"maxpropscreenwidth\" \"-1\"\r\n\"skyname\" \"sky_day01_01\"\r\n}")
	--file:write("world\r\n{\r\n\"id\" \"1\"\r\n\"mapversion\" \"0\"\r\n\"classname\" \"worldspawn\"\r\n\"detailmaterial\" \"detail/detailsprites\"\r\n\"detailvbsp\" \"detail.vbsp\"\r\n\"maxpropscreenwidth\" \"-1\"\r\n\"skyname\" \"sky_day01_01\"\r\n}")
	--"id" "1"
	file:write([[
world
{
	"mapversion" "0"
	"classname" "worldspawn"
	"message" "]]..worldspawnmessage..[["
	"skyname" "sky_day01_01"
	"maxpropscreenwidth" "-1"
	"detailvbsp" "detail.vbsp"
	"detailmaterial" "detail/detailsprites"
	solid
	{
		"id" "6"
		side
		{
			"id" "12"
			"plane" "(-8 -8 8) (-8 8 8) (8 8 8)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 -1 0 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "11"
			"plane" "(-8 8 7) (-8 8 8) (-8 -8 8)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[0 1 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "10"
			"plane" "(8 -8 7) (8 -8 8) (8 8 8)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[0 1 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "9"
			"plane" "(8 8 7) (8 8 8) (-8 8 8)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "8"
			"plane" "(-8 -8 7) (-8 -8 8) (8 -8 8)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "7"
			"plane" "(-8 8 7) (-8 -8 7) (8 -8 7)"
			"material" "HALFLIFE/BLACK"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 -1 0 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
	}
	solid
	{
		"id" "8"
		side
		{
			"id" "18"
			"plane" "(-8 8 -8) (-8 -8 -8) (8 -8 -8)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 -4] 0.25"
			"vaxis" "[0 -1 0 4] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "17"
			"plane" "(-8 -8 -7) (-8 -8 -8) (-8 8 -8)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[0 1 0 -4] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "16"
			"plane" "(8 8 -7) (8 8 -8) (8 -8 -8)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[0 1 0 -4] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "15"
			"plane" "(-8 8 -7) (-8 8 -8) (8 8 -8)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 -4] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "14"
			"plane" "(8 -8 -7) (8 -8 -8) (-8 -8 -8)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 -4] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "13"
			"plane" "(-8 -8 -7) (-8 8 -7) (8 8 -7)"
			"material" "HALFLIFE/BLACK"
			"uaxis" "[1 0 0 -4] 0.25"
			"vaxis" "[0 -1 0 4] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
	}
	solid
	{
		"id" "10"
		side
		{
			"id" "24"
			"plane" "(-8 -8 7) (-8 -8 -7) (-8 8 -7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[0 1 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "23"
			"plane" "(-8 8 7) (-8 8 -7) (-7 8 -7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "22"
			"plane" "(-7 -8 -7) (-8 -8 -7) (-8 -8 7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "21"
			"plane" "(-7 -8 7) (-8 -8 7) (-8 8 7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 -1 0 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "20"
			"plane" "(-7 8 -7) (-8 8 -7) (-8 -8 -7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 -1 0 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "19"
			"plane" "(-7 8 7) (-7 8 -7) (-7 -8 -7)"
			"material" "HALFLIFE/BLACK"
			"uaxis" "[0 1 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
	}
	solid
	{
		"id" "12"
		side
		{
			"id" "30"
			"plane" "(8 8 7) (8 8 -7) (8 -8 -7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[0 1 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "29"
			"plane" "(7 8 -7) (8 8 -7) (8 8 7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "28"
			"plane" "(8 -8 7) (8 -8 -7) (7 -8 -7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "27"
			"plane" "(7 8 7) (8 8 7) (8 -8 7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 -1 0 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "26"
			"plane" "(7 -8 -7) (8 -8 -7) (8 8 -7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 -1 0 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "25"
			"plane" "(7 -8 7) (7 -8 -7) (7 8 -7)"
			"material" "HALFLIFE/BLACK"
			"uaxis" "[0 1 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
	}
	solid
	{
		"id" "14"
		side
		{
			"id" "36"
			"plane" "(-7 8 -7) (7 8 -7) (7 8 7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "35"
			"plane" "(-7 7 7) (-7 8 7) (7 8 7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 -1 0 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "34"
			"plane" "(7 8 -7) (-7 8 -7) (-7 7 -7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 -1 0 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "33"
			"plane" "(-7 7 -7) (-7 8 -7) (-7 8 7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[0 1 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "32"
			"plane" "(7 8 7) (7 8 -7) (7 7 -7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[0 1 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "31"
			"plane" "(7 7 -7) (-7 7 -7) (-7 7 7)"
			"material" "HALFLIFE/BLACK"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
	}
	solid
	{
		"id" "16"
		side
		{
			"id" "42"
			"plane" "(7 -8 -7) (-7 -8 -7) (-7 -8 7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "41"
			"plane" "(7 -8 7) (-7 -8 7) (-7 -7 7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 -1 0 4] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "40"
			"plane" "(-7 -7 -7) (-7 -8 -7) (7 -8 -7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 -1 0 4] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "39"
			"plane" "(-7 -8 7) (-7 -8 -7) (-7 -7 -7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[0 1 0 -4] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "38"
			"plane" "(7 -7 -7) (7 -8 -7) (7 -8 7)"
			"material" "TOOLS/TOOLSNODRAW"
			"uaxis" "[0 1 0 -4] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
		side
		{
			"id" "37"
			"plane" "(-7 -7 -7) (7 -7 -7) (7 -7 7)"
			"material" "HALFLIFE/BLACK"
			"uaxis" "[1 0 0 0] 0.25"
			"vaxis" "[0 0 -1 0] 0.25"
			"rotation" "0"
			"lightmapscale" "16"
			"smoothing_groups" "0"
		}
	}
}
]])

end

function GenerateVMFEssentialEnts(file)
-- EP2 Is supposed to dump you in 0 0 0 if there's no start ent
-- But I keep this just in case
--[[
entity
{
	"classname" "info_player_start"
	"origin" "0 0 0"
	"angles" "0 0 0"
}
]]
	file:write([[
entity
{
	"classname" "logic_auto"
	"spawnflags" "0"
	connections
	{
		"OnMapSpawn" "]]..GOT'blackfade'..[[,Fade,,0,-1"
		"OnMapSpawn" "]]..GOT'clcmd'..[[,Command,sv_cheats 1,0,-1"
		"OnMapSpawn" "]]..GOT'clcmd'..[[,Command,sv_allow_wait_command 1,0,-1"
		"OnLoadGame" "]]..GOT'currentscene'..[[,FireUser3,,0,-1"
		"OnNewGame" "]]..GOT'ui'..[[,Activate,!player,0,-1"
		"OnNewGame" "]]..GOT'loc_start'..[[,FireUser1,,2,-1"
		"OnNewGame" "]]..GOT't_ui_cmp'..[[,ForceSpawn,,0,-1"
	}
	"origin" "0 0 0"
}
entity
{
	"classname" "env_fade"
	"duration" "0"
	"holdtime" "0"
	"renderamt" "255"
	"rendercolor" "0 0 0"
	"spawnflags" "8"
	"targetname" "]]..GOT'blackfade'..[["
	"origin" "0 0 0"
}
entity
{
	"classname" "point_clientcommand"
	"targetname" "]]..GOT'clcmd'..[["
	"origin" "0 0 0"
}
entity
{
	"classname" "light"
	"origin" "0 0 0"
}
entity
{
	"classname" "game_ui"
	"targetname" "]]..GOT'ui'..[["
	"origin" "0 0 0"
	"FieldOfView" "-1.0"
	"spawnflags" "96"
	connections
	{
		"XAxis" "]]..GOT'ui_cmp_x'..[[,SetValueCompare,,0,-1"
		"YAxis" "]]..GOT'ui_cmp_y'..[[,SetValueCompare,,0,-1"
]]..--		"PlayerOn" "]]..GOT'veh'..[[,EnterVehicleImmediate,,0,-1"
[[		"PlayerOn" "]]..GOT'clcmd'..[[,Command,give point_viewcontrol;ent_fire point_viewcontrol enable,0,-1"
	}
}
entity
{
	"classname" "logic_compare"
	"targetname" "]]..GOT'ui_cmp_x'..[["
	"origin" "0 0 0"
	"CompareValue" "0"
	"InitialValue" "0"
}
entity
{
	"classname" "logic_compare"
	"targetname" "]]..GOT'ui_cmp_y'..[["
	"origin" "0 0 0"
	"CompareValue" "0"
	"InitialValue" "0"
}
entity
{
	"classname" "point_template"
	"targetname" "]]..GOT't_ui_cmp'..[["
	"origin" "0 0 0"
	"spawnflags" "2"
	"Template01" "]]..GOT'ui_cmp_x'..[["
	"Template02" "]]..GOT'ui_cmp_y'..[["
	connections
	{
		"OnUser1" "]]..GOT'ui_cmp_x'..[[,Kill,,-1,-1"
		"OnUser1" "]]..GOT'ui_cmp_y'..[[,Kill,,-1,-1"
		"OnUser1" "!self,ForceSpawn,,0,-1"
	}
}

entity
{
	"classname" "game_text"
	"targetname" "]]..GOT'clean1'..[["
	"origin" "0 0 0"
	"message" " "
	"channel" "1"
	"color" "255 255 255"
	"color2" "100 240 200"
	"effect" "2"
	"spawnflags" "1"
	"fadein" "]]..tostring(charfadetime)..[["
	"fadeout" "0"
	"fxtime" "0.25"
	"holdtime" "0"
	"x" "0"
	"y" "0"
}
entity
{
	"classname" "game_text"
	"targetname" "]]..GOT'clean2'..[["
	"origin" "0 0 0"
	"message" " "
	"channel" "2"
	"color" "255 255 255"
	"color2" "100 240 200"
	"effect" "2"
	"spawnflags" "1"
	"fadein" "]]..tostring(charfadetime)..[["
	"fadeout" "0"
	"fxtime" "0.25"
	"holdtime" "0"
	"x" "0"
	"y" "0"
}
entity
{
	"classname" "game_text"
	"targetname" "]]..GOT('credits_text')..[["
	"origin" "0 0 0"
	"message" "]].."Micro Adventure\nmade for RTSL 1 Billion Units EMC\nby krassell\n\nAdditional self-imposed challenges:\nMap fits in 16x16x16: ✓\nDon't use Hammer: ✓\n\nThanks for playing!"..[["
	"channel" "3"
	"color" "255 255 255"
	"color2" "100 240 200"
	"effect" "2"
	"spawnflags" "1"
	"fadein" "]]..tostring(charfadetime)..[["
	"fadeout" "0.5"
	"fxtime" "0.25"
	"holdtime" "10"
	"x" "-1"
	"y" "-1"
	connections
	{
		"OnUser1" "!self,Display,,0,1"
		"OnUser1" "]]..GOT'clcmd'..[[,Command,disconnect; startupmenu,15,1"
		"OnUser1" "]]..GOT'clcmd'..[[,Command,play ambient/levels/citadel/stalk_traindooropen.wav;playsoundscape ep2_forest.light_forest,0,1"
	}
}

]])
--[==[
entity
{
	"vehiclescript" "scripts/vehicles/choreo_vehicle_ep2_playertrapped.txt"
	"targetname" "]]..GOT'veh'..[["
	"solid" "6"
	"origin" "0 0 0"
	"model" "models/ghostanim.mdl"
	"ignoreplayer" "1"
	"fadescale" "1"
	"fademindist" "-1"
	"angles" "0 0 0"
	"actionScale" "1"
	"classname" "prop_vehicle_choreo_generic"
}

]==]
end
-- models/ghostanim.mdl
-- models/weapons/w_pistol.mdl
--models/gibs/hgibs.mdl
--	"model" "models/vehicles/vehicle_blackout_e1_dogintro.mdl"

--[[




coast.bridge_ambient
coast.general_oldwoodbuilding_with_windchimes - has waves
coast.general_tunnel - windy tunnel

ep2_silo.concretehall - small electrically humming concrete area/corridor


silo_garage_1 - inside junkyard
]]








--[[
	['locname'] = {
		desc = "multi\nline\ndescription",
		w = {desc = "description of w action", target = "name_of_node_which_you_visit_by_pressing_w"}, -- Not mandatory, but at least one should exist
		a = same, 
		s = same, 
		d = same, 
		triggersetvalue = {"name_of_value"}, -- Not mandatory, sets value 1 for these when this node is visited (Will fire GOT('name_of_value') SetValue 1 On user1)
		triggerconcmd = "", -- console command to trigger when entering this node

		-- OR -- (creates homogenous logic_branch)
		 (GOTTA HAVE BOTH OF THOSE!)
		valuetrue = "name_of_node_to_trigger_if_value_is_true"
		valuefalse = "name_of_node_to_trigger_if_value_is_true"


	},
]]



local questtree = {
-- Start, rocks and road
	['loc_start'] = {
		desc = 	"It has been 4 hours already. The sun is beating down\n"..
				"mercilessly and the rocks I sit on are close to searing hot.\n"..
				"Looks like courier won't show up anytime soon...\n\n"..
				--"And with him vanish last chances to get down from this plateau nice and easy.",
				"There go my last chances to leave plateau nice and easy.",
		w = {desc = "Climb down", target = "loc_rocks"},
		triggerconcmd = "playsoundscape adv.desert",
	},
	['loc_rocks'] = {
		desc = "I stand near the rocks I've been sitting on\n"..
			   "not that long ago. In the distance a road can\n"..
			   "be seen snaking between dunes.",
		w = {desc = "Head towards road", target = "loc_road"},
		triggerconcmd = "playsoundscape adv.desert",
	},
	['loc_road'] = {
		desc = 	"Winding road half-buried in sand is stretching\n"..
				"from one horizon to another. If memory serves,\n"..
				"it leads from Fortified Junkyard to Crossroads.",
		w = {desc = "Head out towards Crossroads", target = "loc_road2"},
		s = {desc = "Head towards Fortified Junkyard", target = "loc_junk_check"},
		d = {desc = "Head to pile of rocks", target = "loc_rocks"},
		triggerconcmd = "playsoundscape adv.desert",
	},
	['loc_road2'] = {
		desc = 	"The road from Fortified Junkyard continues off\n"..
				"in the distance, with Crossroads signs barely\n"..
				"visible behind sands. Abandoned and decrepit house\n"..
				"is located to the side of the road.",
		w = {desc = "Head out toward Crossroads", target = "loc_crossroads"},
		s = {desc = "Head towards Fortified Junkyard", target = "loc_road"},
		a = {desc = "Head to the old house", target = "loc_eeriehouse_porch_unlocked_check"},
		triggerconcmd = "playsoundscape adv.desert",
	},


-- Eerie house

	['loc_eeriehouse_porch_unlocked_check'] = { -- was unlocked?
		valuetrue = "loc_eeriehouse_porch_unlocked",
		valuefalse = "loc_eeriehouse_porch_key_check",
	},

	['loc_eeriehouse_porch_cutter_check'] = { -- has the bolt cutter?
		valuetrue = "loc_eeriehouse_porch_locked_cutter",
		valuefalse = "loc_eeriehouse_porch_locked",
	},	

	['loc_eeriehouse_porch_key_check'] = { -- has the key
		valuetrue = "loc_eeriehouse_porch_locked_key",
		valuefalse = "loc_eeriehouse_porch_cutter_check",
	},	

	['loc_eeriehouse_porch_locked'] = {
		desc = 	"The abandoned wooden house presents unwelcome sight with\n"..
				"barred windows and sharp splinters. The wood was once painted\n"..
				"red but has been sun-bleached since then.\n"..
				"The front door is adorned with large padlock.",
		s = {desc = "Head towards road", target = "loc_road2"},
		triggerconcmd = "playsoundscape adv.desert",
	},

	['loc_eeriehouse_porch_locked_cutter'] = {
		desc = 	"The abandoned wooden house presents unwelcome sight with\n"..
				"barred windows and sharp splinters. The wood was once painted\n"..
				"red but has been sun-bleached since then.\n"..
				"The front door is adorned with large padlock.",
		w = {desc = "Use bolt cutter", target = "loc_eeriehouse_porch_cutter_fail"},
		s = {desc = "Head towards road", target = "loc_road2"},
		triggerconcmd = "playsoundscape adv.desert",
	},

	['loc_eeriehouse_porch_locked_key'] = {
		desc = 	"The abandoned wooden house presents unwelcome sight with\n"..
				"barred windows and sharp splinters. The wood was once painted\n"..
				"red but has been sun-bleached since then.\n"..
				"The front door is adorned with large padlock.",
		w = {desc = "Use key", target = "loc_eeriehouse_porch_usekey"},
		d = {desc = "Use bolt cutter", target = "loc_eeriehouse_porch_cutter_fail"},
		s = {desc = "Head towards road", target = "loc_road2"},
		triggerconcmd = "playsoundscape adv.desert",
	},

	['loc_eeriehouse_porch_cutter_fail'] = {
		desc = 	"This padlock is made from steel that this cutter\n"..
				"cannot cut through. After several minutes of exertion\n"..
				"cutter barely scratched the lock!",
		w = {desc = "Continue", target = "loc_eeriehouse_porch_unlocked_check"},
		triggerconcmd = "playsoundscape adv.desert",
	},

	['loc_eeriehouse_porch_usekey'] = {
		desc = 	"After some fumbling I successfully unlock\n"..
				"the big padlock!",
		w = {desc = "Continue", target = "loc_eeriehouse_porch_unlocked_check"},
		triggerconcmd = "playsoundscape adv.desert",
		triggersetvalue = {'loc_eeriehouse_porch_unlocked_check'}
	},



	['loc_eeriehouse_porch_unlocked'] = {
		desc = 	"The abandoned wooden house presents unwelcome sight with\n"..
				"barred windows and sharp splinters. The wood was once painted\n"..
				"red but has been sun-bleached since then.\n"..
				"The front door is unlocked now.",
		w = {desc = "Go inside", target = "loc_eeriehouse_hall"},
		s = {desc = "Head towards road", target = "loc_road2"},
		triggerconcmd = "playsoundscape adv.desert",
	},

	['loc_eeriehouse_hall'] = {
		desc = 	"I'm standing in the hall of this house. Everything\n"..
				"is covered in thick sheet of dust.",
		w = {desc = "Go to living room", target = "loc_eeriehouse_livingroom"},
		a = {desc = "Go into the corridor", target = "loc_eeriehouse_longcorridor_check"},
		s = {desc = "Head outside", target = "loc_road2"},
		d = {desc = "Go inside bedroom", target = "loc_eeriehouse_bedroom"},
		triggerconcmd = "playsoundscape adv.eerie_house",
	},

	['loc_eeriehouse_livingroom'] = {
		desc = 	"Living room lacks any furniture; Wooden floor is\n"..
				"covered with sheets of polyethylene. Various\n"..
				"small pieces of cardboard are lying on the floor.",
		a = {desc = "Go to corridor", target = "loc_eeriehouse_longcorridor_check"},
		s = {desc = "Go back to hall", target = "loc_eeriehouse_hall"},
		d = {desc = "Go to kitchen", target = "loc_eeriehouse_kitchen"},
		triggerconcmd = "playsoundscape adv.eerie_house",
	},

	['loc_eeriehouse_bedroom'] = {
		desc = 	"Bedroom doesn't contain anything but the bed and mattress\n"..
				"strewn on the floor. All other furniture is absent.",
		s = {desc = "Go back to hall", target = "loc_eeriehouse_hall"},
		triggerconcmd = "playsoundscape adv.eerie_house",
	},

	['loc_eeriehouse_kitchen'] = {
		desc = 	"Kitchen is barely lit by light getting through barred\n"..
				"windows. Furniture is mostly intact, including massive stove.\n"..
				"I can see something written in permanent marker on one of tiles.",
		w = {desc = "Investigate writing", target = "loc_eeriehouse_kitchen_writing"},
		s = {desc = "Go back to living room", target = "loc_eeriehouse_livingroom"},
		triggerconcmd = "playsoundscape adv.eerie_house",
	},

	['loc_eeriehouse_kitchen_writing'] = {
		desc = 	"The writing on the ceramic tile simply states:\n"..
				"BEYOND",
		s = {desc = "Go back", target = "loc_eeriehouse_kitchen"},
		triggerconcmd = "playsoundscape adv.eerie_house",
		triggersetvalue = {'loc_eeriehouse_longcorridor_check'},
	},


	['loc_eeriehouse_longcorridor_check'] = { -- hit hidden even in kitchen
		valuetrue = "loc_eeriehouse_longcorridor2",
		valuefalse = "loc_eeriehouse_longcorridor",
	},	


	['loc_eeriehouse_longcorridor'] = {
		desc = 	"This long corridor goes along entirety of the house wall.\n"..
				"Judging by wallpaper discoloration there used to be paintings\n"..
				"on the wall...",
		w = {desc = "Go to the living room", target = "loc_eeriehouse_livingroom"},
		s = {desc = "Go to the hall", target = "loc_eeriehouse_hall"},
		triggerconcmd = "playsoundscape adv.eerie_house",
	},
	['loc_eeriehouse_longcorridor2'] = {
		desc = 	"This long corridor goes along entirety of the house wall.\n"..
				"Judging by wallpaper discoloration there used to be paintings\n"..
				"on the wall...\n"..
				"Wait, was this door here before?",
		w = {desc = "Go to the living room", target = "loc_eeriehouse_livingroom"},
		a = {desc = "Go inside door", target = "loc_eeriehouse2_infcorridordoor"},
		s = {desc = "Go to the hall", target = "loc_eeriehouse_hall"},
		triggerconcmd = "playsoundscape adv.eerie_house",
	},



	['loc_eeriehouse2_infcorridordoor'] = { -- where you can still see door
		desc = 	"This corridor goes away in darkness.\n"..
				"By any account, it is considerably longer than the house.",
		w = {desc = "Go forward", target = "loc_eeriehouse2_infcorridor2"},
		s = {desc = "Go back through the door", target = "loc_eeriehouse_longcorridor_check"},
		triggerconcmd = "playsoundscape adv.eerie_house_creepy",
	},


	['loc_eeriehouse2_infcorridor2'] = { -- where you can't
		desc = 	"This corridor goes on forever!",
		w = {desc = "Go forward", target = "loc_eeriehouse2_infcorridor1"},
		s = {desc = "Go back", target = "loc_eeriehouse2_infcorridor1"},
		triggerconcmd = "playsoundscape adv.eerie_house_creepy",
	},

	['loc_eeriehouse2_infcorridor1'] = {
		desc = 	"This corridor just keeps going, huh?\n"..
				"I can see some dim light at the end of it.",
		w = {desc = "Go towards lit area", target = "loc_eeriehouse2_longcorridor"},
		s = {desc = "Go into dark corridor", target = "loc_eeriehouse2_infcorridor2"},
		triggerconcmd = "playsoundscape adv.eerie_house_creepy",
	},



	['loc_eeriehouse2_livingroom_check'] = { -- STOLED the acet-oxy burner
		valuetrue = "loc_eeriehouse2_livingroom_looted",
		valuefalse = "loc_eeriehouse2_livingroom",
	},	

	['loc_eeriehouse2_livingroom'] = {
		desc = 	"Living room is very dimly lit. Wooden floor is\n"..
				"covered with sheets of polyethylene. I can barely\n"..
				"see figures on the floor.",
		w = {desc = "Investigate", target = "loc_eeriehouse2_livingroom_inv"},
		a = {desc = "Go to corridor", target = "loc_eeriehouse2_bedroom"},
		s = {desc = "Go back to hall", target = "loc_eeriehouse2_kitchen"},
		d = {desc = "Go to kitchen", target = "loc_eeriehouse2_longcorridor"},
		triggerconcmd = "playsoundscape adv.eerie_house_creepy",
	},

	['loc_eeriehouse2_livingroom_inv'] = {
		desc = 	"It's what remains of the exploration team - several\n"..
				"dessicated corpses. Appears to be death by dehydration.\n"..
				"Every battery is dry as desert, but one of them has\n"..
				"acetylene oxygen gas burner, which I take.",
		w = {desc = "Continue", target = "loc_eeriehouse2_livingroom_check"},
		triggerconcmd = "playsoundscape adv.eerie_house_creepy",
		triggersetvalue = {'loc_eeriehouse2_livingroom_check','loc_bunker_exit_burner_check'}
	},

	['loc_eeriehouse2_livingroom_looted'] = {
		desc = 	"Living room is very dimly lit. Wooden floor is\n"..
				"covered with sheets of polyethylene. I can barely\n"..
				"see corpses on the floor.",
		a = {desc = "Go to corridor", target = "loc_eeriehouse2_bedroom"},
		s = {desc = "Go back to hall", target = "loc_eeriehouse2_kitchen"},
		d = {desc = "Go to kitchen", target = "loc_eeriehouse2_longcorridor"},
		triggerconcmd = "playsoundscape adv.eerie_house_creepy",
	},




	['loc_eeriehouse2_hall'] = {
		desc = 	"I'm standing in barely-lit hall of this house. Everything\n"..
				"is covered in thick sheet of dust.",
		w = {desc = "Go to living room", target = "loc_eeriehouse2_kitchen"},
		a = {desc = "Go into the corridor", target = "loc_eeriehouse_longcorridor_check"},
		s = {desc = "Head outside", target = "loc_eeriehouse2_bedroom"},
		d = {desc = "Go inside bedroom", target = "loc_eeriehouse2_kitchen"},
		triggerconcmd = "playsoundscape adv.eerie_house_creepy",
	},

	['loc_eeriehouse2_bedroom'] = {
		desc = 	"By touch I can deduce that pitch-black Bedroom\n"..
				"doesn't contain anything but the bed and mattress\n"..
				"strewn on the floor. All other furniture is absent.",
		s = {desc = "Go back to hall", target = "loc_eeriehouse2_livingroom_check"},
		triggerconcmd = "playsoundscape adv.eerie_house_creepy",
	},

	['loc_eeriehouse2_kitchen'] = {
		desc = 	"Kitchen is so dark, you can suspect Grue to be hiding in fridge.\n"..
				"Furniture is mostly intact, including massive stove.",
		s = {desc = "Go back to living room", target = "loc_eeriehouse2_livingroom_check"},
		triggerconcmd = "playsoundscape adv.eerie_house_creepy",
	},

	['loc_eeriehouse2_longcorridor'] = {
		desc = 	"This dimly-lit long corridor goes along entirety of the house wall.\n"..
				"Judging by wallpaper discoloration there used to be paintings\n"..
				"on the wall...\n",
		w = {desc = "Go to the living room", target = "loc_eeriehouse2_kitchen"},
		a = {desc = "Go inside door", target = "loc_eeriehouse2_infcorridor1"},
		s = {desc = "Go to the hall", target = "loc_eeriehouse2_hall"},
		triggerconcmd = "playsoundscape adv.eerie_house_creepy",
	},





-- Fortified Junkyard
	['loc_junk_check'] = {
		valuetrue = "loc_junkopen",
		valuefalse = "loc_junkclosed",
	},	
	['loc_junkclosed'] = {
		desc = 	"Tall haphazardly-constructed metal wall with rare\n"..
				"lookout towers blocks the way. There should be a gate\n"..
				"leading inside here, but it's closed flush with wall.\n"..
				"No wonder - Junkyard dwellers don't take well to outsiders.",
		d = {desc = "Go along the wall", target = "loc_junk_boltcutters_check"},
		s = {desc = "Head back down the road", target = "loc_road"},
		triggerconcmd = "playsoundscape adv.fortifiedjunkyard_wall",
	},
	['loc_junkopen'] = {
		desc = 	"Fortified Junkyard's wall welcomes me with front gate\n"..
				"open wide, gaping like shark maw, menacing with sharp metal.\n"..
				"Looks like I'm a honorary guest now!",
		w = {desc = "Head inside", target = "loc_junkinside"},
		s = {desc = "Head back down the road", target = "loc_road"},
		d = {desc = "Go along the wall", target = "loc_junk_boltcutters_check"},
		triggerconcmd = "playsoundscape adv.fortifiedjunkyard_wall",
	},
	['loc_junk_boltcutters_check'] = { -- Got boltcutters?
		valuetrue = "loc_junkboring",
		valuefalse = "loc_junkfoundboltcutters",
	},	
	['loc_junkboring'] = {
		desc = 	"I circle around the wall but I find nothing except more sand and metal.",
		d = {desc = "Go back to entrance", target = "loc_junk_check"},
		triggerconcmd = "playsoundscape adv.fortifiedjunkyard_wall",
	},
	['loc_junkfoundboltcutters'] = {
		desc = 	"As I make my way around the wall I stumble upon\n"..
				"crudely-made bolt cutter. Do I take it?",
		w = {desc = "Take bolt cutter", target = "loc_junktakenboltcutters"},
		s = {desc = "Go back to entrance", target = "loc_junk_check"},
		triggerconcmd = "playsoundscape adv.fortifiedjunkyard_wall",
	},
	['loc_junktakenboltcutters'] = {
		desc = 	"Let's hope it's owner won't miss it...",
		d = {desc = "Go back to entrance", target = "loc_junk_check"},
		triggerconcmd = [[play physics/metal/weapon_footstep1.wav; playsoundscape adv.fortifiedjunkyard_wall]],
		triggersetvalue = {'loc_junk_boltcutters_check','loc_dishes_trash_boltcutters_check','loc_eeriehouse_porch_cutter_check'}
	},

--[[
	-- TODO: MOVE & RENAME
	['__BOLTCHECK2'] = { -- Got boltcutters?
		valuetrue = "loc_junkboring",
		valuefalse = "loc_junkfoundboltcutters",
	},	
]]


	['loc_junkinside'] = {
		--[[desc = 	"On the inside Fortified Junkyard has enormous pit filled with garbage.\n"..
				"Putrid stench hits harder than a nightstick.\n"..
				"Above the pit an entire city is built haphazardly on metal struts and platforms,\n"..
				"but one ugly giant building dominates the landscape - the Sultan's Palace.",]]
		desc = 	"On the inside Fortified Junkyard has enormous garbage pit,\n"..
				"with entire city around it on metal struts and platforms.\n"..
				"Putrid stench hits harder than a nightstick.\n"..
				"Biggest and ugliest house got to be the Sultan's Palace.",

		w = {desc = "Go inside Sultan's palace", target = "loc_junkinside_talked_to_sultan_check"},
		s = {desc = "Leave Fortified Junkyard", target = "loc_junk_check"},
		d = {desc = "Walk around", target = "loc_junkinside_walkfail"},
		triggerconcmd = "playsoundscape silo_garage_1",
	},

	['loc_junkinside_walkfail'] = {
		desc = 	"I go on a sight-seeing walk, but it appears that locals refuse to deal\n"..
				"with outsiders, and city itself is nothing but metal plastered on more metal.\n"..
				"I guess I'll have to return to main square empty-handed.",
		d = {desc = "Go back", target = "loc_junkinside"},
		triggerconcmd = "playsoundscape silo_garage_1",
	},


	['loc_junkinside_talked_to_sultan_check'] = { -- had the 'talk'
		valuetrue = "loc_junkinside_sultanpalace",
		valuefalse = "loc_junkinside_sultanpalace_sultantalk",
	},	

	-- TODO: Getting the keycard from Sultan
	['loc_junkinside_gotmicro_check'] = { -- got microscope?
		valuetrue = "loc_junkinside_sultanpalace_pile_exchange_gotmicro",
		valuefalse = "loc_junkinside_sultanpalace_pile_exchange_nomicro",
	},

	['loc_junkinside_exchanged_micro'] = { -- changed microscope to statuette?
		valuetrue = "loc_junkinside_sultanpalace_pile_micro",
		valuefalse = "loc_junkinside_sultanpalace_pile_statuette",
	},

	['loc_junkinside_sultanpalace'] = {
		desc = 	"I enter Sultan's palace, guards see Honorary Guest Ribbon\n"..
				"and let me in. The main room is long enough to run through\n"..
				"entire palace, and has a giant moat in the middle filled\n"..
				"with untold riches and garbage alike.",
		w = {desc = "Continue", target = "loc_junkinside_exchanged_micro"},
		triggerconcmd = "playsoundscape silo_garage_1",
	},

	['loc_junkinside_sultanpalace_sultantalk'] = {
--[[		desc = 	"I enter Sultan's palace, guards dispersing as soon as they see my\n"..
				"Honorary Guest Ribbon. The palace's main room is long enough to run\n"..
				"through entire palace, and has a giant moat in the middle filled\n"..
				"with untold riches and garbage alike.",]]
		desc = 	"I enter Sultan's palace, guards see Honorary Guest Ribbon\n"..
				"and let me in. The main room is long enough to run through\n"..
				"entire palace, and has a giant moat in the middle filled\n"..
				"with untold riches and garbage alike.",
		w = {desc = "Continue", target = "loc_junkinside_sultanpalace_sultantalk2"},
		triggerconcmd = "playsoundscape silo_garage_1",
	},
	['loc_junkinside_sultanpalace_sultantalk2'] = {
		desc = 	"At my sight Sultan leans over to the left and whispers something\n"..
				"to one of his underlings. Underling steps forward and declares:\n"..
				"'Sultan would like to know how you obtained this ribbon'\n"..
				"Uh-oh.",
		w = {desc = "[LIE] I found it", target = "loc_junkinside_sultanpalace_sultantalk3"},
		s = {desc = "[TRUTH] I won it in poker", target = "loc_junkinside_sultanpalace_sultantalk3"},
		a = {desc = "[SARCASM] I 'found' it", target = "loc_junkinside_sultanpalace_sultantalk3"},
		d = {desc = "Attempt to distract him", target = "loc_junkinside_sultanpalace_sultantalk3"},
		triggerconcmd = "playsoundscape silo_garage_1",
	},
	['loc_junkinside_sultanpalace_sultantalk3'] = {
		desc = 	"Before I can do anything, one of Sultan's servants takes\n"..
				"me aside and explains that Sultan can be forgetful due\n"..
				"to considerable age and further reminding him of this fact\n"..
				"would be... unwise.",
		w = {desc = "Continue", target = "loc_junkinside_sultanpalace_sultantalk4"},
		triggerconcmd = "playsoundscape silo_garage_1",
	},
	['loc_junkinside_sultanpalace_sultantalk4'] = {
		desc = 	"He recommends saying that it was so long ago that I myself\n"..
				"can barely remember that.\n\n"..
				"And so I do.",
		w = {desc = "Continue", target = "loc_junkinside_sultanpalace_sultantalk5"},
		triggerconcmd = "playsoundscape silo_garage_1",
	},
	['loc_junkinside_sultanpalace_sultantalk5'] = {
		desc = 	"I can see Sultan slowly nodding at my answer and focusing his attention elsewhere.\n\n"..
				"It seems to have worked. Phew!",
		w = {desc = "Continue", target = "loc_junkinside_exchanged_micro"},
		triggersetvalue = {'loc_junkinside_talked_to_sultan_check',},--loc_junkinside_talked_to_sultan_check
		triggerconcmd = "playsoundscape silo_garage_1",
	},
	-- This could use 'walk around/look around' state
	['loc_junkinside_sultanpalace_pile_statuette'] = {
		desc = 	"I suddenly notice the statuette that was to be delivered to me,\n"..
				"lying amidst Sultan's treasure.",
		w = {desc = "Demand statuette", target = "loc_junkinside_gotmicro_check"},
		s = {desc = "Leave", target = "loc_junkinside"},
		triggerconcmd = "playsoundscape silo_garage_1",
	},

	['loc_junkinside_sultanpalace_pile_micro'] = {
		desc = 	"I notice microscope I fished out of overgrown trashbin not\n"..
				"so long ago, placed in what appears to be precisely same place\n"..
				"where statuette resided before exchange. Huh.",
		w = {desc = "Leave", target = "loc_junkinside"},
		triggerconcmd = "playsoundscape silo_garage_1",
	},

	['loc_junkinside_sultanpalace_pile_exchange_gotmicro'] = {
		desc = 	"Sultan listens to my explanation, nods, but\n"..
				"points out that he'd like get something in exchange",
		w = {desc = "Give him a shiny microscope", target = "loc_junkinside_sultanpalace_pile_exchangedmicro"},
		s = {desc = "Leave", target = "loc_junkinside"},
		triggerconcmd = "playsoundscape silo_garage_1",
	},
	['loc_junkinside_sultanpalace_pile_exchange_nomicro'] = {
		desc = 	"Sultan listens to my explanation, nods, but\n"..
				"points out that he'd like get something in exchange",
		s = {desc = "Leave", target = "loc_junkinside"},
		triggerconcmd = "playsoundscape silo_garage_1",
	},

	['loc_junkinside_sultanpalace_pile_exchangedmicro'] = {
		desc = 	"Sultan is pleased with exchange, and some servant\n"..
				"retrieves the statuette and gives it to me.\n"..
				"I examine it; it appears to be intact, which\n"..
				"means that key card is safe inside.\n\n"..
				"I'll need some tools to get it out, though.",
		s = {desc = "Leave", target = "loc_junkinside"},
		triggerconcmd = "playsoundscape silo_garage_1",
		triggersetvalue = {'loc_junkinside_exchanged_micro','loc_dishes_inside_aaron_gotstatuette_check','loc_dishes_inside_workbench_gotstatuette_check'}
	},



-- Crossroads
	['loc_crossroads'] = {
		desc =  "Four roads meet here, at the point nicely signposted\n"..
				"by bunch of dead grass and plethora of roadsigns of varying\n"..
				"usefulness pointing in all sorts of directions barring those of roads.",
		w = {desc = "Venture forth into Antlion Valley", target = "loc_antlionguardfight_check"},
		a = {desc = "Go in direction of Radar Dish Array", target = "loc_dishes_outside"},
		s = {desc = "Go towards Fortified Junkyard", target = "loc_road2"},
		d = {desc = "Head out to the chasm", target = "loc_chasmroad"},
		triggerconcmd = "playsoundscape adv.desert",
	},

-- Rusted Radar Dishes

	['loc_dishes_outside'] = {
		desc =  "I stand beside long building above which perches an array of immense radio telescopes.\n"..
				"Number of those telescopes is in visible disrepair.\n"..
				"Strange buzz permeates the premises, apparently originating from building itself.",
		w = {desc = "Go inside the building", target = "loc_dishes_inside"},
		s = {desc = "Go towards Crossroads", target = "loc_crossroads"},
		d = {desc = "Go behind the radar building", target = "loc_dishes_trash_looted_check"},
		triggerconcmd = "playsoundscape adv.radararray_outside",
	},

	['loc_dishes_trash_looted_check'] = { -- Already taken
		valuetrue = "loc_dishes_trash_looted",
		valuefalse = "loc_dishes_trash_boltcutters_check",
	},	

	['loc_dishes_trash_boltcutters_check'] = { -- Got boltcutters?
		valuetrue = "loc_dishes_trash_havecutters",
		valuefalse = "loc_dishes_trash_no_dice",
	},	

	['loc_dishes_trash_havecutters'] = {
		desc =  "Behind the building, tucked away between wall and a cliff\n"..
				"stands what appears to be industrial refuse container.\n"..
				"Seriousness of this overgrown trashcan is stressed by\n"..
				"a small padlock preventing access.",
		w = {desc = "Cut the lock with bolt cutter", target = "loc_dishes_trash_cut_and_loot"},
		s = {desc = "Go back", target = "loc_dishes_outside"},
		triggerconcmd = "playsoundscape adv.radararray_outside",
	},

	['loc_dishes_trash_cut_and_loot'] = {
		desc =  "The bolt cutter does it's job and the lock hits the ground.\n"..
				"And...\n"..
				"There's nothing inside, except small broken microscope!\n"..
				"Annoyed by results I snag the microscope as a consolation prize.",
		s = {desc = "Go back", target = "loc_dishes_outside"},
		triggerconcmd = "playsoundscape adv.radararray_outside",
		triggersetvalue = {'loc_junkinside_gotmicro_check','loc_dishes_trash_looted_check'},
	},

	['loc_dishes_trash_no_dice'] = {
		desc =  "Behind the building, tucked away between wall and a cliff\n"..
				"stands what appears to be industrial refuse container.\n"..
				"Seriousness of this overgrown trashcan is stressed by\n"..
				"a small padlock preventing access.",
		s = {desc = "Go back", target = "loc_dishes_outside"},
		triggerconcmd = "playsoundscape adv.radararray_outside",
	},

	['loc_dishes_trash_looted'] = {
		desc =  "Behind the building, tucked away between wall and a cliff\n"..
				"stands what appears to be industrial refuse container, which\n"..
				"I already looted with... arguable results.",
		s = {desc = "Go back", target = "loc_dishes_outside"},
		triggerconcmd = "playsoundscape adv.radararray_outside",
	},


	['loc_dishes_inside'] = {
		desc =  "Inside buzz picks up in power. Apparently telescopes are still in use.\n"..
				"Engineers quietly argue over some papers covered in arcane formulae.\n"..
				"Aaron's table is near far wall, and there's workbench to the right.",
		w = {desc = "Talk with Aaron", target = "loc_dishes_inside_aaron_gotstatuette_check"},
		s = {desc = "Go outside", target = "loc_dishes_outside"},
		d = {desc = "Go towards the workbench", target = "loc_dishes_inside_workbench_gotstatuette_check"},
		triggerconcmd = "playsoundscape adv.radararray_inside",
	},

	['loc_dishes_inside_aaron_gotstatuette_check'] = { -- Don't hint if statuette is acquired
		valuetrue = "loc_dishes_inside_aaron_talk_gotkey_check",
		valuefalse = "loc_dishes_inside_aaron_deliverytalk_check",
	},

	['loc_dishes_inside_aaron_deliverytalk_check'] = { -- he already had initial talk Why you still here?
		valuetrue = "loc_dishes_aaron_talk_hint_harder",
		valuefalse = "loc_dishes_aaron_talk_stillhere",
	},

	['loc_dishes_inside_aaron_talk_about_burner_check'] = { -- Can I talk about burner yet?
		valuetrue = "loc_dishes_aaron_talk_about_burner",
		valuefalse = "loc_dishes_aaron_blah",
	},

	['loc_dishes_inside_aaron_talk_gotkey_check'] = { -- Got key? Get outta here!
		valuetrue = "loc_dishes_aaron_talk_yougotkeyalready",
		valuefalse = "loc_dishes_inside_aaron_talk_about_burner_check",
	},
	-- ‟”
	['loc_dishes_aaron_talk_hint_harder'] = {
		desc =	"''You'll probably want to check out Fortified Junkyard for stolen goods,\n"..
				"if you can get inside, that is.''",
		s = {desc = "Leave", target = "loc_dishes_inside"},
		triggerconcmd = "playsoundscape adv.radararray_inside",
	},

	['loc_dishes_aaron_blah'] = {
		desc =	"''I'm fine, please go bother someone else,\n"..
				"I got 300-page report on spending to read.'' ",
		s = {desc = "Leave", target = "loc_dishes_inside"},
		triggerconcmd = "playsoundscape adv.radararray_inside",
	},

	['loc_dishes_aaron_talk_stillhere'] = {
		desc =	"''I see you're still here on plateau? Looks like\n"..
				"things didn't go as planned''\n"..
		  		"I explain that delivery didn't reach me.",
		w = {desc = "Continue", target = "loc_dishes_aaron_talk_stillhere2"},
		triggerconcmd = "playsoundscape adv.radararray_inside",
	},

	['loc_dishes_aaron_talk_stillhere2'] = {
		desc =	"''Stolen, likely. I have to lock even trash containers to keep\n"..
				"Junkers' grubby mitts from my stuff. Sneaky bastards.'' ",
		s = {desc = "Leave", target = "loc_dishes_inside"},
		triggerconcmd = "playsoundscape adv.radararray_inside",
		triggersetvalue = {'loc_dishes_inside_aaron_deliverytalk_check'},
	},

	['loc_dishes_aaron_talk_yougotkeyalready'] = {
		desc =  "'You got the key you wanted so hard.'",
		d = {desc = "Leave", target = "loc_dishes_inside"},
		triggerconcmd = "playsoundscape adv.radararray_inside",
	},

	['loc_dishes_aaron_talk_about_burner'] = {
		desc =  "I ask Aaron if he has a gas burner around.\n"..
				"''Well, I'd be happy to give it to ya, but it was with the\n"..
				"expedition that went inside the Old House, and that was\n"..
				"the last we heard of them.''",
		w = {desc = "Continue", target = "loc_dishes_aaron_talk_about_burner2"},
		triggerconcmd = "playsoundscape adv.radararray_inside",
	},

	['loc_dishes_aaron_talk_about_burner2'] = {
		desc =  "After a pause he continues\n"..
				"''After four weeks I locked front door with strongest padlock I could find.\n"..
				"Strangely enough, it keeps it at bay''",
		w = {desc = "I -NEED- that key", target = "loc_dishes_aaron_talk_ineedthatkey"},
		s = {desc = "Go back", target = "loc_dishes_inside"},
		triggerconcmd = "playsoundscape adv.radararray_inside",
	},

	['loc_dishes_aaron_talk_ineedthatkey'] = {
		desc =  "'Damn. You're really sure?..'\n"..
				"'You think I am going to change my mind? Think again.'\n"..
				"'Fine. Just let me find it.'\n"..
				"With some effort Aaron fishes the key out of drawer and hands it to me.",
		s = {desc = "Go back", target = "loc_dishes_inside"},
		triggerconcmd = "playsoundscape adv.radararray_inside",
		triggersetvalue = {'loc_dishes_inside_aaron_talk_gotkey_check','loc_eeriehouse_porch_key_check'}
	},

	['loc_dishes_inside_workbench_gotstatuette_check'] = { -- Got statuette?
		valuetrue = "loc_dishes_inside_workbench_brokenstatuette_check",
		valuefalse = "loc_dishes_inside_workbench",
	},
	['loc_dishes_inside_workbench_brokenstatuette_check'] = { -- Don't allow multibreaking
		valuetrue = "loc_dishes_inside_workbench",
		valuefalse = "loc_dishes_inside_workbench_statuette",
	},

	['loc_dishes_inside_workbench'] = {
		desc =  "A tool lineup hangs on the wall, but the big chunk of tools is missing.\n"..
				"Above the lineup there is a sledgehammer, with faint label\n"..
				"'for finetuning' on the handle.\n"..
				"The workbench itself looks like it has seen better times.",
		s = {desc = "Go back", target = "loc_dishes_inside"},
		triggerconcmd = "playsoundscape adv.radararray_inside",
	},

	['loc_dishes_inside_workbench_statuette'] = {
		desc =  "A tool lineup hangs on the wall, but the big chunk of tools is missing.\n"..
				"Above the lineup there is a sledgehammer, with faint label\n"..
				"'for finetuning' on the handle.\n"..
				"The workbench itself looks like it has seen better times.",
		w = {desc = "Break the statuette", target = "loc_dishes_inside_workbench_statuette_break"},
		s = {desc = "Go back", target = "loc_dishes_inside"},
		triggerconcmd = "playsoundscape adv.radararray_inside",
	},

	['loc_dishes_inside_workbench_statuette_break'] = {
		desc =  "After considering sledgehammer for a minute I break\n"..
				"clay statuette with my hands.\n"..
				"Not that I needed the workbench, but some confidence is always good.\n\n"..
				"I grab the key card to a bunker and tuck it away safely.",
		s = {desc = "Go back", target = "loc_dishes_inside"},
		triggerconcmd = "playsoundscape adv.radararray_inside",
		triggersetvalue = {'loc_dishes_inside_workbench_brokenstatuette_check','loc_bunkerdoor_check'}
	},


-- Antlion Dens + guard 'fight'

	['loc_antlionguardfight_check'] = {
		valuetrue = "loc_antlion_valley",
		valuefalse = "loc_antlionguardfight",
	},	
	['loc_antlionguardfight'] = {
		desc = 	"The way forward is barred by supremely annoyed\n"..
				"antlion guard who continues to shake it's head\n"..
				"and emit low threating growls.\n",
		w = {desc = "Kill it!", target = "loc_antlionguardfight_kill_it"},
		s = {desc = "Slowly back away", target = "loc_crossroads"},
		triggerconcmd = "play npc/antlion_guard/angry1.wav;playsoundscape adv.antlion_mounds",
	},
	['loc_antlionguardfight_kill_it'] = {
		desc = 	"With what?\n"..
				"My bare hands?",
		w = {desc = "Yes", target = "loc_antlionguardfight_beatdown"},
		s = {desc = "Slowly back away", target = "loc_crossroads"},
		triggerconcmd = "playsoundscape adv.antlion_mounds",
	},
	['loc_antlionguardfight_beatdown'] = {
		desc = 	"The antlion guardian goes down in second round\n"..
				"and hits the ground, er, sand with a dull thud.\n"..
				"That's a knockout!",
		w = {desc = "Continue", target = "loc_antlion_valley"},
		-- play ambient/voices/citizen_punches1.wav; wait 200; play ambient/voices/citizen_punches3.wav; wait 200; play npc/antlion_guard/antlion_guard_pain2.wav
		-- play ambient/alarms/train_crossing_bell_loop1.wav; wait 180;play common/null.wav
		triggersetvalue = {"loc_antlionguardfight_check"},
		--triggerconcmd = "playsoundscape adv.antlion_mounds;play ambient/voices/citizen_punches1.wav;wait 200;play ambient/voices/citizen_punches3.wav;wait 200;play npc/antlion_guard/antlion_guard_pain2.wav",
		triggerconcmd = "playsoundscape adv.antlion_mounds;play ambient/voices/citizen_punches1.wav;wait 200;play ambient/voices/citizen_punches3.wav;wait 300;play npc/antlion_guard/antlion_guard_pain2.wav;wait 200;playgamesound NPC_AntlionGuard.Fallover",
	},
	['loc_antlion_valley'] = {
		desc = 	"This road leads straight through Antlion Valley.\n"..
				"While the curious bugs peek out every now and then,\n"..
				"they don't show much courage after such demonstration of\n"..
				"hands-on fisticuffs experience.",--"your handiwork.", -- Guardian beatdown
		w = {desc = "Go further through Valley", target = "loc_barcode_outside"},
		s = {desc = "Head to Crossroads", target = "loc_crossroads"},
		triggerconcmd = "playsoundscape adv.antlion_mounds",
	},

-- Bar C0DE
	
	['loc_barcode_outside'] = {
		desc = 	"Sound of speech and laughter escapes building with\n"..
				 --"a glowing sign that reads ‟Bar C0DE”\n"..
				"a glowing sign that reads 'Bar C0DE'.\n"..
				"This is probably seediest bar around on plateau. And the only one.\n"..
				"A road leading back to Antlion Valley ends here.",
		w = {desc = "Head inside", target = "loc_barcode_inside"},
		--s = {desc = "Head back down the road", target = "loc_junk"},
		d = {desc = "Go into Antlion Valley", target = "loc_antlion_valley"},
		triggerconcmd = "playsoundscape adv.antlion_mounds",
	},
	['loc_barcode_inside'] = {
		desc = 	"No matter how many times I visit, this place still looks\n"..
				"deceptively small from outside.\n"..--" Bartender recognized me and nodded.\n\n"..
				"A short hooded figure with bright ribbon sits alone at closest\n"..
				"table. Must be another Junkyard Emissary.",
		w = {desc = "Head deeper in bar", target = "loc_barcode_inside2"},
		a = {desc = "Approach Junkyard Emissary", target = "loc_barcode_emissary_check"},
		s = {desc = "Head outside", target = "loc_barcode_outside"},
		d = {desc = "Talk to bartender", target = "loc_barcode_bartender"},
		triggerconcmd = "playsoundscape d1_trainstation.Appartments",
	},

	['loc_barcode_bartender'] = {
		desc = 	"'Like the usual?', Bartender asks as he\n"..
				"snags the bottles from stand with habitual finesse,\n"..
				"but I stop him.\n\n"..
				"'Any new faces?'\n\n"..
				"'Only some courier kid, grabbed himself a forty and been quiet since'",
		d = {desc = "Back", target = "loc_barcode_inside"},
		triggerconcmd = "playsoundscape d1_trainstation.Appartments",
	},

	['loc_barcode_emissary_check'] = {
		valuetrue = "loc_barcode_emissary_no_dice",
		valuefalse = "loc_barcode_emissary",
	},	

	['loc_barcode_emissary_no_dice'] = {
		desc = 	"Junkyard Emissary sits at his table, sipping something rancid\n"..
				"from metal cup and eyeing the deck of cards on the table with\n"..
				"visible regret. It looks like he's not going to play poker again anytime soon...",
		s = {desc = "Back", target = "loc_barcode_inside"},
		triggerconcmd = "playsoundscape d1_trainstation.Appartments",
	},
	['loc_barcode_emissary'] = {
		desc = 	"Junkyard Emissary sits at his table, sipping something rancid\n"..
				"from metal cup and eyeing the deck of cards on the table.\n"..
				"The second seat across emissary is not taken.",
		w = {desc = "Play poker with Junkyard Emissary", target = "loc_barcode_emissary_gets_pokerd"},
		s = {desc = "Back", target = "loc_barcode_inside"},
		triggerconcmd = "playsoundscape d1_trainstation.Appartments",
	},
	['loc_barcode_emissary_gets_pokerd'] = {
		desc = 	"Several hands later Emissary is in debt so deep it'd make\n"..
				"Mariana trench look like puddle.\n"..
				"Poor sucker should have invested in Ph.D or at least\n"..
				"Probability theory textbook...",
		w = {desc = "Continue", target = "loc_barcode_emissary_gets_pokerd2"},
		triggerconcmd = "playsoundscape d1_trainstation.Appartments",
	},
	['loc_barcode_emissary_gets_pokerd2'] = {
		desc = 	"I point to his ribbon and explain that I need one of these.\n"..
				"After some deliberation he pulls out a Honorary Guest Ribbon\n"..
				"and tells me that with it I will be allowed inside\n"..
				"the Fortified Junkyard.",
		w = {desc = "Continue", target = "loc_barcode_inside"},
		triggerconcmd = "play foley/vort_beckon_2x.wav; playsoundscape d1_trainstation.Appartments",
		triggersetvalue = {'loc_junk_check','loc_barcode_emissary_check'},
	},

	['loc_barcode_inside2'] = {
		--[[desc = 	"This deep in bar spirit and smoke become a haze.\n"..
				"I can make out a small statuette surrounded by buckets,\n"..
				"a courier hunched over a forty and antlion guardian in the\n"..
				"back corner, staring in fruit cocktail and rubbing hurting mandibles.",]]
		desc = 	"It gets hazy this deep in bar.\n"..
				"I can make out a small statuette surrounded by buckets,\n"..
				"a courier hunched over a forty and antlion guardian in the\n"..
				"back corner, staring in fruit cocktail and rubbing hurting mandibles.",
		w = {desc = "Question courier", target = "loc_barcode_courier"},
		a = {desc = "Approach statuette", target = "loc_barcode_gnome"},
		--s = {desc = "Approach guard", target = "loc_junk"},
		s = {desc = "Head back", target = "loc_barcode_inside"},
		triggerconcmd = "playsoundscape d1_trainstation.Appartments",
	},
	['loc_barcode_courier'] = {
		desc = 	"I barely can make out anything from courier's\n"..
				"inebriate babble, but from the looks of things\n"..
				"the parcel was stolen from him when he climbed on plateau.\n"..
				"That's just swell...",
		w = {desc = "Continue", target = "loc_barcode_inside2"},
		triggerconcmd = "playsoundscape d1_trainstation.Appartments",
	},
	-- CAMEO!
	['loc_barcode_gnome'] = {
		-- desc = 	"The garden gnome statue appears to be motionless, yet\n"..
		-- 		"somehow it inexplicably consumes entire buckets of cheap\n"..
		-- 		"alcohol. The flow of beverage suddenly stops and I feel\n"..
		-- 		"how it begins staring at me intensely with unmoving, unblinking glare.",
		desc = 	"The garden gnome statue seems motionless, yet somehow\n"..
		 		"it inexplicably consumes entire buckets of cheap alcohol.\n"..
		 		"The flow of beverage suddenly stops and I feel\n"..
		 		"how it gazes at me intensely with cold, unblinking glare.",
				--"how it begins staring at me intensely, and yet, none of it's features moved.",
		s = {desc = "Back off", target = "loc_barcode_inside2"},
		triggerconcmd = "playsoundscape automatic",
	},

-- ============================================================================

-- Bunker door in cliff face; chasm
	['loc_chasmroad'] = {
		desc = 	"This road leads from crossroads straight to chasm\n"..
				"I can catch glint of metal bunker door in the cliff\n"..
				"to the left of the road.",
		w = {desc = "Go towards chasm", target = "loc_chasm"},
		a = {desc = "Head towards door", target = "loc_bunkerdoor_approach"},
		s = {desc = "Head to Crossroads", target = "loc_crossroads"},
		triggerconcmd = "playsoundscape adv.desert",
	},
	['loc_chasm'] = {
		desc = 	"The road terminates in steep chasm. There was a way down,\n"..
				"but it ceased to exist after someone decided to hold\n"..
				"Pulse Pogo Deathmatch Tournament there.\n"..
				"One of prime reasons we're stuck on this plateau, really.",
		s = {desc = "Go back", target = "loc_chasmroad"},
		triggerconcmd = "playsoundscape adv.desert",
	},
	['loc_bunkerdoor_approach'] = {
		desc = 	"This part of a cliff would be otherwise unremarkable\n"..
				"if not for narrow bunker door hiding between rocks,\n"..
				"rusty enough to pass for rock.\n"..
				"The key card slot indicator blinks with green every now and then.",
		w = {desc = "Approach bunker door", target = "loc_bunkerdoor_check"},
		s = {desc = "Head towards road", target = "loc_chasmroad"},
		triggerconcmd = "playsoundscape adv.desert",
	},
	['loc_bunkerdoor_check'] = {
		valuetrue = "loc_bunkerdoor_card",
		valuefalse = "loc_bunkerdoor_nocard",
	},
	['loc_bunkerdoor_nocard'] = {
		desc = 	"The narrow bunker door is covered in rust and dust, but the card\n"..
				"reader nearby still shows signs of life.\n"..
				"A key card is the only way in, but I already know that.",
		s = {desc = "Head towards road", target = "loc_chasmroad"},
		triggerconcmd = "playsoundscape adv.desert",
	},
	['loc_bunkerdoor_card'] = {
		desc = 	"The narrow bunker door is covered in rust and dust, but the card\n"..
				"reader nearby still shows signs of life.\n"..
				"Thankfully I do have key card now.",
		w = {desc = "Head inside", target = "loc_bunker_uppercorridor"},
		s = {desc = "Head towards road", target = "loc_chasmroad"},
		triggerconcmd = "playsoundscape adv.desert",
	},
	['loc_bunker_uppercorridor'] = {
		desc = 	"Long concrete corridor is bathed in almost lemon yellow light\n"..
				"from old humming lamps. One side ends in bunker door,\n"..
				"and another leads to brightly-lit room.",
		w = {desc = "Enter the brightly-lit room", target = "loc_bunker_upperelevator_room"},
		s = {desc = "Go out through bunker door", target = "loc_bunkerdoor_approach"},
		triggerconcmd = "playsoundscape ep2_silo.concretehall",
	},

	['loc_bunker_upperelevator_room'] = {
		desc = 	"This room is brightly lit and full of various cargo.\n"..
				"There is an elevator in the center of the room, two rusty\n"..
				"wheel-operated doors on opposite walls and a tunnel\n"..
				"leading to surface.",
		w = {desc = "Call the elevator", target = "loc_bunker_elevator_go_down"},
		s = {desc = "Head for surface access", target = "loc_bunker_uppercorridor"},
		a = {desc = "Try left door", target = "loc_bunker_upperelevator_room_door_left_check"},
		d = {desc = "Try right door ", target = "loc_bunker_upperelevator_room_door_right"},
		triggerconcmd = "playsoundscape ep2_silo.concretehall",
	},

	['loc_bunker_upperelevator_room_door_right'] = {
		desc = 	"No matter how I try, the wheel won't budge.",
		s = {desc = "Go back", target = "loc_bunker_upperelevator_room"},
		triggerconcmd = "playgamesound Metal_Box.Strain; playsoundscape ep2_silo.concretehall",
	},

	['loc_bunker_upperelevator_room_door_left_check'] = {
		valuetrue = "loc_bunker_upperelevator_room_door_left_postbreak",
		valuefalse = "loc_bunker_upperelevator_room_door_left_break",
	},

	['loc_bunker_upperelevator_room_door_left_break'] = {
		desc = 	"Whoops! The metal wheel broke off completely!\n"..
				"I'll just pretend it was like that when I got here...",
		s = {desc = "Go back", target = "loc_bunker_upperelevator_room"},
		triggerconcmd = "play physics/metal/metal_box_break1.wav; playsoundscape ep2_silo.concretehall",
		triggersetvalue = {'loc_bunker_upperelevator_room_door_left_check'},
	},
	['loc_bunker_upperelevator_room_door_left_postbreak'] = {
		desc = 	"The door wheel now rests against the wall,\n"..
				"as a monument to my sins.",
		s = {desc = "Go back", target = "loc_bunker_upperelevator_room"},
		triggerconcmd = "playsoundscape ep2_silo.concretehall",
	},

	['loc_bunker_elevator_go_down'] = {
		desc = 	"I enter the elevator and press 'down' button.",
		w = {desc = "Continue", target = "loc_bunker_lowerelevator_room"},
		triggerconcmd = "play plats/elevator_large_start1.wav; playsoundscape eli_01_elevator_1",
	},

	['loc_bunker_elevator_go_up'] = {
		desc = 	"I enter the elevator and press 'up' button.",
		w = {desc = "Continue", target = "loc_bunker_upperelevator_room"},
		triggerconcmd = "play plats/elevator_large_start1.wav; playsoundscape eli_01_elevator_1",
	},

	['loc_bunker_lowerelevator_room'] = {
		desc = 	"This room is round and suspiciously empty.\n"..
				"Only things of interest are elevator and long tunnel that\n"..
				"leads to exit, if signs are to be believed...",
		w = {desc = "Go towards exit door", target = "loc_bunker_exit_punched_check"},
		s = {desc = "Call the elevator", target = "loc_bunker_elevator_go_up"},
		triggerconcmd = "playsoundscape eli_01_lower_corridor_1",
	},

	['loc_bunker_exit_punched_check'] = {
		valuetrue = "loc_bunker_exit_burner_check",
		valuefalse = "loc_bunker_exit_punch",
	},

	['loc_bunker_exit_burner_check'] = {
		valuetrue = "loc_bunker_exit_gottorch",
		valuefalse = "loc_bunker_exit_notorch",
	},
	
	['loc_bunker_exit_punch'] = {
		desc = 	"This door is ought to lead to surface and off this damn plateau.\n"..
				"I swipe the key card but door only whines and doesn't open...\n"..
				"Looks like locking mechanism has rusted shut!",
		w = {desc = "Help mechanisms actuate mechanically", target = "loc_bunker_exit_punch2"},
		triggerconcmd = "playsoundscape eli_01_lower_corridor_1",
	},

	['loc_bunker_exit_punch2'] = {
		desc = 	"No amount of gentle kicks and careful smashes could move the locks.\n"..
				"Looks like I'll need a gas burner to cut these locks...",
		w = {desc = "Continue", target = "loc_bunker_exit_burner_check"},
		triggerconcmd = "playgamesound d1_trainstation.citizen_punched; play physics/metal/metal_grate_impact_hard1.wav;playsoundscape eli_01_lower_corridor_1",
		triggersetvalue = {'loc_dishes_inside_aaron_talk_about_burner_check','loc_bunker_exit_punched_check'}
	},

	['loc_bunker_exit_gottorch'] = {
		desc = 	"This large bunker door is only thing separating me from freedom,\n"..
				"and I even got the key card, but rusted locks don't want to obey...\n"..
				"Guess what, door! I got just what doctor ordered!\n",
		w = {desc = "Cut the locks and open the door", target = "loc_bunker_exit_cut"},
		s = {desc = "Go back", target = "loc_bunker_lowerelevator_room"},
		triggerconcmd = "playsoundscape eli_01_lower_corridor_1",
	},

	['loc_bunker_exit_notorch'] = {
		desc = 	"This large bunker door is only thing separating me from freedom,\n"..
				"and I even got the key card, but rusted locks don't want to obey...\n"..
				"I'll need a gas burner with hot enough flame to cut through these...",
		s = {desc = "Go back", target = "loc_bunker_lowerelevator_room"},
		triggerconcmd = "playsoundscape eli_01_lower_corridor_1",
	},

	['loc_bunker_exit_cut'] = {
		desc = 	"After some cutting work door gives up and starts moving...",
		w = {desc = "Continue", target = "credits_text"},
		triggerconcmd = "playsoundscape eli_01_lower_corridor_1",
	},

}


-- cool locked door sound: ambient\materials\metal_stress3.wav


-- ←↑→↓

local function GenerateDirectionsMessage(loc)
	-- Either do arrows or not
	ret = ''
	if loc.w then
		ret = ret..'↑) '..loc.w.desc
	end
	if loc.a then
		if ret ~= '' then ret = ret .. '\n' end
		ret = ret..'←) '..loc.a.desc
	end
	if loc.s then
		if ret ~= '' then ret = ret .. '\n' end
		ret = ret..'↓) '..loc.s.desc
	end
	if loc.d then
		if ret ~= '' then ret = ret .. '\n' end
		ret = ret..'→) '..loc.d.desc
	end
	return ret
end

local function GenerateActions(node, nodename)
	local ret = ''

	if node.triggersetvalue then
		for k,v in pairs(node.triggersetvalue) do
			ret = ret..'"OnUser1" "'..GOT(v)..',SetValue,1,0,-1"\n'
		end
	end

	if node.triggerconcmd then
		--if ret ~= '' then ret = ret .. '\n' end
		ret = ret..'"OnUser1" "'..GOT'clcmd'..',Command,'..node.triggerconcmd..',0,-1"\n'
	end

	if node.w then
		ret = ret..'"OnUser1" "'..GOT'ui_cmp_y'..',AddOutput,OnGreaterThan '..GOT(node.w.target)..':FireUser1:!:0.01:1,0,-1"\n'
		--ret = ret..'"OnUser1" "'..GOT'ui_cmp_y'..',AddOutput,OnGreaterThan '..GOT(nodename)..':FireUser2:!:-1:1,0,-1"\n' -- Kill off both compares and respawn them so fireuser above can add it's own outputs on it
		ret = ret..'"OnUser1" "'..GOT'ui_cmp_y'..',AddOutput,OnGreaterThan '..GOT'currentscene'..':FireUser2:!:-1:1,0,-1"\n' -- Kill off both compares and respawn them so fireuser above can add it's own outputs on it
		ret = ret..'"OnUser1" "'..GOT'ui_cmp_y'..',AddOutput,OnGreaterThan '..GOT't_ui_cmp'..':FireUser1:!:-1:1,0,-1"\n' -- hide text
	end
	if node.s then
		ret = ret..'"OnUser1" "'..GOT'ui_cmp_y'..',AddOutput,OnLessThan '..GOT(node.s.target)..':FireUser1:!:0.01:1,0,-1"\n'
		--ret = ret..'"OnUser1" "'..GOT'ui_cmp_y'..',AddOutput,OnLessThan '..GOT(nodename)..':FireUser2:!:-1:1,0,-1"\n'
		ret = ret..'"OnUser1" "'..GOT'ui_cmp_y'..',AddOutput,OnLessThan '..GOT'currentscene'..':FireUser2:!:-1:1,0,-1"\n'
		ret = ret..'"OnUser1" "'..GOT'ui_cmp_y'..',AddOutput,OnLessThan '..GOT't_ui_cmp'..':FireUser1:!:-1:1,0,-1"\n'
	end
	if node.a then
		ret = ret..'"OnUser1" "'..GOT'ui_cmp_x'..',AddOutput,OnLessThan '..GOT(node.a.target)..':FireUser1:!:0.01:1,0,-1"\n'
		--ret = ret..'"OnUser1" "'..GOT'ui_cmp_x'..',AddOutput,OnLessThan '..GOT(nodename)..':FireUser2:!:-1:1,0,-1"\n'
		ret = ret..'"OnUser1" "'..GOT'ui_cmp_x'..',AddOutput,OnLessThan '..GOT'currentscene'..':FireUser2:!:-1:1,0,-1"\n'
		ret = ret..'"OnUser1" "'..GOT'ui_cmp_x'..',AddOutput,OnLessThan '..GOT't_ui_cmp'..':FireUser1:!:-1:1,0,-1"\n'
	end
	if node.d then
		ret = ret..'"OnUser1" "'..GOT'ui_cmp_x'..',AddOutput,OnGreaterThan '..GOT(node.d.target)..':FireUser1:!:0.01:1,0,-1"\n'
		--ret = ret..'"OnUser1" "'..GOT'ui_cmp_x'..',AddOutput,OnGreaterThan '..GOT(nodename)..':FireUser2:!:-1:1,0,-1"\n'
		ret = ret..'"OnUser1" "'..GOT'ui_cmp_x'..',AddOutput,OnGreaterThan '..GOT'currentscene'..':FireUser2:!:-1:1,0,-1"\n'
		ret = ret..'"OnUser1" "'..GOT'ui_cmp_x'..',AddOutput,OnGreaterThan '..GOT't_ui_cmp'..':FireUser1:!:-1:1,0,-1"\n'
	end
	return ret
end

local function GenerateVMFQuestTreeNode(file, nodekey, nodevalue)
	local locname = nodekey
	local loc = nodevalue

	if loc.valuetrue and loc.valuefalse then -- logic_branch location
		file:write([[
entity
{
	"classname" "logic_branch"
	"targetname" "]]..GOT(locname)..[["
	"origin" "0 0 0"
	"InitialValue" "0"
	connections
	{
		"OnUser1" "]]..GOT(locname)..[[,Test,,0,-1"
		"OnTrue" "]]..GOT(loc.valuetrue)..[[,FireUser1,,0,-1"
		"OnFalse" "]]..GOT(loc.valuefalse)..[[,FireUser1,,0,-1"
	}
}
]])		
	else -- Game_text location
		--if string.len(loc.desc)>250 then 
		if string.len(loc.desc)>220 then -- 204 ok 220 ok
			print("\n\nWARNING: LOC\""..locname.."\" DESCRIPTION LONGER THAN 220! len ="..tostring(string.len(loc.desc)).."\n\""..loc.desc.."\"")
		end
		file:write([[
entity
{
	"classname" "game_text"
	"targetname" "]]..GOT(locname)..[["
	"origin" "0 0 0"
	"message" "]]..loc.desc..[["
	"channel" "1"
	"color" "255 255 255"
	"color2" "100 240 200"
	"effect" "2"
	"spawnflags" "1"
	"fadein" "]]..tostring(charfadetime)..[["
	"fadeout" "0.5"
	"fxtime" "0.25"
	"holdtime" "10000000"
	"x" "0"
	"y" "0"
	connections
	{
		"OnUser1" "!self,AddOutput,targetname ]]..GOT'currentscene'..[[,0,-1"
		"OnUser1" "!self,FireUser3,,0,-1"
]]..GenerateActions(loc, locname)..[[
		"OnUser2" "!self,AddOutput,targetname ]]..GOT(locname)..[[,0,-1"
		"OnUser2" "]]..GOT'clean1'..[[,Display,,0,-1"
		"OnUser2" "]]..GOT'clean2'..[[,Display,,0,-1"
		"OnUser2" "!self,AddOutput,targetname ]]..GOT'currentscene'..[[,0,-1"
		"OnUser3" "!self,Display,,0,-1"
		"OnUser3" "]]..GOT(locname..'____dir')..[[,Display,,0,-1"
	}
}
entity
{
	"classname" "game_text"
	"targetname" "]]..GOT(locname..'____dir')..[["
	"origin" "0 0 0"
	"message" "]]..GenerateDirectionsMessage(loc)..[["
	"channel" "2"
	"color" "255 255 255"
	"color2" "100 240 200"
	"effect" "2"
	"spawnflags" "1"
	"fadein" "]]..tostring(charfadetime)..[["
	"fadeout" "0.5"
	"fxtime" "0.25"
	"holdtime" "10000000"
	"x" "0"
	"y" "1"
}
]])	

	end


	-- Make main game text
	-- and supplementary with controls
end

local function GenerateVMFQuestTree(file)
	for k,v in pairs(questtree) do
		GenerateVMFQuestTreeNode(file, k, v)
	end
end






function GenerateVMF()
	local file = io.open(mapfilename, "wb")

	GenerateVMFPreamble(file)
	GenerateVMFEssentialEnts(file)
	GenerateVMFQuestTree(file)


	file:close()

	print("Done writing "..mapfilename)

end

GenerateVMF()


