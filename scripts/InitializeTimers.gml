///InitializeTimers();
//gunslinger
lockon_juice_left = 120/room_speed;
lockon_juice_max = 2;
deadeye_juice_left = 120/room_speed;
deadeye_juice_max = 2;
//samurai
if (object_index == obj_gunslinger){
    juice1_max = 3;
    juice1_left = 180/room_speed;
    juice2_max = -1;
    juice2_left = -1;
}

//samurai
if (object_index == obj_samurai){
    juice1_max = 3;
    juice1_left = 180/room_speed;
    juice2_max = -1;
    juice2_left = -1;
}
//swords_juice_left = 180/room_speed;
//swords_juice_max = 3;
//between_charge_time = .4;
//between_attack_time = .4;
//last_charge_timer = 0;
//wizard
between_gravity_time = 8;
last_gravity_timer = 8;
//bandit
shadow_juice_left = 180/room_speed;
shadow_juice_max = 3;
between_assassinate_time = .4;
last_assassinate_timer = .4;
between_teleport_time = .5;
last_teleport_timer = .5;

//viking
if (object_index == obj_viking){
    juice1_max = 10;
    juice1_left = 600/room_speed;
    juice2_max = 0;
    juice2_left = 0;
}
//shield_juice_left = 360/room_speed;
//shield_juice_max = 6;//5 seconds
//berserk_juice_left = 180/room_speed;
//berserk_juice_max = 3;
//between_shield_time = .5;
//last_shield_timer = .5;
//between_deflect_time = .75;
//last_deflect_timer = .75;
//all
hit_timer = 0;
hit_length = 10;
death_alarm_time = room_speed*3;
death_alarm = death_alarm_time;
