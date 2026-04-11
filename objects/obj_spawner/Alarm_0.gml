if room_speed != 0 {

rand_x = random(room_width);
rand_y = random(room_height);

instance_create_layer(rand_x, rand_y, "Instances", obj_enemy);
alarm[0] = (room_speed * 2) + random(room_speed * 3);

}