b_hit = function(_id, _damage) {
	
	hp-=_damage
	
	if hp <= 0 {
		instance_destroy()
	}
	
	instance_destroy(_id);
}

s_hit = function(_id, _damage) {
	
	hp-=_damage
	
	if hp <= 0 {
		instance_destroy()
	}
	
	//instance_destroy(_id);
}

 enemy_speed = 10
// move_towards_point(room_width/2, room_height/2, enemy_speed)

attackcount = 0
attacktime = room_speed * 1.2;
hp = 10;

enemy_speed = 2;
damage = 1;


