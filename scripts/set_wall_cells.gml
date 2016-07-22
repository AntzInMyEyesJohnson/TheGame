///set_wall_cells();

//check the room for floor cells and place a wall at void cells that touch floor cells
for(var yy = 0;yy < height;yy++;){for(var xx = 0; xx < width;xx++;){
    //add walls
    if (grid[# xx, yy] == FLOOR or grid[# xx, yy] == DOOR){
        if (grid[# xx+1, yy] != FLOOR and grid[# xx+1, yy] != DOOR){grid[# xx+1, yy] = WALL;}
        if (grid[# xx-1, yy] != FLOOR and grid[# xx-1, yy] != DOOR){grid[# xx-1, yy] = WALL;}
        if (grid[# xx, yy+1] != FLOOR and grid[# xx, yy+1] != DOOR){grid[# xx, yy+1] = WALL;}
        if (grid[# xx, yy-1] != FLOOR and grid[# xx, yy-1] != DOOR){grid[# xx, yy-1] = WALL;}
    }
}
}
