///set_wall_tiles(wall_tile, wall_tile_rare, wall_odds);
var w_tile = argument[0];
var w_tile_rare = argument[1];
var w_odds = argument[2];
var tile_width = CELL_WIDTH/2;
var tile_height = CELL_HEIGHT/2;

// Add the wall tiles
for (var yy_cell = 0; yy_cell < height*2; yy_cell++;) {for (var xx_cell = 0; xx_cell < width*2; xx_cell++;) {        
    if (grid[# xx_cell div 2, yy_cell div 2] == FLOOR or grid[# xx_cell div 2, yy_cell div 2] == DOOR) {
        // Get the tile's x and y
        var tile_xpos = xx_cell*tile_width;
        var tile_ypos = yy_cell*tile_height;
        
        var right = grid[# (xx_cell+1) div 2, yy_cell div 2] != FLOOR and grid[# (xx_cell+1) div 2, yy_cell div 2] != DOOR;
        var left = grid[# (xx_cell-1) div 2, yy_cell div 2] != FLOOR and grid[# (xx_cell-1) div 2, yy_cell div 2] != DOOR;
        var top = grid[# xx_cell div 2, (yy_cell-1) div 2] != FLOOR and grid[# xx_cell div 2, (yy_cell-1) div 2] != DOOR;
        var top2 = grid[# xx_cell div 2, (yy_cell-2) div 2] != FLOOR and grid[# xx_cell div 2, (yy_cell-2) div 2] != DOOR;
        var bottom = grid[# xx_cell div 2, (yy_cell+1) div 2] != FLOOR and grid[# xx_cell div 2, (yy_cell+1) div 2] != DOOR;
        
        var top_right = grid[# (xx_cell+1) div 2, (yy_cell-1) div 2] != FLOOR and grid[# (xx_cell+1) div 2, (yy_cell-1) div 2] != DOOR;
        var top_right2 = grid[# (xx_cell+1) div 2, (yy_cell-2) div 2] != FLOOR and grid[# (xx_cell+1) div 2, (yy_cell-2) div 2] != DOOR;
        var top_left = grid[# (xx_cell-1) div 2, (yy_cell-1) div 2] != FLOOR and grid[# (xx_cell-1) div 2, (yy_cell-1) div 2] != DOOR;
        var top_left2 = grid[# (xx_cell-1) div 2, (yy_cell-2) div 2] != FLOOR and grid[# (xx_cell-1) div 2, (yy_cell-2) div 2] != DOOR;
        var bottom_right = grid[# (xx_cell+1) div 2, (yy_cell+1) div 2] != FLOOR and grid[# (xx_cell+1) div 2, (yy_cell+1) div 2] != DOOR;
        var bottom_left = grid[# (xx_cell-1) div 2, (yy_cell+1) div 2] != FLOOR and grid[# (xx_cell-1) div 2, (yy_cell+1) div 2] != DOOR;

        var wall = w_tile;
        if (irandom(w_odds) == w_odds){wall = w_tile_rare;}

        if (right) {
            if (bottom) {
                tile_add(wall, tile_width*4, tile_height*1, tile_width, tile_height, tile_xpos+tile_width, tile_ypos, -tile_ypos);
                //tile_add(wall, tile_width*4, tile_height*(1+3), tile_width, tile_height, tile_xpos+tile_width, tile_ypos+tile_height, -tile_ypos);
            } else if (top) {
                if (top_right) {
                    tile_add(wall, tile_width*4, tile_height*0, tile_width, tile_height, tile_xpos+tile_width, tile_ypos-tile_height, -tile_ypos);
                    //tile_add(w_tile_rare, tile_width*4, tile_height*0, tile_width, tile_height, tile_xpos+tile_width, tile_ypos-tile_height, -tile_ypos);
                } else {
                    tile_add(wall, tile_width*3, tile_height*0, tile_width, tile_height, tile_xpos, tile_ypos-tile_height, -tile_ypos);
                    //tile_add(w_tile_rare, tile_width*3, tile_height*0, tile_width, tile_height, tile_xpos, tile_ypos-tile_height, -tile_ypos);
                }
                tile_add(wall, tile_width*0, tile_height*1, tile_width, tile_height, tile_xpos+tile_width, tile_ypos, -tile_ypos);
                //tile_add(wall, tile_width*0, tile_height*(1+3), tile_width, tile_height, tile_xpos+2*tile_width, tile_ypos, -tile_ypos);
            } else {
                tile_add(wall, tile_width*0, tile_height*1, tile_width, tile_height, tile_xpos+tile_width, tile_ypos, -tile_ypos);
                //tile_add(wall, tile_width*0, tile_height*(1+3), tile_width, tile_height, tile_xpos+2*tile_width, tile_ypos, -tile_ypos);
            }
        }
        
        if (left) {
            if (bottom) {
                tile_add(wall, tile_width*3, tile_height*1, tile_width, tile_height, tile_xpos-tile_width, tile_ypos, -tile_ypos);
                //tile_add(wall, tile_width*3, tile_height*(1+3), tile_width, tile_height, tile_xpos-tile_width, tile_ypos+tile_height, -tile_ypos);
            } else if (top) {
                if (top_left) {
                    tile_add(wall, tile_width*3, tile_height*0, tile_width, tile_height, tile_xpos-tile_width, tile_ypos-tile_height, -tile_ypos);
                    //tile_add(w_tile_rare, tile_width*3, tile_height*0, tile_width, tile_height, tile_xpos-tile_width, tile_ypos-tile_height, -tile_ypos);
                } else {
                    tile_add(wall, tile_width*4, tile_height*0, tile_width, tile_height, tile_xpos, tile_ypos-tile_height, -tile_ypos);
                    //tile_add(w_tile_rare, tile_width*4, tile_height*0, tile_width, tile_height, tile_xpos, tile_ypos-tile_height, -tile_ypos);
                }
                tile_add(wall, tile_width*2, tile_height*1, tile_width, tile_height, tile_xpos-tile_width, tile_ypos, -tile_ypos);
                //tile_add(wall, tile_width*2, tile_height*(1+3), tile_width, tile_height, tile_xpos-2*tile_width, tile_ypos, -tile_ypos);
            } else {
                tile_add(wall, tile_width*2, tile_height*1, tile_width, tile_height, tile_xpos-tile_width, tile_ypos, -tile_ypos);
                //tile_add(wall, tile_width*2, tile_height*(1+3), tile_width, tile_height, tile_xpos-2*tile_width, tile_ypos, -tile_ypos);
            }
        }
        
        if (top) {
            if (!top_right) {
                tile_add(wall, tile_width*2, tile_height*2, tile_width, tile_height, tile_xpos, tile_ypos-tile_height, -tile_ypos);
            } else if (!top_left) {
                tile_add(wall, tile_width*0, tile_height*2, tile_width, tile_height, tile_xpos, tile_ypos-tile_height, -tile_ypos);
            } else {
                //double the size for top tiles
                tile_add(wall, tile_width*1, tile_height*1, tile_width, tile_height*2, tile_xpos, tile_ypos-2*tile_height, -tile_ypos);
            }
        }
        
        if (bottom) {
            if (!bottom_right) {
                tile_add(wall, tile_width*2, tile_height*0, tile_width, tile_height, tile_xpos, tile_ypos+(tile_height/4), -(tile_ypos+tile_height*2));
            } else if (!bottom_left) {
                tile_add(wall, tile_width*0, tile_height*0, tile_width, tile_height, tile_xpos, tile_ypos+(tile_height/4), -(tile_ypos+tile_height*2));
            } else {
                tile_add(wall, tile_width*1, tile_height*0, tile_width, tile_height, tile_xpos, tile_ypos+(tile_height/4), -(tile_ypos+tile_height*2));
            }
        }           
    }        
}
}
