function scr_player_move()
{
	variavel = 0
	
	
	if keyboard_check(vk_right)
	{
		direc = 0
	}
	if keyboard_check(vk_left)
	{
		direc = 1
	}

	move = -keyboard_check(vk_left) + keyboard_check(vk_right)
 hsp = move*spd

if place_meeting(x+hsp,y, Obj_block)
{
	while !place_meeting(x+sign(hsp), y, Obj_block)
	{
		x += sign(hsp)
	}
	hsp = 0
}
x += hsp

if place_meeting(x,y+vsp, Obj_block)
{
	while !place_meeting(x,y+sign(vsp), Obj_block)
	{
		y += sign(vsp)
	}
	vsp = 0
}
y += vsp


if place_meeting(x,y+1, Obj_block) && keyboard_check_pressed(vk_space) 
{
	vsp = jspd 
}
else 
{
	vsp = grav
}


if keyboard_check(vk_right)
{
	sprite_index = Spr_playerwalk
	image_xscale = 2
}

if keyboard_check(vk_left)
{
	sprite_index = Spr_playerwalk
	image_xscale = -2
}
if !place_meeting(x,y+vsp, Obj_block)
{
	variavel = 1
}
else 
{
	variavel = 0
}

if variavel = 1
{
	image_index = 0
	sprite_index = Spr_playerjump
}

if !keyboard_check(vk_right) && !keyboard_check(vk_left) && variavel = 0
{
	image_index = 0
	sprite_index = Spr_player
}

if keyboard_check_pressed(ord("Z"))
{
	image_index = 0
	estado = scr_personagem_atacando;
	
	if direc = 0
	{
		instance_create_layer(x + 30, y - 8, "Instances", Obj_hitbox)
	}
	else if direc = 1
	{
		instance_create_layer(x - 30, y - 8, "Instances", Obj_hitbox)
	}

}

}

function scr_personagem_atacando()
{
	if direc == 0
	{
		sprite_index = Spr_attack
	    image_xscale = 2
	}
	else if direc == 1
	{
		sprite_index = Spr_attack
		image_xscale = -2
	}

if scr_fim_da_animacao()
{
	estado = scr_player_move
}

}
