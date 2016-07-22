/// move_bounce_grid(grid,grid tile allowed to move on,x,y);
//
//  Makes the calling instance reverse direction if it is colliding with
//  the boundary of a given rectangle. Meant to keep an instance inside an
//  area. Swap the corners to bounce against the outside of a rectangle.
//
//      grd       grid to use, real
//      grid_tile_allowed       the grid tile object is authorized to be on, real
//      x,y        current position in game, real
//
/// GMLscripts.com/license
{
    var grd = argument[0];
    var grid_tile_allowed = argument[1];
    var xx = argument[2];
    var yy = argument[3];
    
    if (grd[# xx div CELL_WIDTH, bbox_top div CELL_HEIGHT] != grid_tile_allowed){ 
        y = ((bbox_top div CELL_HEIGHT)*CELL_HEIGHT)+(CELL_HEIGHT+6);
        vspeed *= -1;    
    }
    if (grd[# bbox_right div CELL_WIDTH, yy div CELL_HEIGHT] != grid_tile_allowed){ 
        x = ((bbox_right div CELL_WIDTH)*CELL_WIDTH)-6;
        hspeed *= -1;    
    }
    if (grd[# bbox_left div CELL_WIDTH, yy div CELL_HEIGHT] != grid_tile_allowed){ 
        x = ((bbox_left div CELL_WIDTH)*CELL_WIDTH)+(CELL_WIDTH+6);
        hspeed *= -1;    
    }
    if (grd[# xx div CELL_WIDTH, bbox_bottom div CELL_HEIGHT] != grid_tile_allowed){ 
        y = ((bbox_bottom div CELL_HEIGHT)*CELL_HEIGHT)-6;
        vspeed *= -1;
    }
    if (grd[# xx div CELL_WIDTH, yy div CELL_HEIGHT] != grid_tile_allowed){ 
        x = x + (hspeed*-1);
        y = y + (vspeed*-1);
    }
}
