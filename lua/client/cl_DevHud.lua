/*
 Author: Dev:Rudy
 AddonName: DevHud
 Web: http://steamcommunity.com/id/id187393908/
 Version: 0.1
 Up date: 2017.14.09 
*/
/*
	Добавить Config 	= Не Готово
	Добавить Theme  	= Не Готово
	Fix Icons 		= Готово
*/
/*------------------------------------------------------------------------------------------------------------
HIDING DEFAULT HUD
-------------------------------------------------------------------------------------------------------------*/
	local hidden = { "DarkRP_HUD", "DarkRP_Hungermod", "CHudHealth", "CHudAmmo", "DarkRP_Agenda" }
	------------------------------------------------------------------------
	hook.Add("HUDShouldDraw", "CHUD_Hide", function(name)
		if table.HasValue(hidden, name) || name == "CHudAmmo" && Config.ShowAmmoCircle then return false end
	end)
	-----------------------------------------------------------------------
	function hidehud(name)
		for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo", })do
			if name == v then return false end
		end
	end
	hook.Add("HUDShouldDraw", "HideOurHud", hidehud)
	-----------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
function DevHud()
	/*------------------------------------------------------------------------
	Dev:Hud
	------------------------------------------------------------------------*/
	local v1 = LocalPlayer().DarkRPVars.money
	if not v1 then v1 = "" end

	local v2 = LocalPlayer().DarkRPVars.salary
	if not v2 then v2 = "" end
	------------------------------------------------------------------------
	local energy 	= 	math.ceil(LocalPlayer():getDarkRPVar("Energy") or 0)
	------------------------------------------------------------------------
	local Dev 		= LocalPlayer()				/*ID*/
	local HP 		= Dev:Health()				/*Здоровье*/
	local AR 		= Dev:Armor()				/*Броня*/
	local jobs 		= Dev:getDarkRPVar("job")	/*Професии*/
	local NI 		= Dev:Nick()
	------------------------------------------------------------------------
	local DevRed 	= Color( 255,0,0,200 )				/*Красный*/
	local DevBlue 	= Color( 0,0,255,120 )				/*Синий*/
	local DevBlack1	= Color( 0,0,0,200 )				/*Черный1*/
	local DevBlack2 = Color( 0,0,0,220 )				/*Черный2*/
	local DevGreen 	= Color( 0,255,0,200 )				/*Зелёный*/
	local DevWhite 	= Color( 255,255,255,200 )			/*Белый*/
	local DevPur  	= Color( 140,0,255,120 )
	------------------------------------------------------------------------
	draw.RoundedBox( 0, 4, ScrH() - 35, 540, 28, DevBlack2 ) 	        /*Dev:Hud*/
	draw.RoundedBox( 0, 4, ScrH() - 68, 325, 28, DevBlack2 )		/*Dev:HudTime*/
	draw.RoundedBox( 0, 4, ScrH() - 100, 250, 28, DevBlack2 )		/*Dev:Nick*/
	------------------------------------------------------------------------
	draw.RoundedBox( 0, 4, ScrH() - 35, 540, 1, DevWhite )
	draw.RoundedBox( 0, 4, ScrH() - 8, 540, 1, DevWhite )
	draw.RoundedBox( 0, 4, ScrH() - 35, 1, 28, DevWhite )
	draw.RoundedBox( 0, 85, ScrH() - 35, 2, 28, DevWhite )
	draw.RoundedBox( 0, 175, ScrH() - 35, 2, 28, DevWhite )
	draw.RoundedBox( 0, 255, ScrH() - 35, 2, 28, DevWhite )
	draw.RoundedBox( 0, 544, ScrH() - 35, 1, 28, DevWhite )
	------------------------------------------------------------------------
	draw.RoundedBox( 0, 4, ScrH() - 68, 325, 1, DevWhite )
	draw.RoundedBox( 0, 4, ScrH() - 41, 325, 1, DevWhite )
	draw.RoundedBox( 0, 4, ScrH() - 68, 1, 28, DevWhite )
	draw.RoundedBox( 0, 125, ScrH() - 68, 2, 28, DevWhite )
	draw.RoundedBox( 0, 329, ScrH() - 68, 1, 28, DevWhite )
	------------------------------------------------------------------------
	draw.RoundedBox( 0, 4, ScrH() - 100, 250, 1, DevWhite )
	draw.RoundedBox( 0, 4, ScrH() - 72, 250, 1, DevWhite )
	draw.RoundedBox( 0, 4, ScrH() - 100, 1, 28, DevWhite )
	draw.RoundedBox( 0, 254, ScrH() - 100, 1, 28, DevWhite )
	------------------------------------------------------------------------
	draw.SimpleText( HP .. '%', 'DevHud1', 32, 928.50, DevWite, 0, 0 )
	draw.SimpleText( AR .. '%', 'DevHud2', 125, 928.50, DevWite, 0, 0 )
	draw.SimpleText( v1 .. '$' .. ' + ' .. v2 .. '$', 'DevHud3', 290, 928.50, DevWite, 0, 0 )
	draw.SimpleText( energy .. '%', 'DevHud4', 210, 928.50, DevWite, 0, 0 )
	draw.SimpleText(os.date( "%I:%M:%S" ), "DevHud6", 35, 895, DevWhite,0,0)
	draw.SimpleText(jobs,"DevHud7",132,890,team.GetColor(Dev:Team()))
	draw.SimpleText( NI, 'DevHud8', 34, 861.50, DevWite, 0, 0 )
	------------------------------------------------------------------------
