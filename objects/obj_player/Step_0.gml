// Movement code

var hor_movement = 0;
var vert_movement = 0;

hor_movement = keyboard_check(right_key)-keyboard_check(left_key);
vert_movement = keyboard_check(down_key)-keyboard_check(up_key);

var x_moveAmount = hor_movement*mspeed;
var y_moveAmount = vert_movement*mspeed;


if (keyboard_check(left_key)) {
	sprite_index = spr_player_left
} else if (keyboard_check(right_key)) {
	sprite_index = spr_player_right 
}  else if (keyboard_check(up_key)) {
	sprite_index = spr_player_back 
}  else if (keyboard_check(down_key)) {
	sprite_index = spr_player_idle 
} 


// Replace your sprite block with this:

// Horizontal collisions 
if !place_meeting(x+x_moveAmount, y, par_wall) {
	x+=x_moveAmount;
} else {
	while(!place_meeting(x+sign(x_moveAmount), y, par_wall)){
		x+=sign(x_moveAmount);
	}
}

// Vertical collisions 
if !place_meeting(x, y+y_moveAmount, par_wall) {
	y+=y_moveAmount;
} else {
	while(!place_meeting(x, y+sign(y_moveAmount), par_wall)){
		y+=sign(y_moveAmount);
	}
}

// Rotation code

var angle_to_mouse = point_direction(x, y, mouse_x, mouse_y);
//angle = angle_to_mouse;

// Bullet firing

if (mouse_check_button(mb_left)) {
	if fire_cooldown <= 0 {
		var b = instance_create_depth(x, y, 5, obj_bullet);
		audio_play_sound(snd_bullet, 0, false);
		b.speed = bullet_speed;
		b.direction = point_direction(x, y, mouse_x, mouse_y);
		b.image_angle = b.direction;
		fire_cooldown = fire_cooldown_max;
	}
}

// Slash firing (temporary)

else if (mouse_check_button(mb_right)) {
	if fire_cooldown <= 0 {
		var s = instance_create_depth(x, y, 5, obj_slash);
		audio_play_sound(snd_slash, 0, false);
		s.direction = point_direction(x, y, mouse_x, mouse_y);
		s.speed = slash_speed;
		s.image_angle = s.direction;
		fire_cooldown = fire_cooldown_max;
		
	}
}

// Empowered slash firing

else if (keyboard_check_pressed(vk_space)) {
	if fire_cooldown <= 0 {
		player_hp -= 5;
		var emp_s = instance_create_depth(x, y, 5, obj_emp_slash);
		audio_play_sound(snd_em_slash, 0, false);
		emp_s.direction = point_direction(x, y, mouse_x, mouse_y);
		emp_s.image_angle = emp_s.direction;
		fire_cooldown = fire_cooldown_max;
		
	}
}

// Empowered bullet firing

else if (keyboard_check(emp_bullet_key)) {
	if fire_cooldown <= 0 {
		player_hp -= 5;
		
	for (var i = 0; i <= 315; i += 45){
		var emp_b = instance_create_depth(x, y, 5, obj_emp_bullet);
		audio_play_sound(snd_em_bullet, 0, false);
		emp_b.direction = i;
		emp_b.speed = bullet_speed;
		emp_b.image_angle = emp_b.direction;
		fire_cooldown = fire_cooldown_max;
	}
		
		
		
	}
}

if fire_cooldown > 0 {
	fire_cooldown--;
} 

if player_hp <= 0{
	room_goto(rm_end_game);
}