///set_hub_doors(map_gateways,entrance_x,entrance_y);
var map_gates = argument[0];
var entrance_x = argument[1];
var entrance_y = argument[2];
var xx = 0;
var yy = 0;
var rx = irandom(width);
var ry = irandom(height);

if (map_gates == 4){    
    //DOORS leading to a random map
    doorList = ds_list_create();
    ds_list_add(doorList,PURPLEMAP,BLUEMAP,YELLOWMAP,GREENMAP);
    ds_list_shuffle(doorList);
    
    //right door
    grid[# width-2, height div 2] = DOOR;
    xx = (width-2)*CELL_WIDTH;
    yy = (height div 2)*CELL_HEIGHT;
    MapArray[0] = doorList[| 0];
    var door = instance_create(xx,yy,obj_doorway);
    door.face = 0;
    
    //up door
    grid[# width div 2, 1] = DOOR;
    xx = (width div 2)*CELL_WIDTH;
    yy = (1)*CELL_HEIGHT;
    MapArray[1] = doorList[| 1];
    var door = instance_create(xx,yy,obj_doorway);
    door.face = 1;
    
    //right door
    grid[# 1, height div 2] = DOOR;
    xx = (1)*CELL_WIDTH;
    yy = (height div 2)*CELL_HEIGHT;
    MapArray[2] = doorList[| 2];
    var door = instance_create(xx,yy,obj_doorway);
    door.face = 2;
    
    //right door
    grid[# width div 2, height-2] = DOOR;
    xx = (width div 2)*CELL_WIDTH;
    yy = (height-2)*CELL_HEIGHT;
    MapArray[3] = doorList[| 3];
    var door = instance_create(xx,yy,obj_doorway);
    door.face = 3;
    
    ds_list_destroy(doorList);
} 
else if (map_gates == 2)
{
    //entrance door
    if (grid[# entrance_x, entrance_y] == FLOOR){
        grid[# entrance_x, entrance_y] = DOOR;
        var door = instance_create(entrance_x*CELL_WIDTH,entrance_y*CELL_HEIGHT,obj_doorway);
        door.face = 4; //HUBMAP
    }
    
    //random upgrade door
    while (grid[# rx, ry] != FLOOR){
        rx = irandom(width);
        ry = irandom(height);
    }
    
}



