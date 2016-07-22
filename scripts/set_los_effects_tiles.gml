///set_los_effects_tiles(shadow_type,shadow_type_rare, shadow_odds);
var s_tile = argument[0];
var s_tile_rare = argument[1];
var s_odds = argument[2];
var tile_width = CELL_WIDTH/2;
var tile_height = CELL_HEIGHT/2;

for (var yy_cell = 0; yy_cell < height*2; yy_cell++;) {for (var xx_cell = 0; xx_cell < width*2; xx_cell++;){
    var tile_xpos = xx_cell*tile_width;
    var tile_ypos = yy_cell*tile_height;

    //add effects like shadows
    if (grid[# xx_cell div 2, yy_cell div 2] == FLOOR or grid[# xx_cell div 2, yy_cell div 2] == DOOR) {
        var top = grid[# xx_cell div 2, (yy_cell-1) div 2] != FLOOR and grid[# xx_cell div 2, (yy_cell-1) div 2] != DOOR;

        if (top){
            var shadow = s_tile;
            if (irandom(s_odds) == s_odds){shadow = s_tile_rare;}
            tile_add(shadow,0*tile_width,0*tile_height,tile_width,tile_height,tile_xpos,tile_ypos,500);
        }
    }
}
}
