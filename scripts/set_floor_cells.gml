///set_floor_cells(start_x,start_y,change_direction_odds,map_size);
var cx = argument[0];
var cy = argument[1];
var odds = argument[2];
var size = argument[3];
var cdir = irandom(3);

if (size == 0){
    ds_grid_set_region(grid,2,2,width-3,height-3,FLOOR);
    exit;
} else {
    //create the level using mapsize steps
    repeat (size){
        //place a floor tile at the controller position
        grid[# cx, cy] = FLOOR;
        
        //randomize the direction of the controller
        if (irandom(odds) == odds) {
            cdir = irandom(3);
        }
        
        //set new direction and move the controller
        var xdir = lengthdir_x(1,cdir*90);
        var ydir = lengthdir_y(1,cdir*90);
        cx += xdir;
        cy += ydir;
        
        //make sure controller doesnt move outside 1 cell inside room
        cx = clamp(cx,1,width-2);
        cy = clamp(cy,1,height-2);
    }
}
