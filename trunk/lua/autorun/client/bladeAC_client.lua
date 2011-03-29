--[[
		Blade AntiCheat™

		LUA based Cheat/Resource/Illegal CFG's/Convars/Aimbots/Hack detection.

		Designed and Programed by: DarK_St3alth (St3alth Gaming) & SE Check by BlueKirby (St3alth Gaming)

		More information: http://s3g.brainnerd.com/forum
]]
require("datastream")

if SERVER then return end

-- ////////////////////////////////////////////////////////////////////////////////////////////////
-- "Preformance" settings that can act like hacks...
-- Most require sv_cheats set to 1, however in the case that it is somehow bypassed or enabled:

function blade_proformance_settings_set()
	RunConsoleCommand("mat_fullbright", "0")
	RunConsoleCommand("mat_yuv", "0")
	RunConsoleCommand("r_screenoverlay", "")
	RunConsoleCommand("cl_phys_timescale", "1")
	RunConsoleCommand("mat_fastnobump", "0")
	RunConsoleCommand("mat_hsv", "0")
	RunConsoleCommand("r_drawskybox", "1")
	RunConsoleCommand("r_farz", "-1")
	RunConsoleCommand("fog_enable_water_fog", "1")
	RunConsoleCommand("net_fakelag", "0")
	RunConsoleCommand("net_fakeloss", "0")
	RunConsoleCommand("mat_drawwater", "1")
	RunConsoleCommand("r_drawdecals", "1")
	RunConsoleCommand("r_drawparticles", "1")
	RunConsoleCommand("r_DrawRain", "1")
	RunConsoleCommand("r_drawropes", "1")
	RunConsoleCommand("r_drawtranslucentrenderables", "1")
	RunConsoleCommand("dsp_off", "0")
end
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

-- Yes, lol at the black list. I'm lazy...

function bladecheck(player, command, arguments)
	-- Msg( "Printing Something\n" )
	print("[BLADE AC] HOSTNAME: "..GetHostName())
	print("[BLADE AC] Scanning Client... ")
	--file.TFind("lua/*.lua", CheatSearch)
	print("---------------------------------")
	file.TFind("lua/autorun/*.lua", CheatSearch)
	file.TFind("lua/autorun/client/*.lua", CheatSearch)
	file.TFind("lua/menu_plugins/*.lua", CheatSearch)
	file.TFind("addons/DarkRP Wallhack/lua/autorun/client/*.lua", CheatSearch)
	file.TFind("addons/[GzF]Hacks/lua/autorun/client/*.lua", CheatSearch)
	file.TFind("materials/wall/*.vmt", CheatSearch)
	file.TFind("materials/Arealmouse/*.vmt", CheatSearch)
	file.TFind("addons/Trooper Hack v1.1/lua/autorun/client/*.lua", CheatSearch)
	file.TFind("materials/Bacon Bot/*.vmt", CheatSearch)

	file.TFind("addons/Wallhack/materials/models/props_c17/*.vmt", CheatSearch)
	file.TFind("addons/Wallhack/materials/models/items/*.vmt", CheatSearch)

	--file.TFind("lua/*.lua", CheatSearch)
	--print("---------------------------------")
	--file.TFind("lua/includes/modules/", CheatSearch)
	--print("---------------------------------")
end

function CheatSearch(Search, Folders, Files)

	-- print(Search)			This is where we asked it to look for files and folders.

	-- PrintTable(Folders)		Folders found.
	-- PrintTable(Files)		Files found.

	-- Condenced, for space and size! :D
	hackfiles={}
	hackfiles[1]="faphack.lua"
	hackfiles[2]="DarkRPEnts.lua"
	hackfiles[3]="panstrams.lua"
	hackfiles[4]="AutoAim.lua"
	hackfiles[5]="ViewAll.lua"
	hackfiles[6]="sandglass.vtf"
	hackfiles[7]="PCcrash.lua"
	hackfiles[8]="A-Hack.lua"
	hackfiles[9]="pb_pub.lua"
	hackfiles[10]="BaconBotIcon.vmt"
	hackfiles[11]="clock.lua"
	hackfiles[12]="!.lua"
	hackfiles[13]="fuckoff.lua"
	hackfiles[14]="Trap_Propeller001b.vmt"
	hackfiles[15]="consolebox01a.vmt"
	hackfiles[16]="itemcrate_sheet.vmt"
	hackfiles[17]="Phoenix Private.lua"


	for i = 1,17 do
		if table.HasValue(Files, hackfiles[i]) then
			RunConsoleCommand("say", "[BLADE] I'm using a cheat.")
			RunConsoleCommand("team_say", "[BLADE] I'm using a cheat.")
			RunConsoleCommand("say_team", "[BLADE] I'm using a cheat.")
			print("[BLADE] A cheat or hack has been detected!")
			Cheatmessage()
			RunConsoleCommand("disconnect")
		end
	end
end

function Cheatmessage()

	-- Lua generated by DermaDesigner

	local DLabel4
	local DLabel3
	local DFrame3

	DFrame3 = vgui.Create('DFrame')
	DFrame3:SetSize(279, 100)
	DFrame3:Center()
	DFrame3:SetTitle('Blade - Anti Cheat ™')
	DFrame3:SetSizable(true)
	-- DFrame3:SetDeleteOnClose(false)
	DFrame3:MakePopup()

	DLabel3 = vgui.Create('DLabel')
	DLabel3:SetParent(DFrame3)
	DLabel3:SetPos(49, 30)
	DLabel3:SetText('A cheat or hack has been detected.')
	DLabel3:SizeToContents()
	DLabel3:SetTextColor(Color(255, 165, 0, 255))
	DLabel4 = vgui.Create('DLabel')
	DLabel4:SetParent(DFrame3)
	DLabel4:SetPos(19, 60)
	DLabel4:SetText('Players have been notified. You could be banned.')
	DLabel4:SizeToContents()

