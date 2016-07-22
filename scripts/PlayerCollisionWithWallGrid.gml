///PlayerCollisionWithWallGrid();
/*
// collision response
if (grid_place_meeting(x+hspd,y,0)){
    var sx = sign(hspd);
    while(!grid_place_meeting(x+sx,y,0)){
        x += sx;
    }
    hspd = 0;
    show_debug_message(string(fps_real));
}else {
    if (time_stop and !time_exception){
        x += hspd/30;
        image_speed = img_spd/7;
    }else if (time_slow and !time_exception){
        x += hspd/5;
        image_speed = img_spd/3;
    }else{
        x += hspd;
        image_speed = img_spd;
    }
}

if (grid_place_meeting(x,y+vspd,0)){
    var sy = sign(vspd);
    while(!grid_place_meeting(x,y+sy,0)){
        y += sy;
    }
    vspd = 0;
    show_debug_message(string(fps_real));
}else {
    if (time_stop and !time_exception){
        y += vspd/30;
        image_speed = img_spd/7;
    }else if (time_slow and !time_exception){
        y += vspd/5;
        image_speed = img_spd/3;
    }else{
        y += vspd;
        image_speed = img_spd;
    }
}
*/

///PlayerCollisionWithWallGrid();
// collision response
if (grid_place_meeting(x+hspd,y,0)){
    var sx = sign(hspd);
    //x += hspd;
    if (sx == -1){
        x = x&~BIT_COL0;
    } else if (sx == 1){
        x = (x&~BIT_COL0)+BIT_COL1;
    }
    hspd = 0;
    show_debug_message(string(fps_real));
}else {
    if (time_stop and !time_exception){
        x += hspd/30;
        image_speed = img_spd/7;
    }else if (time_slow and !time_exception){
        x += hspd/5;
        image_speed = img_spd/3;
    }else{
        x += hspd;
        image_speed = img_spd;
    }
}

if (grid_place_meeting(x,y+vspd,0)){
    var sy = sign(vspd);
    //y += vspd;
    if (sy == 1){
        y = y&~BIT_COL0;
    } else if (sy == -1){
        y = (y&~BIT_COL0)+BIT_COL1;
    }
    vspd = 0;
    show_debug_message(string(fps_real));
}else {
    if (time_stop and !time_exception){
        y += vspd/30;
        image_speed = img_spd/7;
    }else if (time_slow and !time_exception){
        y += vspd/5;
        image_speed = img_spd/3;
    }else{
        y += vspd;
        image_speed = img_spd;
    }
}





