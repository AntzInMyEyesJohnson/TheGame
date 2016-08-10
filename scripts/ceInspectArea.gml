///ceInspectArea();

//perform projectile and player checks
checkType = H;

//check that the player is still alive then inspect the area the player was just in
if (instance_exists(obj_player)){
    xx = (obj_player.xprevious div CELL_WIDTH)*CELL_WIDTH+CELL_WIDTH/2;
    yy = (obj_player.yprevious div CELL_HEIGHT)*CELL_HEIGHT+CELL_HEIGHT/2;
}

if (!grid_place_meeting(xx,yy,0)){
    comscript = cePatrolToXY;
} else {
    comscript = cePatrolArea;
}
