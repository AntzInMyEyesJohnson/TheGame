///EnemyCollisionWithWallGrid();
hspd = clamp(hspd,max(hspd-1,-move_speed),min(hspd+1,+move_speed));
vspd = clamp(vspd,max(vspd-1,-move_speed),min(vspd+1,+move_speed));
//collision response
if (grid_place_meeting(x+hspd,y,0))
    {
    var sx = sign(hspd);
    while(!grid_place_meeting(x+sx,y,0)){
        x += sx;
    }
    hspd = 0;
    }
else
    {
    if (time_stop and !time_exception)
        {
        x += hspd/25;
        image_speed = img_spd/7;
        }        
    else if (time_slow and !time_exception)
        {
        x += hspd/5;
        image_speed = img_spd/3;
        }
    else
        {
        x += hspd;
        image_speed = img_spd;
        }
    }

if (grid_place_meeting(x,y+vspd,0))
    {
    var sy = sign(vspd);
    while(!grid_place_meeting(x,y+sy,0)){
        y += sy;
    }
    vspd = 0;
    }
else
    {
    if (time_stop and !time_exception)
        {
        y += vspd/25;
        image_speed = img_spd/7;
        }        
    else if (time_slow and !time_exception)
        {
        y += vspd/5;
        image_speed = img_spd/3;
        }
    else
        {
        y += vspd;
        image_speed = img_spd;
        }
    }
