///PathPointAllowed(x,y);
var xx = (argument[0] div CELL_WIDTH)*CELL_WIDTH + CELL_WIDTH/2;
var yy = (argument[1] div CELL_HEIGHT)*CELL_HEIGHT + CELL_HEIGHT/2;

if (mp_grid_path(obj_level_generator.grid_path,path,x,y,xx,yy,true)){
    return true;
}else {
    return false;
}