end
-------------------------------------------------------------------------------------------------------------
function DevHud1()
	/*------------------------------------------------------------------------
	icons
	------------------------------------------------------------------------*/
		local ourMat1 = Material( "materials/heart298.png" )
		surface.SetMaterial( ourMat1 )
		surface.SetDrawColor( 255,255,255  )
		surface.DrawTexturedRect(10,929.50, 20, 18 )
	-----------------------------------------------------------------------
		local ourMat2 = Material( "materials/shields16.png" )
		surface.SetMaterial( ourMat2 )
		surface.SetDrawColor( 255,255,255  )
		surface.DrawTexturedRect(95,929.50, 20, 18 )
	-----------------------------------------------------------------------
		local ourMat3 = Material( "materials/burger11.png" )
		surface.SetMaterial( ourMat3 )
		surface.SetDrawColor( 255,255,255  )
		surface.DrawTexturedRect(185,929.50, 20, 18 )
	-----------------------------------------------------------------------
		local ourMat4 = Material( "materials/wallet33.png" )
		surface.SetMaterial( ourMat4 )
		surface.SetDrawColor( 255,255,255  )
		surface.DrawTexturedRect(265,929.50, 20, 18 )
	-----------------------------------------------------------------------
		local ourMat4 = Material( "materials/clock.png" )
		surface.SetMaterial( ourMat4 )
		surface.SetDrawColor( 255,255,255  )
		surface.DrawTexturedRect(10,898.50, 20, 18 )
	-----------------------------------------------------------------------
		local ourMat4 = Material( "materials/office-worker2.png" )
		surface.SetMaterial( ourMat4 )
		surface.SetDrawColor( 255,255,255  )
		surface.DrawTexturedRect(10,865.50, 20, 18 )
