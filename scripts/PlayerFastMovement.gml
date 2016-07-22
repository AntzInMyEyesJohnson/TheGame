///PlayerFastMovement(speed_increase);
speed_factor = argument[0];
accel = move_speed/2;
//accelerates and stops at max speed
if (up_keyc){
    vspd -= accel;
    if (vspd <= max(vspd-1,-(move_speed+speed_factor))){
        vspd = max(vspd-1,-(move_speed+speed_factor));
    }
}
if (left_keyc){
    hspd -= accel;
    if (hspd <= max(hspd-1,-(move_speed+speed_factor))){
        hspd = max(hspd-1,-(move_speed+speed_factor));
    }
}
if (down_keyc){
    vspd += accel;
    if (vspd >= min(vspd+1,+(move_speed+speed_factor))){
        vspd = min(vspd+1,+(move_speed+speed_factor));
    }
}
if (right_keyc){
    hspd += accel;
    if (hspd >= min(hspd+1,+(move_speed+speed_factor))){
        hspd = min(hspd+1,+(move_speed+speed_factor));
    }
}

//stopping if not pressing a left or right move button
if ( !(right_keyc xor left_keyc) ) {
    hspd *= decel;
} 

//stopping if not pressing a up or down move button
if ( !(down_keyc xor up_keyc) ) {
    vspd *= decel;
}

//sprite stuff
if (abs(hspd) >= .25 or abs(vspd) >= .25){
    ani_face = round(point_direction(x,y,x+hspd,y+vspd)/90);
    sprite_index = animate_move[ani_face];
    img_spd = max(abs(hspd)+.5,abs(vspd)+.5)/image_number;
} else {
    sprite_index = animate_idle;
    img_spd = .075;
}
