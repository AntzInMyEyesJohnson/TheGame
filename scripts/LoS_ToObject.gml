///LoS_ToObject(los_object);
var los_dir, temp_x, temp_y, start_x, start_y, object_collision, wall_collision, los_object, los_scan_length, los_scan_max, los_x, los_y, los_starttemp_distance, los_startpos_distance, compare_distance;
var result = false;
los_object = argument[0];
los_scan_length = 16;
los_scan_max = 320;
if (instance_exists(los_object)){
    los_x = los_object.x;
    los_y = los_object.y;
}
los_dir = point_direction(x,y,los_x,los_y);
temp_x = x;
temp_y = y;
start_x = temp_x;
start_y = temp_y;
object_collision = instance_position(temp_x,temp_y,los_object);
wall_collision = grid_place_meeting(temp_x,temp_y,0);
los_starttemp_distance = point_distance(start_x,start_y,temp_x,temp_y);
los_startpos_distance = point_distance(start_x,start_y,los_x,los_y);
while (!wall_collision and object_collision == noone and los_starttemp_distance <= los_startpos_distance){
    temp_x += lengthdir_x(los_scan_length,los_dir);
    temp_y += lengthdir_y(los_scan_length,los_dir);
    object_collision = instance_position(temp_x,temp_y,los_object);
    wall_collision = grid_place_meeting(temp_x,temp_y,0);
    los_starttemp_distance = point_distance(start_x,start_y,temp_x,temp_y);
}

compare_distance = abs(los_startpos_distance-los_starttemp_distance);
if (object_collision != noone and compare_distance <= los_scan_length){ 
    result = true;//else repeat but move line left of original a lil else repeat but move line right of original a lil
}

return result;