end
-------------------------------------------------------------------------------------------------------------
function DevHud2()
	/*------------------------------------------------------------------------
	Font
	------------------------------------------------------------------------*/
	surface.CreateFont( "DevHud1", {
		font 		= "Arial",
		extended 	= false,
		size 		= 20,
		weight 		= 500,
		blursize	= 0,
		scanlines 	= 0,
		antialias 	= true,
		underline 	= false,
		italic 		= false,
		strikeout	= false,
		symbol 		= false,
		rotary 		= false,
		shadow 		= false,
		additive 	= false,
		outline 	= false,
} )
	------------------------------------------------------------------------
	surface.CreateFont( "DevHud2", {
		font 		= "Arial",
		extended 	= false,
		size 		= 20,
		weight 		= 500,
		blursize	= 0,
		scanlines 	= 0,
		antialias 	= true,
		underline 	= false,
		italic 		= false,
		strikeout	= false,
		symbol 		= false,
		rotary 		= false,
		shadow 		= false,
		additive 	= false,
		outline 	= false,
} )
	------------------------------------------------------------------------
	surface.CreateFont( "DevHud3", {
		font 		= "Arial",
		extended 	= false,
		size 		= 20,
		weight 		= 500,
		blursize	= 0,
		scanlines 	= 0,
		antialias 	= true,
		underline 	= false,
		italic 		= false,
		strikeout	= false,
		symbol 		= false,
		rotary 		= false,
		shadow 		= false,
		additive 	= false,
		outline 	= false,
} )
	------------------------------------------------------------------------
	surface.CreateFont( "DevHud4", {
		font 		= "Arial",
		extended 	= false,
		size 		= 20,
		weight 		= 500,
		blursize	= 0,
		scanlines 	= 0,
		antialias 	= true,
		underline 	= false,
		italic 		= false,
		strikeout	= false,
		symbol 		= false,
		rotary 		= false,
		shadow 		= false,
		additive 	= false,
		outline 	= false,
} )

	surface.CreateFont( "DevHud5", {
		font 		= "Arial",
		extended 	= false,
		size 		= 20,
		weight 		= 500,
		blursize	= 0,
		scanlines 	= 0,
		antialias 	= true,
		underline 	= false,
		italic 		= false,
		strikeout	= false,
		symbol 		= false,
		rotary 		= false,
		shadow 		= false,
		additive 	= false,
		outline 	= false,
} )

	surface.CreateFont( "DevHud6", {
		font 		= "Arial",
		extended 	= false,
		size 		= 23,
		weight 		= 500,
		blursize	= 0,
		scanlines 	= 0,
		antialias 	= true,
		underline 	= false,
		italic 		= false,
		strikeout	= false,
		symbol 		= false,
		rotary 		= false,
		shadow 		= false,
		additive 	= false,
		outline 	= false,
} )

	surface.CreateFont( "DevHud7", {
		font 		= "Arial",
		extended 	= false,
		size 		= 30,
		weight 		= 900,
		blursize	= 0,
		scanlines 	= 0,
		antialias 	= true,
		underline 	= false,
		italic 		= false,
		strikeout	= false,
		symbol 		= false,
		rotary 		= false,
		shadow 		= false,
		additive 	= false,
		outline 	= false,
} )

	surface.CreateFont( "DevHud8", {
		font 		= "Arial",
		extended 	= false,
		size 		= 25,
		weight 		= 900,
		blursize	= 0,
		scanlines 	= 0,
		antialias 	= true,
		underline 	= false,
		italic 		= false,
		strikeout	= false,
		symbol 		= false,
		rotary 		= false,
		shadow 		= false,
		additive 	= false,
		outline 	= false,
} )	

end

function DevHud3(  )
	/*------------------------------------------------------------------------
	Ammo
	------------------------------------------------------------------------*/
	local client = LocalPlayer()
	------------------------------------------------------------------------
	local DevAmmo 	= 	Color( 0,0,0,220 )
	local DevAmmo2 	= 	Color( 255,255,255,200 )
	------------------------------------------------------------------------
	if !client:Alive() then
	  return
	end
	------------------------------------------------------------------------
	draw.RoundedBox( 0, 1120, ScrH() - 35, 150, 28, DevAmmo )
	draw.RoundedBox( 0, 1120, ScrH() - 35, 150, 1, DevAmmo2 )
	draw.RoundedBox( 0, 1120, ScrH() - 8, 150, 1, DevAmmo2 )
	draw.RoundedBox( 0, 1120, ScrH() - 35, 1, 28, DevAmmo2 )
	draw.RoundedBox( 0, 1270, ScrH() - 35, 1, 28, DevAmmo2 )
	------------------------------------------------------------------------
	if (client:GetActiveWeapon():Clip1() != -1) then
		draw.SimpleText('Ammo: ' .. client:GetActiveWeapon():Clip1() .. '/' .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), 'DevHud5', 1130, ScrH() - 31, Color(255,255,255,255),0 , 0 )
	else
		draw.SimpleText('Ammo: ' .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), 'DevHud5', 1130, ScrH() - 31, Color(255,255,255,255), 0, 0 )
	end

	if (client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()) > 0) then
		draw.SimpleText('Secondary: ' .. client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()), 'DevHud5', 1150, ScrH() - 50, Color(255,255,255,255), 0, 0 )
	end
	------------------------------------------------------------------------

	------------------------------------------------------------------------
end

hook.Add( 'HUDPaint', 'DevHud', DevHud )
hook.Add( 'HUDPaint', 'DevHud1', DevHud1 )
hook.Add( 'HUDPaint', 'DevHud2', DevHud2 )
hook.Add( 'HUDPaint', 'DevHud3', DevHud3 )
