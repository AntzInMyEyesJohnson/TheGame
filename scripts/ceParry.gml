///ceParry();

//perform projectile and player checks
checkType = I;

//get parried button input
parry_keyp = mouse_check_button_pressed(my_button);
parried_button = my_button;

// set time spent parrying alarm length, and reset click count
if (ani_alarm <= -1){
    alarm_len = 180;
    if (!ceInitParry()){
        exit;
    }
}
 
//if parry key is pressed (it changes after hitting parried enemy the first time)
if (mouse_check_button_pressed(mb_any)){
    if (parry_keyp){
        //create_particles(x+lengthdir_x(14,pdir),y+lengthdir_y(14,pdir),pdir,global.weapon_clash_center_part,spr_part_clash,30);
        instance_create(x+lengthdir_x(3,point_direction(x,y,player.x,player.y)),
                        y+lengthdir_y(3,point_direction(x,y,player.x,player.y)),
                        obj_effect_sword_clash);
        parried_click_count++;
        parried_push = true;
        PlaySound(snd_parry_accept,.5,12,random_range(.9,1.1));
    } else {
        //create_particles(x+lengthdir_x(14,pdir),y+lengthdir_y(14,pdir),pdir,global.weapon_clash_center_part,spr_part_clash,30);
        parried_click_count = 0;
        parried_push = false;
        ani_alarm = 1;
        PlaySound(snd_parry_deny,2,12,random_range(.9,1.1));
    }
}
    

//locks in with player
if (instance_exists(player)){
    //stop moving unless not close enough to player or player clicks and pushes back
    hspd *= decel;
    vspd *= decel;
    destdir = point_direction(x,y,player.x,player.y);
    //push back a lil if player sets global var 'parried_push' to true
    if (parried_push){
        //parried_button = my_button[cur_but];
        move_speed = 4;
        hspd = lengthdir_x(4,destdir-180);
        vspd = lengthdir_y(4,destdir-180);
        parried_push = false;
    }else {
        if (distance_to_object(player) >= 11){
            move_speed = 4;
            hspd = lengthdir_x(4,destdir);
            vspd = lengthdir_y(4,destdir);
        } else if (distance_to_object(player) <= 5){
            move_speed = 2;
            hspd = lengthdir_x(2,destdir-180);
            vspd = lengthdir_y(2,destdir-180);
        }
    }
} else {
    parried = false;
    parried_enemy = noone;
    comscript = cePatrolArea;
    exit;
}

//become vulnerable (ie stunned, slowed, frozen) and reset parried global vars if player clicks enough.
if (parried_click_count >= floor(my_click_count)){
    parried_enemy = noone;
    parried = false;
    ani_alarm = -1;
    vuln_type = vSTUNNED;
    move_speed = 0;
    comscript = ceVulnerable;
    exit;
}

//sprite change and use script to animate with respect to the time left in the alarm
sprite_index = ani_parry;
image_index = AnimateToAlarm(alarm_len,ani_alarm);

//if ani_alarm has reached this point then the parry was successful
if (round(ani_alarm) == 0){
    //turn off global var 'parried' and parried enemy
    parried_enemy = noone;
    parried = false;
    //lower movespeed so its not as big as max_speed*10
    move_speed = max_speed/2;
    //carry out the successful parry command
    comscript = argument[COMENDREACT];
    exit;
}

//alarm iterate
ani_alarm -= 1;
