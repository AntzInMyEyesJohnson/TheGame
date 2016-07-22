execute code:

///init global variables and start random level event
if (room == rm_generator){
//create random level
wall_tile_type = global.map_terrain_wall;
floor_tile_type = global.map_terrain_floor;
background_tile_type = global.map_terrain_background;
//for testing
//wall_tile_type = bg_town_wall;
//floor_tile_type = bg_town_floor;
//background_tile_type = bg_town_background;

//set the grid width and height
var width = room_width div CELL_WIDTH;
var height = room_height div CELL_HEIGHT;

//create the grid
grid = ds_grid_create(width,height);

//create pathfinding grid
grid_path = mp_grid_create(0,0,width,height,CELL_WIDTH,CELL_HEIGHT);

//fill the grid with the void
ds_grid_set_region(grid,0,0,width-2,height-2,VOID);

//random seed
randomize();

//create controller in the center of the grid
var cx = width div 2;
var cy = height div 2;
//create the player at start of round
if (global.stage == 1 and global.level == 1){
    //instance_activate_object(global.champion_selected);
    if (!instance_exists(obj_player)){
        player = instance_create(cx*CELL_WIDTH+CELL_WIDTH/2, cy*CELL_HEIGHT+CELL_HEIGHT/2,global.champion_selected);
        obj_player.given_starting_weapon = true;
    } else {
        obj_player.x = cx*CELL_WIDTH+CELL_WIDTH/2;
        obj_player.y = cy*CELL_HEIGHT+CELL_HEIGHT/2;
    }
} else {
    //instance_activate_object(global.champion_selected);
    if (!instance_exists(obj_player)){
        player = instance_create(cx*CELL_WIDTH+CELL_WIDTH/2, cy*CELL_HEIGHT+CELL_HEIGHT/2,global.champion_selected);
    } else {
        obj_player.x = cx*CELL_WIDTH+CELL_WIDTH/2;
        obj_player.y = cy*CELL_HEIGHT+CELL_HEIGHT/2;
    }
}
//weapom spawn
grid[# cx+1, cy] = FLOOR;
instance_create((cx+1)*CELL_WIDTH+CELL_WIDTH/2, cy*CELL_HEIGHT+CELL_HEIGHT/2,obj_weapon_sniper);

//give controller a random direction
var cdir = irandom(3);

//set the odds for the controller to change direction
var odds = 1;

//create the level using 400 steps
repeat (200){
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

//check the room for floor cells and place a wall at void cells that touch floor cells
for(var yy = 1;yy < height-1;yy++;){
    for(var xx = 1; xx < width-1;xx++;){
        //add walls
        if (grid[# xx, yy] == FLOOR){
            if (grid[# xx+1, yy] != FLOOR){grid[# xx+1, yy] = WALL;}
            if (grid[# xx-1, yy] != FLOOR){grid[# xx-1, yy] = WALL;}
            if (grid[# xx, yy+1] != FLOOR){grid[# xx, yy+1] = WALL;}
            if (grid[# xx, yy-1] != FLOOR){grid[# xx, yy-1] = WALL;}
        }  
    }
}

//check for walls on an 'island' and turn to floor
for(var yy = 1;yy < height-1;yy++;){
    for(var xx = 1; xx < width-1;xx++;){
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

//variables for added effect tiles
switch (floor_tile_type){
    case (bg_forest_floor):
        grass = true;
        grass_odds = 3;
        stone_tiles = false;
        effect_tiles = false;
    break;
    case (bg_town_floor):
        grass = false;
        stone_tiles = true;
        effect_tiles = true;
    break;
    case (bg_desert_floor):
        grass = true;
        grass_odds = 10;
        stone_tiles = false;
        effect_tiles = false;
    break;
} 

//reset number of enemies spawned
enemy_count = 0;

//actually drawing the grid to the display
for(var yy = 0;yy < height;yy++;){
    for(var xx = 0; xx < width;xx++;){
        if (grid[# xx, yy] == FLOOR){
            //draw floor
            tile_add(floor_tile_type,CELL_WIDTH*choose(0,1),CELL_HEIGHT*choose(0,1),CELL_WIDTH,CELL_HEIGHT,xx*CELL_WIDTH,yy*CELL_HEIGHT,1000);
            
            //draw stone
            if (stone_tiles){
                 //draw stone tiles
                tile_add(bg_town_path,CELL_WIDTH*choose(0,1,2),CELL_HEIGHT*choose(0,1),CELL_WIDTH,CELL_HEIGHT,xx*CELL_WIDTH,yy*CELL_HEIGHT,900);
            }
            
            //chance to drop a grass tile
            if (grass == true and irandom(grass_odds) == grass_odds) {
                //draw grass tiles
                tile_add(bg_grassfront,CELL_WIDTH*0,CELL_HEIGHT*0,CELL_WIDTH/2,CELL_HEIGHT/2,xx*CELL_WIDTH+choose(0,2,4,6),yy*CELL_HEIGHT+choose(0,2,4,6),-(yy*CELL_HEIGHT+CELL_HEIGHT/2));
            }
            
            //Spawn enemies
            var enemy_odds = 30-global.difficulty;
            var ex = xx*CELL_WIDTH + CELL_WIDTH/2;
            var ey = yy*CELL_HEIGHT + CELL_HEIGHT/2;
            if (point_distance(ex, ey, obj_player.x, obj_player.y) > 80){
                near_dist = 0;
                if (instance_exists(obj_enemy_parent)){
                    near_enemy = instance_nearest(ex,ey,obj_enemy_parent);
                    near_dist = point_distance(ex,ey,near_enemy.x,near_enemy.y);
                }
                if (enemy_count <= (5+global.difficulty)){
                    if (enemy_count == 0){
                        instance_create(ex, ey, choose(global.enemy_type_array[2],global.enemy_type_array[1],global.enemy_type_array[0]));
                    } else {
                        if (near_dist > 80){
                            instance_create(ex, ey, choose(global.enemy_type_array[2],global.enemy_type_array[1],global.enemy_type_array[0]));
                        }
                    }  
                    enemy_count++;
                } else {
                    if (irandom(enemy_odds) == enemy_odds){
                        instance_create(ex, ey, choose(global.enemy_type_array[2],global.enemy_type_array[1],global.enemy_type_array[0]));
                    }
                }
            }
        } else {//not a floor
            //if (grid[# xx+1, yy] == FLOOR or grid[# xx, yy+1] == FLOOR or grid[# xx-1, yy] == FLOOR or grid[# xx, yy-1] == FLOOR){
            
            //draw background tile that doesn't overlap walls
            tile_add(background_tile_type,CELL_WIDTH*choose(0,1),CELL_HEIGHT*choose(0,1),CELL_WIDTH,CELL_HEIGHT,xx*CELL_WIDTH,yy*CELL_HEIGHT,-1);
            
            //} else {
                //draw background tile so blood doesnt show outside walls
            //    tile_add(background_tile_type,CELL_WIDTH*choose(0,1),CELL_HEIGHT*choose(0,1),CELL_WIDTH,CELL_HEIGHT,xx*CELL_WIDTH,yy*CELL_HEIGHT,-3000);//so in front of blood
            //}
            mp_grid_add_cell(grid_path,xx,yy);
        }
    }
}
//#######################TILES####################################################
// Get tile sizes
var tw = CELL_WIDTH/2;
var th = CELL_HEIGHT/2;

// Add the wall tiles
for (var yy = 0; yy < height*2; yy++;) {
    for (var xx = 0; xx < width*2; xx++;) {        
        if (grid[# xx div 2, yy div 2] == FLOOR) {
            // Get the tile's x and y
            var tx = xx*tw;
            var ty = yy*th;
            
            var right = grid[# (xx+1) div 2, yy div 2] != FLOOR;
            var left = grid[# (xx-1) div 2, yy div 2] != FLOOR;
            var top = grid[# xx div 2, (yy-1) div 2] != FLOOR;
            var top2 = grid[# xx div 2, (yy-2) div 2] != FLOOR;
            var bottom = grid[# xx div 2, (yy+1) div 2] != FLOOR;
            
            var top_right = grid[# (xx+1) div 2, (yy-1) div 2] != FLOOR;
            var top_right2 = grid[# (xx+1) div 2, (yy-2) div 2] != FLOOR;
            var top_left = grid[# (xx-1) div 2, (yy-1) div 2] != FLOOR;
            var top_left2 = grid[# (xx-1) div 2, (yy-2) div 2] != FLOOR;
            var bottom_right = grid[# (xx+1) div 2, (yy+1) div 2] != FLOOR;
            var bottom_left = grid[# (xx-1) div 2, (yy+1) div 2] != FLOOR;
            
            if (right) {
                if (bottom) {
                    tile_add(wall_tile_type, tw*4, th*1, tw, th, tx+tw, ty, -ty);
                    //tile_add(wall_tile_type, tw*4, th*(1+3), tw, th, tx+tw, ty+th, -ty);
                } else if (top) {
                    if (top_right) {
                        tile_add(wall_tile_type, tw*4, th*0, tw, th, tx+tw, ty-th, -ty);
                        tile_add(wall_tile_type, tw*4, th*(0+3), tw, th, tx+tw, ty-2*th, -ty);
                    } else {
                        tile_add(wall_tile_type, tw*3, th*0, tw, th, tx, ty-th, -ty);
                        tile_add(wall_tile_type, tw*3, th*(0+3), tw, th, tx, ty-2*th, -ty);
                    }
                    tile_add(wall_tile_type, tw*0, th*1, tw, th, tx+tw, ty, -ty);
                    //tile_add(wall_tile_type, tw*0, th*(1+3), tw, th, tx+2*tw, ty, -ty);
                } else {
                    tile_add(wall_tile_type, tw*0, th*choose(1,4,4,4,4), tw, th, tx+tw, ty, -ty);
                    //tile_add(wall_tile_type, tw*0, th*(1+3), tw, th, tx+2*tw, ty, -ty);
                }
            }
            
            if (left) {
                if (bottom) {
                    tile_add(wall_tile_type, tw*3, th*1, tw, th, tx-tw, ty, -ty);
                    //tile_add(wall_tile_type, tw*3, th*(1+3), tw, th, tx-tw, ty+th, -ty);
                } else if (top) {
                    if (top_left) {
                        tile_add(wall_tile_type, tw*3, th*0, tw, th, tx-tw, ty-th, -ty);
                        tile_add(wall_tile_type, tw*3, th*(0+3), tw, th, tx-tw, ty-2*th, -ty);
                    } else {
                        tile_add(wall_tile_type, tw*4, th*0, tw, th, tx, ty-th, -ty);
                        tile_add(wall_tile_type, tw*4, th*(0+3), tw, th, tx, ty-2*th, -ty);
                    }
                    tile_add(wall_tile_type, tw*2, th*1, tw, th, tx-tw, ty, -ty);
                    //tile_add(wall_tile_type, tw*2, th*(1+3), tw, th, tx-2*tw, ty, -ty);
                } else {
                    tile_add(wall_tile_type, tw*2, th*choose(1,4,4,4,4), tw, th, tx-tw, ty, -ty);
                    //tile_add(wall_tile_type, tw*2, th*(1+3), tw, th, tx-2*tw, ty, -ty);
                }
            }
            
            if (top) {
                tile_type = 5;
                uniq_tile_chance = 5;
                if (irandom(uniq_tile_chance) == uniq_tile_chance){tile_type = 2;}
                if (!top_right) {
                    tile_add(wall_tile_type, tw*2, th*tile_type, tw, th, tx, ty-th, -ty);
                } else if (!top_left) {
                    tile_add(wall_tile_type, tw*0, th*tile_type, tw, th, tx, ty-th, -ty);
                } else {
                    tile_type = 4;
                    if (irandom(uniq_tile_chance) == uniq_tile_chance){tile_type = 1;}
                    //double the size for top tiles
                    tile_add(wall_tile_type, tw*1, th*tile_type, tw, th*2, tx, ty-2*th, -ty);
                    //add tile effect object
                    //tile_effect = instance_create(tx+tw/2,ty-2*th,obj_effect_tile);
                    //set the tile effect type
                    //tile_effect.type = tile_type;
                    //tile_effect.depth = -(ty+1);
                }
                //for shadows
                instance_create(tx,ty,obj_wall_shadow);
                /*
                if (top2){
                    if (!top_right2) {
                        //tile_add(wall_tile_type, tw*2, th*(2+3), tw, th, tx, ty-2*th, -ty);
                    } else if (!top_left2) {
                        //tile_add(wall_tile_type, tw*0, th*(2+3), tw, th, tx, ty-2*th, -ty);
                    } else {
                        //tile_add(wall_tile_type, tw*1, th*(2+3), tw, th, tx, ty-2*th, -ty);
                    }
                }
                */
            }
            
            if (bottom) {
                if (!bottom_right) {
                    tile_add(wall_tile_type, tw*2, th*0, tw, th, tx, ty+(th/4), -(ty+th*2));
                } else if (!bottom_left) {
                    tile_add(wall_tile_type, tw*0, th*0, tw, th, tx, ty+(th/4), -(ty+th*2));
                } else {
                    tile_add(wall_tile_type, tw*1, th*0, tw, th, tx, ty+(th/4), -(ty+th*2));
                }
            }           
        }        
    }
}

//for enemy sight
for (var yy = 0; yy < height*2; yy++;) {
    for (var xx = 0; xx < width*2; xx++;){
        if (grid[# xx div 2, yy div 2] == WALL){
            if (grid[# xx div 2, (yy-1) div 2] != FLOOR){
                instance_create(xx*tw,yy*th-(th/2),obj_wall);
            } else{
                instance_create(xx*tw,yy*th,obj_wall);
            }
        }
    }
}
}


Other Event: Room End:

execute code:

///destroy the grid and destroy weapons and player
if (ds_exists(grid,ds_type_grid)){
    ds_grid_destroy(grid);
    mp_grid_destroy(grid_path);
}

    


Key Press Event for K-key Key:

execute code:

///Restart the room
if ds_exists(grid,ds_type_grid){
    ds_grid_destroy(grid);
}
/*
if instance_exists(obj_player){
    with(obj_player){
        instance_destroy();
    }
}
if instance_exists(obj_enemy_parent){
    with(obj_enemy_parent){
        instance_destroy();
    }
}
if instance_exists(obj_wall){
    with(obj_wall){
        instance_destroy();
    }
}
*/
room_restart();



