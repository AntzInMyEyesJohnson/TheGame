///PlayerHeavyMovement();
var factor = 2;
if (argument_count > 0){
    factor = argument[0];
}
accel = move_speed/(3*factor);
//accelerates and stops at max speed
if (up_keyc){
    vspd -= accel;
    if (vspd <= max(vspd-1,-move_speed/factor)){
        vspd = max(vspd-1,-move_speed/factor);
    }
}
if (left_keyc){
    hspd -= accel;
    if (hspd <= max(hspd-1,-move_speed/factor)){
        hspd = max(hspd-1,-move_speed/factor);
    }
}
if (down_keyc){
    vspd += accel;
    if (vspd >= min(vspd+1,+move_speed/factor)){
        vspd = min(vspd+1,+move_speed/factor);
    }
}
if (right_keyc){
    hspd += accel;
    if (hspd >= min(hspd+1,+move_speed/factor)){
        hspd = min(hspd+1,+move_speed/factor);
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
