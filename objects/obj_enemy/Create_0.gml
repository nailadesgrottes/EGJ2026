f_hit = function(_id, _damage) {
	
	hp-=_damage
	
	if hp <= 0 {
		instance_destroy()
	}
	
	instance_destroy(_id);
}

// enemy_speed = 10
// move_towards_point(room_width/2, room_height/2, enemy_speed)
hp = 10;

