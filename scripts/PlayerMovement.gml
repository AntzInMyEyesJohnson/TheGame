///PlayerMovement([speed_factor]);
GetMovementInput();

//get max speed
var mspd = move_speed;
if (argument_count > 0){
    if (argument[0] > 0){
        mspd = move_speed + argument[0];
    } else if (argument[0] < 0){
        mspd = move_speed/argument[0];
    }
}

//accelerate and stops at max speed
accel = move_speed/3;
if (up_keyc){
    vspd -= accel;
    if (vspd <= max(vspd-1,-mspd)){
        vspd = max(vspd-1,-mspd);
    }
}
if (left_keyc){
    hspd -= accel;
    if (hspd <= max(hspd-1,-mspd)){
        hspd = max(hspd-1,-mspd);
    }
}
if (down_keyc){
    vspd += accel;
    if (vspd >= min(vspd+1,+mspd)){
        vspd = min(vspd+1,+mspd);
    }
}
if (right_keyc){
    hspd += accel;
    if (hspd >= min(hspd+1,+mspd)){
        hspd = min(hspd+1,+mspd);
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

//diagonal movement fix
if (hspd != 0 and vspd != 0){
    var dist = sqrt(sqr(hspd)+sqr(vspd));
    var mdist = min(mspd,dist);
    hspd = (hspd/dist)*mdist;
    vspd = (vspd/dist)*mdist;
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
