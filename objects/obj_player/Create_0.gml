left_key = ord("A")
right_key = ord("D")
up_key = ord("W")
down_key = ord("S")
emp_slash_key = ord("Q")

mspeed = 3;
player_hp = 2;

fire_cooldown = 0;
fire_cooldown_max = 20;

bullet_speed = 20;
slash_speed = 1;

angle = 0;

p_hit = function(_id, _damage) {

    player_hp-=_damage

    if player_hp <= 0 {
        instance_destroy();
        room_goto(rm_end_game);

    }
}