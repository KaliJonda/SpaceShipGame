pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--init gets called once
--at the beginning
function _init()
	--screen clear
	cls()
	x_player_position=64
	y_player_position=64	
	x_speed=0
	y_speed=0
end

--update is for gameplay
--(hard 30fps)
function _update()
	handle_input()
end

--draw gets called when a
--new frame gets called to
--be drawn on the screen (30fps)
function _draw()
	--drawing 1st sprite
	--on middle screen
	
	cls()
	
	print(x_player_position,1,0)
	print(y_player_position,1,7)
	
	spr(001,x_player_position,y_player_position)
end



--imma create functions downhere
function x_movement()
	x_player_position += x_speed
	
	if x_player_position < 0 then
	  x_player_position = 0
	elseif x_player_position > 120 then
	  x_player_position = 120
	end
end

function y_movement()
	y_player_position += y_speed
	
	if y_player_position < 64 then
	  y_player_position = 64
	elseif y_player_position > 120 then
	  y_player_position = 120
	end
end


--si pulsas un boton da un
--valor a x_speed o y_speed
--y llama a movimiento para
--actualizar la posicion
function handle_input()
		--btn() devuelve true/false
		--true vale 1, false vale 0
	if btn(0) then
	 x_speed = -1
	 x_movement() 
	end 
	if btn(1) then
	 x_speed = 1 
	 x_movement() 
	end 
	if btn(2) then 
	 y_speed = -1 
	 y_movement() 
	end 
	if btn(3) then
	 y_speed = 1
	 y_movement() 
	end
end
__gfx__
00000000000220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000002882000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700002882000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000028cc8200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000288c78820000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700288668820000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000028558200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000002992000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
