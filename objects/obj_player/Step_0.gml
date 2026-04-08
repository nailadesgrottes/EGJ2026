// Movement code

var hor_movement = 0;
var vert_movement = 0;

hor_movement = keyboard_check(right_key)-keyboard_check(left_key);
vert_movement = keyboard_check(down_key)-keyboard_check(up_key);

x+=hor_movement*mspeed;
y+=vert_movement*mspeed;

// Rotation code

var angle_to_mouse = point_direction(x, y, mouse_x, mouse_y);
image_angle = angle_to_mouse;

// Bullet firing

if (mouse_check_button(mb_left)) {
	if fire_cooldown <= 0
		var b = instance_create_depth(x, y, 5, obj_bullet);
		fire_cooldown = fire_cooldown_max;
}

if fire_cooldown > 0 {
	fire_cooldown--;
} 
