///CombatMovement(target,[speed_factor]);
GetMovementInput();

var target = argument[0];

if (target != -1){
    var target_dir = point_direction(target.x,target.y,x,y);
    
    var mspd = move_speed;
    if (argument_count > 1){
        if (argument[1] > 0){
            mspd = move_speed + argument[1];
        } else if (argument[1] < 0){
            mspd = abs(move_speed/argument[1]);
        }
    }

    //accelerate and stops at max speed
    accel = move_speed/3;
    if (up_keyc){
        vspd += lengthdir_y(accel,target_dir-180);
        hspd += lengthdir_x(accel,target_dir-180);
    }
    if (left_keyc){
        vspd += lengthdir_y(accel,target_dir-95);
        hspd += lengthdir_x(accel,target_dir-95);
    }
    if (down_keyc){
        vspd += lengthdir_y(accel,target_dir);
        hspd += lengthdir_x(accel,target_dir);
    }
    if (right_keyc){
        vspd += lengthdir_y(accel,target_dir+95);
        hspd += lengthdir_x(accel,target_dir+95);
    }
    
    vspd = clamp(vspd,-mspd,+mspd);
    hspd = clamp(hspd,-mspd,+mspd);
    
    
    if ( !(right_keyc or left_keyc or up_keyc or down_keyc) ) {
        hspd *= decel;
        vspd *= decel;
    }
    
    /*//stopping if not pressing a left or right move button
    if ( !(right_keyc xor left_keyc) ) {
        hspd = 0;
    } 

    //stopping if not pressing a up or down move button
    if ( !(down_keyc xor up_keyc) ) {
        vspd = 0;
    }

    //diagonal movement fix
    if (hspd != 0 and vspd != 0){
        var dist = sqrt(sqr(hspd)+sqr(vspd));
        var mdist = min(mspd,dist);
        hspd = (hspd/dist)*mdist;
        vspd = (vspd/dist)*mdist;
    }*/

    //sprite stuff
    if (abs(hspd) >= .25 or abs(vspd) >= .25){
        ani_face = round(point_direction(target.x,target.y,x,y)/90);
        sprite_index = animate_action1[ani_face];
        img_spd = max(abs(hspd)+.5,abs(vspd)+.5)/image_number;
    } else {
        sprite_index = animate_idle;
        img_spd = .075;
    }
}
