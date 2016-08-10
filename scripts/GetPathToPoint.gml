///GetPathToPoint(path_name, final_x, final_y, speed);
var path_id = argument[0];
var xx = (argument[1] div CELL_WIDTH)*CELL_WIDTH + CELL_WIDTH/2;
var yy = (argument[2] div CELL_HEIGHT)*CELL_HEIGHT + CELL_HEIGHT/2;
var spd = argument[3];


if (mp_grid_path(obj_level_generator.grid_path,path_id,x,y,xx,yy,true)){
    path_set_kind(path_id,0);
    path_start(path_id,spd,path_action_stop,false);
}
