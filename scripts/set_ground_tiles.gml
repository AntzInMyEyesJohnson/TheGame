///set_ground_tiles(floor_tile,floor_odds,path_tile,path_odds,foliage_tile,foliage_odds);
floor_tile = argument[0];
f_odds = argument[1];
path_tile = argument[2];
p_odds = argument[3];
foliage_tile = argument[4];
fo_odds = argument[5];

//actually drawing the grid to the display
for(var yy = 0;yy < height;yy++;){for(var xx = 0; xx < width;xx++;){
    if (grid[# xx, yy] == FLOOR){
        //draw floor (the ground)
        if (irandom(f_odds) == f_odds)
            {tile_add(floor_tile,CELL_WIDTH*choose(0,1),CELL_HEIGHT*choose(0,1),CELL_WIDTH,CELL_HEIGHT,xx*CELL_WIDTH,yy*CELL_HEIGHT,1000);}
        
        //draw path (stone path)
        if (irandom(p_odds) == p_odds)
            {tile_add(path_tile,CELL_WIDTH*choose(0,1,2),CELL_HEIGHT*choose(0,1),CELL_WIDTH,CELL_HEIGHT,xx*CELL_WIDTH,yy*CELL_HEIGHT,900);}
        
        //draw foliage (grass,bushes)
        if (irandom(fo_odds) == fo_odds){
            //tile_width = tile_get_width(foliage_tile);
            //tile_height = tile_get_height(foliage_tile);
            tile_add(foliage_tile,CELL_WIDTH*0,CELL_HEIGHT*0,17,42,xx*CELL_WIDTH+choose(0,4,8,12),yy*CELL_HEIGHT+choose(0,4,8,12),-(yy*CELL_HEIGHT+CELL_HEIGHT*3/4));
        }
    } else if (grid[# xx, yy] == DOOR){
        instance_create(xx*CELL_WIDTH,yy*CELL_HEIGHT,obj_doorway);
    } else {//not a floor        
        //draw background tile that doesn't overlap walls
        tile_add(background_tile_type,CELL_WIDTH*choose(0,1),CELL_HEIGHT*choose(0,1),CELL_WIDTH,CELL_HEIGHT,xx*CELL_WIDTH,yy*CELL_HEIGHT,-1);
        
        mp_grid_add_cell(grid_path,xx,yy);
    }
}
}
