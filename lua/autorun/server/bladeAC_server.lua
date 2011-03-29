--[[
		Blade AntiCheat™

		LUA based Cheat/Resource/Illegal CFG's/Convars/Aimbots/Hack detection.

		Designed and Programed by: DarK_St3alth (St3alth Gaming) & SE Check by BlueKirby (St3alth Gaming)

		More information: http://s3g.brainnerd.com/forum
]]
require("datastream")

if not SERVER then return end

-- Jam hack console commands that could be bound to a key....
hackcmd={}
hackcmd[1]="gzfaimbot_reload"
hackcmd[2]="gzfaimbot_toggle"
hackcmd[3]="+gzfaimbot"
hackcmd[4]="-gzfaimbot"
hackcmd[5]="aa_enabled"
hackcmd[6]="gzfaimbot_menu"
hackcmd[7]="at_menu"
hackcmd[8]="at_autoshoot_on"
hackcmd[9]="at_autoshoot_off"
hackcmd[10]="at_autoaim_on"
hackcmd[11]="at_autoaim_off"
hackcmd[12]="at_esp_on"
hackcmd[13]="at_esp_off"
hackcmd[14]="at_changer_on"
hackcmd[15]="at_changer_off"
hackcmd[16]="at_norecoil_on"
hackcmd[17]="at_norecoil_off"
hackcmd[18]="Bacon_Reload_Script"
hackcmd[19]="hack_menu"
hackcmd[20]="hackmenu"
hackcmd[20]="PH_reload"
hackcmd[21]="PH_toggle"
hackcmd[22]="+PH"
hackcmd[23]="-PH"
hackcmd[24]="PH_menu"
hackcmd[25]="neon_menu"
hackcmd[26]="neonmenu"
hackcmd[27]="neonopen"
hackcmd[28]="neon_open"
hackcmd[29]="neon_derma"
hackcmd[30]="neonactivate"
hackcmd[31]="+trooper_menu"
hackcmd[32]="jam_materials"
hackcmd[33]="-trooper_menu"
hackcmd[34]="aimbot_on"
hackcmd[35]="esp_on"
hackcmd[36]="+aimbot_scan"
hackcmd[37]="+falco_zoom"
hackcmd[38]="+fzoom"
hackcmd[39]="falco_ESPConfig"
hackcmd[40]="falco_xray"
hackcmd[41]="falco_light"
hackcmd[42]="gzfaimbot_enabled"
hackcmd[43]="JBF_on"
hackcmd[44]="+BUTTFUCK"
hackcmd[45]="toggleradar"
hackcmd[46]="+nBot"
hackcmd[47]="+asb"
hackcmd[48]="wots_togglewireframe"
hackcmd[49]="wots_toggleesp"
hackcmd[50]="+wots_spinhack"
hackcmd[51]="falco_spectate"
hackcmd[52]="Fap_Menu"
hackcmd[53]="fap_reload"
hackcmd[54]="fap_aim_toggle"
hackcmd[55]="+fap_aim"
hackcmd[56]="-fap_aim"
hackcmd[57]="+fap_esp"
hackcmd[58]="-fap_esp"
hackcmd[59]="crash"
hackcmd[60]="+crash"
hackcmd[61]="activate_crash"
hackcmd[62]="deactivate_crash"
hackcmd[63]="server_crash"
hackcmd[64]="crash_server"
hackcmd[65]="crashserver"
hackcmd[66]="crashtehserver"
hackcmd[67]="crashtheserver"
-- ---------------------------------------

--function GM:AcceptStream( pl, handler, id )
--    return true; -- Allow all streams
--end

AddCSLuaFile("autorun/client/bladeAC_client.lua")
resource.AddFile("sounds/BladeAC/serveropjoined-female.mp3")
resource.AddFile("sounds/BladeAC/serveradminjoined-female.mp3")
resource.AddFile("sounds/BladeAC/serverownerjoined-f-mix.mp3")

