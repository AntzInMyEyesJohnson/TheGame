///PlayerDeathState(sprite);
/*################################
## PLACE IN PLAYERS DEATH STATE ##
##################################*/
//set death depth
depth = -10001;
//decelerate
hspd *= decel;
vspd *= decel;
move_speed = 30/room_speed;

//destroy weapons
if (instance_exists(obj_weapon_parent)){
    with (obj_weapon_parent){
        instance_destroy();
    }
}

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
