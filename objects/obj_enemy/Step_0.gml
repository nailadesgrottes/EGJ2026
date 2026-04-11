if (instance_exists(obj_player)) {
    move_towards_point(obj_player.x-35, obj_player.y-40, enemy_speed);
}

if (attackcount < attacktime) {
    attackcount++;
}