local SE_Status = GetConVar("sv_scriptenforcer"):GetInt()
local SC_Status = GetConVar("sv_cheats"):GetInt()

-- Yes this is BLADE AC Control standing by....
print("-------------------------------------------------------------------------------------------")
print("\n")
print("[BLADE] Blade AntiCheat (v1) :: Server Startup")
print("--------------------------------------\n")
print("[BLADE] Blade Anticheat is running on this server. :) GJ N00bz0rs!")
print("\n")
print("Blade Anticheat detects and bans for:")
print("Illegal Lua Scripts, Aimbots/No Recoil Cheats, Modified Resources, Illegal/Cheat CFGs.")
print("-------------------------------------------------------------------------------------------")
print("\n")


if SE_Status == 0 then
	print("[BLADE]	[!]	Your server has Script Enforcer (sv_scriptenforcer) off!")
	print("\n")
	print("[BLADE]	[!]	It is highly recomended that you tun it on!")
	print("\n")
elseif SC_Status == 1 then
	print("[BLADE]	[!]	Your server has Cheats (sv_cheats) on!")
	print("\n")
	print("[BLADE]	[!]	It is highly recomended that you tun it off!")
	print("\n")
end


function playerfirstspawn(ply)
	-- when a player joins the server
	-- Lol lol lol, eat that SE bypassers! Thanks to BlueKirby for the code... :)
	ply:ConCommand("blade_client_message")
	ply:ConCommand("blade_client_check")
	ply:PrintMessage(HUD_PRINTCENTER,"This server is running Blade AntiCheat™!")
	ply.FirstSpawn = true;

	for a = 1,67 do
		ply:SendLua('"concommand.Remove("'.. hackcmd[i] ..'")')
		ply:SendLua([[concommand.Add("]]..hackcmd[i]..[[", bindblocked)]])
	end

end

function playerhasspawned(ply)
	for a = 1,67 do
		ply:SendLua('"concommand.Remove("'.. hackcmd[i] ..'")')
		ply:SendLua([[concommand.Add("]]..hackcmd[i]..[[", bindblocked)]])
	end
end

function userAuthed(ply, stid)
	-- PrintMessage( HUD_PRINTTALK, ply:GetName() .. " (" .. ply:SteamID( ).. ") has authed with Steam Servers." )
	chat.AddText(Color(255, 64, 96), "[AUTH] ", Color(255, 255, 255), ply:GetName(), " (" , ply:SteamID( ), ") connected.")
end

function userDisconnect(ply)
	-- Print to chat that a player has disconnected from the server.
	-- PrintMessage( HUD_PRINTTALK, ply:GetName() .. " (" .. Player:SteamID( ).. ") has left the server." )
	chat.AddText(Color(255, 64, 96), "[AUTH] ", Color(255, 255, 255), ply:GetName(), " (" .. ply:SteamID( ).. ") has left.")
end

function bladeac_cs( ply, handle, id, encoded, decoded )
    chat.AddText(Color(255, 0, 0), "[AUTH] BLADEAC AUTHED ", Color(255, 255, 255), ply:SteamID())
	print( decoded.text );
    --print( decoded.number );
    --print( decoded.bool );
end

function whereisplayer(ply)
	local pos = player:GetPos();
	return pos
end

datastream.Hook("bladeac_c2s", bladeac_cs);
hook.Add("PlayerInitialSpawn" ,"RunClientCommands", playerfirstspawn)
hook.Add("PlayerSpawn" ,"playerspawn", playerhasspawned)
hook.Add("PlayerAuthed", "playerauthed", userAuthed)
hook.Add("PlayerDisconnected", "playerdisconnected", userDisconnect)
--hook.Add( "PlayerDeath", "ResetKillCheck", playerDies )
--hook.Add("OnNPCKilled", "AddKillsToKillStrreak", npcDeath)