end

function joinmessage()

	print("[BLADE] Blade AntiCheat :: Join Notice")
	print("--------------------------------------\n")
	print("[BLADE] NOTICE: Blade Anticheat is running on this server.")
	print("[BLADE] YOU COULD BE BANNED FOR CHEATING AND/OR HACKING!")
	print("\n")
	print("Blade Anticheat detects and can ban for:")
	print("Illegal Lua Scripts, Aimbots/No Recoil Cheats, Modified Resources, Illegal/Cheat CFGs.")
	print("--------------------------------------------------------------------------------------")
	print("\n")

	-- Lua generated by DermaDesigner

	local DButton1
	local DLabel7
	local DLabel6
	local DLabel5
	local DLabel4
	local DLabel3
	local DLabel2
	local DLabel1
	local DFrame1

	DFrame1 = vgui.Create('DFrame')
	DFrame1:SetSize(400, 190)
	DFrame1:Center()
	DFrame1:SetTitle('Blade AntiCheat :: Join Notice')
	DFrame1:MakePopup()
	DLabel1 = vgui.Create('DLabel')
	DLabel1:SetParent(DFrame1)
	DLabel1:SetPos(70, 34)
	DLabel1:SetText('NOTICE: Blade Anticheat is running on this server.')
	DLabel1:SizeToContents()
	DLabel1:SetTextColor(Color(255, 215, 0, 255))
	DLabel2 = vgui.Create('DLabel')
	DLabel2:SetParent(DFrame1)
	DLabel2:SetPos(10, 64)
	DLabel2:SetText('Blade Anticheat detects and bans for:')
	DLabel2:SizeToContents()

	DLabel3 = vgui.Create('DLabel')
	DLabel3:SetParent(DFrame1)
	DLabel3:SetPos(210, 64)
	DLabel3:SetText('Illegal Lua Scripts')
	DLabel3:SizeToContents()
	DLabel3:SetTextColor(Color(255, 255, 255, 255))
	DLabel4 = vgui.Create('DLabel')
	DLabel4:SetParent(DFrame1)
	DLabel4:SetPos(210, 84)
	DLabel4:SetText('Aimbots/No Recoil Cheats')
	DLabel4:SizeToContents()
	DLabel4:SetTextColor(Color(255, 255, 255, 255))
	DLabel5 = vgui.Create('DLabel')
	DLabel5:SetParent(DFrame1)
	DLabel5:SetPos(210, 104)
	DLabel5:SetText('Modified Resources')
	DLabel5:SizeToContents()
	DLabel5:SetTextColor(Color(255, 255, 255, 255))
	DLabel6 = vgui.Create('DLabel')
	DLabel6:SetParent(DFrame1)
	DLabel6:SetPos(210, 124)
	DLabel6:SetText('Illegal/Cheat CFGs')
	DLabel6:SizeToContents()
	DLabel6:SetTextColor(Color(255, 255, 255, 255))
	DLabel7 = vgui.Create('DLabel')
	DLabel7:SetParent(DFrame1)
	DLabel7:SetPos(10, 164)
	DLabel7:SetText('http://s3g.brainnerd.com/fourms')
	DLabel7:SizeToContents()
	DLabel7:SetTextColor(Color(192, 192, 192, 255))
	DButton1 = vgui.Create('DButton')
	DButton1:SetParent(DFrame1)
	DButton1:SetSize(120, 30)
	DButton1:SetPos(260, 154)
	DButton1:SetText("Leave Server <<")
	DButton1.DoClick = function()
		print("[BLADE] Cya later!")
		RunConsoleCommand("disconnect", "")
	end
end

function bindblocked()
	-- Lua generated by DermaDesigner

	local DLabel3
	local DFrame2

	DLabel3 = vgui.Create('DLabel')
	DLabel3:SetPos(295, 300)
	DLabel3:SetText('You have a key bound to a Illegal command.')
	DLabel3:SizeToContents()
	DLabel3:SetTextColor(Color(255, 255, 0, 255))
	DFrame2 = vgui.Create('DFrame')
	DFrame2:SetSize(230, 60)
	DFrame2:Center()
	DFrame2:SetTitle('Blade - Anti Cheat ™')
	DFrame2:SetSizable(true)
	DFrame2:MakePopup()

		RunConsoleCommand("say", "I'm trying to use my key bound to a hack.")
		RunConsoleCommand("team_say", "I'm trying to use my key bound to a hack.")
		RunConsoleCommand("say_team", "I'm trying to use my key bound to a hack.")
		RunConsoleCommand("disconnect")
end
-- ------------------------------------------------------------------


concommand.Add( "blade_client_check", bladecheck)
concommand.Add( "blade_client_detected_message", Cheatmessage)
concommand.Add( "blade_client_message", joinmessage)

-- AddCVarHook("gzfaimbot_enabled", "ConVarEnabled")
-- lua_openscript

joinmessage()
blade_proformance_settings_set()
RunConsoleCommand("lua_run_cl", 'chat.AddText(Color(255,0,0),"Script enforcer bypass detected!") RunConsoleCommand("disconnect")')
--RunConsoleCommand("say", "[BLADE] I'm using a cheat.")
--RunConsoleCommand("team_say", "[BLADE] I'm using a cheat.")
--RunConsoleCommand("say_team", "[BLADE] I'm using a cheat.")
joinmessage()