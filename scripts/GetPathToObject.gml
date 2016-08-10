///GetPathToObject(path_name, object, spd);
if (instance_exists(argument[1])){
	GetPathToPoint(argument[0],argument[1].x,argument[1].y,argument[2]);
}

/*
var path_id = argument[0];
var spd = argument[1];
var thing = argument[2];

if (instance_exists(thing)){
    var xx = (thing.x div CELL_WIDTH)*CELL_WIDTH + CELL_WIDTH/2;
    var yy = (thing.y div CELL_HEIGHT)*CELL_HEIGHT + CELL_HEIGHT/2;
    
    if (mp_grid_path(obj_level_generator.grid_path,path_id,x,y,xx,yy,true)){
        path_start(path_id,spd,path_action_stop,false);
    }
}
*/
