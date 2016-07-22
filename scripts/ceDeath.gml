///ceDeath();

//####will eventually siphon out####
//state = 'death';

//slow down
if (hspd != 0 or vspd != 0){
    hspd *= decel;
    vspd *= decel;
}

//set time spent dying alarm length and start animation alarm
alarm_len = 60;
if (ani_alarm <= -1){
    ani_alarm = alarm_len;
    
    //release the parried variables
    if (parried_enemy == self.id){
        parried_enemy = noone;
        parried = false;
    }
    //combo count for free flow
    kill_count++;
    kill_combo_count++;
    kill_combo_alarm = kill_combo_alarm_set;
    
    //slash off head if death was done by SLASH weapon type
    if (hitby_dmg_type == obj_projectile_melee){
        //create limbs flying
        CreateDebris(ani_deathsplat,true,part_amount/3,destdir,scale_factor,spr_axman_shadow,true);
        sprite_index = ani_deathbyslash;
    } else {
        sprite_index = ani_deathnormal;
    }
}

//use script to animate with respect to the time left in the alarm
image_index = AnimateToAlarm(alarm_len,ani_alarm);

//destroy object at end of animation
if (ani_alarm == 0){
    comscript = argument[COMENDDEATH];
}

ani_alarm--;
