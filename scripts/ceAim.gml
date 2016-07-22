///ceAim();

//check that the player is still alive and patrol if he isnt
if (!instance_exists(player)){
    comscript = cePatrolToXY
    exit;
}

//perform projectile and player checks
checkType = H;

//set the attacking direction
xx = player.x;
yy = player.y;

//ceAttackType predetermined in create event of object
shot_count = 0;
comscript = ceChargeAttack;
