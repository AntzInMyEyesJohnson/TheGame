///ceInspectArea();

//perform projectile and player checks
checkType = H;

//check that the player is still alive then inspect the area the player was just in
if (instance_exists(player)){
    xx = player.xprevious;
    yy = player.yprevious;
}

comscript = cePatrolToXY;
