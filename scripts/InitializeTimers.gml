///InitializeTimers();
//gunslinger
if (object_index == obj_gunslinger){
    juice1_max = 3;
    juice1_left = 180/room_speed;
    juice2_max = -1;
    juice2_left = -1;
}

//samurai
if (object_index == obj_samurai){
    juice1_max = 10;
    juice1_left = 600/room_speed;
    juice2_max = -1;
    juice2_left = -1;
}

//viking
if (object_index == obj_viking){
    juice1_max = 10;
    juice1_left = 600/room_speed;
    juice2_max = 6;
    juice2_left = 360/room_speed;
    //between_shield_time = .5;
    //last_shield_timer = .5;
    //between_deflect_time = .75;
    //last_deflect_timer = .75;
}

//all
hit_timer = 0;
hit_length = .2;
death_alarm_length = room_speed*3;
death_alarm = death_alarm_length;
