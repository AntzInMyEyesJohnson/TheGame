///set_indexes();
floor_index = ds_map_create();
floor_key = 0;
wall_index = ds_map_create();
wall_key = 0;
door_index = ds_map_create();
door_key = 0;
for(var yy = 0;yy < height;yy++;){for(var xx = 0; xx < width;xx++;){
    if (grid[# xx, yy] == WALL){
        ds_map_add(wall_index,wall_key,string(xx)+","+string(yy));
        wall_key++;
    }
    if (grid[# xx, yy] == FLOOR){
        ds_map_add(floor_index,floor_key,string(xx)+","+string(yy));
        floor_key++;
    }
    if (grid[# xx, yy] == DOOR){
        ds_map_add(door_index,door_key,string(xx)+","+string(yy));
        door_key++;
    }
}
}

half_floor_index = ds_map_create();
half_floor_key = 0;
half_wall_index = ds_map_create();
half_wall_key = 0;
half_door_index = ds_map_create();
half_door_key = 0;
for(var yy = 0;yy < height*2;yy++;){for(var xx = 0; xx < width*2;xx++;){
    if (grid[# xx div 2, yy div 2] == WALL){
        ds_map_add(half_wall_index,half_wall_key,string(xx)+","+string(yy));
        half_wall_key++;
    }
    if (grid[# xx div 2, yy div 2] == FLOOR){
        ds_map_add(half_floor_index,half_floor_key,string(xx)+","+string(yy));
        half_floor_key++;
    }
    if (grid[# xx div 2, yy div 2] == DOOR){
        ds_map_add(half_door_index,half_door_key,string(xx)+","+string(yy));
        half_door_key++;
    }
}
}
