///PlayerDeathState(sprite);
//set death depth
depth = -10001;

//decelerate
if (abs(hspd) >= .03 or abs(vspd) >= .03){
    hspd *= decel;
    vspd *= decel;
    move_speed = 30/room_speed;
    death_alarm_length = room_speed*irandom_range(2, 4);
    death_alarm = death_alarm_length;
} else {//do death animation after decelerating
    hspd = 0;
    vspd = 0;
    img_spd = 0;
    sprite_index = argument[0];
    image_index = AnimateToAlarm(death_alarm_length, death_alarm);
}

/*
if (abs(hspd) <= 5/room_speed and abs(vspd) <= 5/room_speed){
    //set speed to 0
    hspd = 0;
    vspd = 0;
    img_spd = 0;
    //change to death sprite
    sprite_index = argument[0];
    image_index = AnimateToAlarm(death_alarm_time,death_alarm);
} else {
    death_alarm = death_alarm_time;
}

/*
//destroy weapons
if (instance_exists(obj_weapon_parent)){
    with (obj_weapon_parent){
        instance_destroy();
    }
}
