pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--init gets called once
--at the beginning
function _init()
	--screen clear
	cls()
	ship_x=64
	ship_y=64

	ship_x_spd=0
	ship_y_spd=0

	prjtl_x=0
	prjtl_y=0
	
	projectile_type=2
	shooting=false
end

--update is for gameplay
--(hard 30fps)
function _update()
	handle_input()
	shoot_input()
	update_projectile()
end

--draw gets called when a
--new frame gets called to
--be drawn on the screen (30fps)
function _draw()
	cls()
	print(ship_x,1,0,7)
	print(ship_y,1,7,7)
	
	spr(1,ship_x,ship_y)
	

	if shooting then
		spr(projectile_type,prjtl_x,prjtl_y)
	end
end



--imma create functions downhere



--updates spaceship's position
--along the x-axis
function x_movement()
	ship_x += ship_x_spd
	
	if ship_x < 0 then
	  ship_x = 120
	elseif ship_x > 120 then
	  ship_x = 0
	end
end

--updates spaceship's position
--along the y-axis
function y_movement()
	ship_y += ship_y_spd
	
	if ship_y < 64 then
	  ship_y = 64
	elseif ship_y > 120 then
	  ship_y = 120
	end
end


--when u press a button
--sets ship_x_spd or 
--ship_y_spd and calls
--movement to update
--position
function handle_input()
		--btn() returns true/false
	if btn(0) then
	 ship_x_spd = -2
	 x_movement() 
	end 
	if btn(1) then
	 ship_x_spd = 2 
	 x_movement() 
	end 
	if btn(2) then 
	 ship_y_spd = -2 
	 y_movement() 
	end 
	if btn(3) then
	 ship_y_spd = 2
	 y_movement() 
	end
end


--when u press 🅾️ initializes
--shooting and 1st projectile
--position on screen
function shoot_input()
	if btnp(4) and not shooting then
		shooting=true
		sfx(0)
		prjtl_x=ship_x
		prjtl_y=ship_y-9
	end
end



function update_projectile()
	prjtl_y-=projectile_type
	
	if prjtl_y<=0 then
		shooting=false
	end
end
__gfx__
00000000000220000900009000999900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000002882009a9009a909aaaa90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700002882009a9009a99aaaaaa9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000028cc8209a9009a99aaaaaa9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000288c78829a9009a99aaaaaa9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700288668829a9009a99aaaaaa9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000028558209a9009a909aaaa90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000002992000900009000999900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000000402b5402b5402a5402a540295402854027540265402554023540215401e5401b5401854015540115400d54007540035400254018500175001650015500135001350011500105000f5000d5000c500
