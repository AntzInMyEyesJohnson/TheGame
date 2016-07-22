///SpecialProjectileCollisionWithWallGrid();
hspd = lengthdir_x(spd,accuracy);
vspd = lengthdir_y(spd,accuracy);

//facing 
if (hooked_enemy == 'hooked'){
    img_angle = accuracy-180;
}else {
    img_angle = accuracy;
}

//if projectile spawns inside wall then destroy it and if hook hits wall stop and flag it
if (grid_place_meeting(x,y,0)){
    if (creation_in_wall_delay > 0){
        instance_destroy();
    }
    hspd = 0;
    vspd = 0;
    hooked_wall = true;
} else {
    if (time_stop and !time_exception){
        x += hspd*(1/11);
        y += vspd*(1/11);
    }else if (time_slow and !time_exception){
        x += hspd/5;
        y += vspd/5;
    }else {
        x += hspd;
        y += vspd;
    }
}

//allow it to move if no collision when created
creation_in_wall_delay = 0;
movement_has_started = true;
