///remove_island_cells(destroy_island_cells)
var dic = argument[0];
if (dic == true){//check for walls on an 'island' and turn to floor
    for(var yy = 0;yy < height;yy++;){for(var xx = 0; xx < width;xx++;){
        //change walls
        if (grid[# xx, yy] == WALL and 
            grid[# xx+1, yy] = FLOOR and 
            grid[# xx-1, yy] = FLOOR and 
            grid[# xx, yy+1] = FLOOR and 
            grid[# xx, yy-1] = FLOOR)
        {
            grid[# xx, yy] = FLOOR;
        }
    }
    }
}
