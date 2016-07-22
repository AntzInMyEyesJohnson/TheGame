///LoS_ToPoint(los_x,los_y);
var /*point_collision,*/ wall_collision, los_scan_length, los_scan_max, los_x, los_y, los_starttemp_distance,los_startpos_distance;
var result = false;
los_scan_length = 16;
los_scan_max = 320;
los_x = argument[0];
los_y = argument[1];
var los_dir = point_direction(x,y,los_x,los_y);
var temp_x = x;
var temp_y = y;
var start_x = temp_x;
var start_y = temp_y;
//point_collision = grid_place_meeting(los_x,los_y,0);
wall_collision = grid_place_meeting(temp_x,temp_y,0);
los_starttemp_distance = point_distance(start_x,start_y,temp_x,temp_y);
los_startpos_distance = point_distance(start_x,start_y,los_x,los_y);
while (!wall_collision /*and !point_collision*/ and los_starttemp_distance <= los_startpos_distance){
    temp_x += lengthdir_x(los_scan_length,los_dir);
    temp_y += lengthdir_y(los_scan_length,los_dir);
    //point_collision = grid_place_meeting(los_x,los_y,0);
    wall_collision = grid_place_meeting(temp_x,temp_y,0);
    los_starttemp_distance = point_distance(start_x,start_y,temp_x,temp_y);
}

compare_distance = abs(los_startpos_distance-los_starttemp_distance);
if (!wall_collision and compare_distance <= los_scan_length){ 
    result = true;//else repeat but move line left of original a lil else repeat but move line right of original a lil
}

return result;



/*
var result = false;
if (argument_count <= 1){
    if instance_exists(argument[0]){
        var tx = argument[0].x;
        var ty = argument[0].y;
    }
} else {
    var tx = argument[1];
    var ty = argument[2];
}

if (collision_line(x,y,tx,ty,obj_wall,true,true) != noone){
    result = false;
} else {
    result = true;
}

return result;

/*
thing = argument[0];
result = false;

if (instance_exists(thing)) {
    if (collision_line(x,y,thing.x,thing.y,obj_wall,true,true) == noone){
        result = true;
    }
}

return result;
