///ProjectileBounceCollisionWithWallGrid();
//decelerate
hspd *= decel;
vspd *= decel;

//if projectile spawns inside wall then destroy it
if (grid_place_meeting(x+hspd,y+vspd,0)){
    //create wall hit effect
    EffectWallHit();
    if (creation_in_wall_delay > 0){
        instance_destroy();
    }
}

//keep track of bounces and create wall hit effect
//if (grid_place_meeting(x+hspd,y,0) or grid_place_meeting(x,y+vspd,0)){
    
//}
    
if (grid_place_meeting(x+hspd,y,0)){
    //turn off trail if on
    projectile_trail = false;
    
    //horizontal
    old_hspd = hspd;
    var sx = sign(old_hspd);
    //change hspd and vspd
    while (!grid_place_meeting(x+sx,y,0)){
        x += sx;
    }
    //hspd = 0;
    hspd = -old_hspd;
    //decelerate more by a sixth of previous deceleration
    decel -= decel/5;
} else {
    if (time_stop and !time_exception)
        {
        x += hspd/11;
        }        
    else if (time_slow and !time_exception)
        {
        x += hspd/5;
        }
    else
        {
        x += hspd;
        }
}

if (grid_place_meeting(x,y+vspd,0)){
    //turn off trail if on
    projectile_trail = false;

    //vertical
    old_vspd = vspd;
    var sy = sign(old_vspd);
    //change hspd and vspd
    while (!grid_place_meeting(x,y+sy,0)){
        y += sy;
    }
    //vspd = 0;
    vspd = -old_vspd;
    //decelerate more by a sixth of previous deceleration
    decel -= decel/5;
} else {
    if (time_stop and !time_exception)
        {
        y += vspd/11;
        }        
    else if (time_slow and !time_exception)
        {
        y += vspd/5;
        }
    else
        {
        y += vspd;
        }
}
//allow it to move if no collision when created
creation_in_wall_delay = 0;
movement_has_started = true;
   
