--
-- Blade AntiCheat™
--
-- LUA based Cheat/Resource/Illegal CFG's/Convars/Aimbots/Hack detection.
--
-- Designed and Programed by: DarK_St3alth (St3alth Gaming)
--
-- More information: http://s3g.brainnerd.com/forum
--
require("datastream")

if not SERVER then return end

function GM:AcceptStream( pl, handler, id )
    return true; -- Allow all streams
end

AddCSLuaFile("autorun/client/bladeAC_client.lua")
resource.AddFile("sounds/BladeAC/serveropjoined-female.mp3")
resource.AddFile("sounds/BladeAC/serveradminjoined-female.mp3")
resource.AddFile("sounds/BladeAC/serverownerjoined-f-mix.mp3")

CreateConVar("Blade_Anticheat_Active", 1, FCVAR_SERVER_CAN_EXECUTE)

local Blade_Status = GetConVar("Blade_Anticheat_Active"):GetInt()
local SE_Status = GetConVar("sv_scriptenforcer"):GetInt()
local SC_Status = GetConVar("sv_cheats"):GetInt()

if Blade_Status = 1 then
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
else
	print("[BLADE]	[!]	Your server is not protected!")
	print("\n")
	print("[BLADE]	[!]	Set Blade_Anticheat_Active to 1 to activate.")
	print("\n")
	print("\n")
	print("\n")
endif

if SE_Status = 0 then
	print("[BLADE]	[!]	Your server has Script Enforcer (sv_scriptenforcer) off!")
	print("\n")
	print("[BLADE]	[!]	It is highly recomended that you tun it on!")
	print("\n")
elseif SC_Status = 1 then
	print("[BLADE]	[!]	Your server has Cheats (sv_cheats) on!")
	print("\n")
	print("[BLADE]	[!]	It is highly recomended that you tun it off!")
	print("\n")
end


function playerfirstspawn(ply)
	-- when a player joins the server
	ply:ConCommand("blade_client_message")
	--ply:ConCommand("blade_client_check")
	ply.FirstSpawn = true;
end

function playerhasspawned(ply)
	ply:ConCommand("blade_client_message")
end

function userAuthed(ply, stid)
	-- PrintMessage( HUD_PRINTTALK, ply:GetName() .. " (" .. ply:SteamID( ).. ") has authed with Steam Servers." )
	chat.AddText(Color(255, 64, 96), "[AUTH] ", Color(255, 255, 255), ply:GetName(), " (" .. ply:SteamID( ).. ") connected.")
end

function userDisconnect(ply)
	-- Print to chat that a player has disconnected from the server.
	-- PrintMessage( HUD_PRINTTALK, ply:GetName() .. " (" .. Player:SteamID( ).. ") has left the server." )
	chat.AddText(Color(255, 64, 96), "[AUTH] ", Color(255, 255, 255), ply:GetName(), " (" .. ply:SteamID( ).. ") has left.")
end

function bladeac_cs( ply, handle, id, encoded, decoded )
    chat.AddText(Color(255, 0, 0), "[AUTH] BLADEAC AUTHED ", Color(255, 255, 255), ply:GetName())
	print( decoded.text );
    --print( decoded.number );
    --print( decoded.bool );
end

datastream.Hook("bladeac_c2s", bladeac_cs);
hook.Add("PlayerInitialSpawn" ,"RunClientCommands", playerfirstspawn)
hook.Add("PlayerSpawn" ,"playerspawn", playerhasspawned)
hook.Add("PlayerAuthed", "playerauthed", userAuthed)
hook.Add("PlayerDisconnected", "playerdisconnected", userDisconnect)
--hook.Add( "PlayerDeath", "ResetKillCheck", playerDies )
--hook.Add("OnNPCKilled", "AddKillsToKillStrreak", npcDeath)

function whereisplayer(ply)
	local pos = player:GetPos();
	return pos
end