///FreeflowState();
var change = min(12,round(ff_dist/2));
var duration = round(ff_dist/sqrt(sqr(lengthdir_x(change,ff_dir))+sqr(lengthdir_y(change,ff_dir))));
if (round(ff_timer) <= duration){
    hspd = Tween(EASESMOOTH,0,lengthdir_x(change,ff_dir),ff_timer,duration);
    vspd = Tween(EASESMOOTH,0,lengthdir_y(change,ff_dir),ff_timer,duration);
} else if (round(ff_timer) <= duration + 3){
    //create slash hitbox
    if (!instance_exists(obj_projectile_melee)){
        var newff_dir = point_direction(x,y,ff_target.x,ff_target.y);
        var projectile = instance_create(x + lengthdir_x(2,newff_dir),y + lengthdir_y(2,newff_dir),obj_projectile_melee);
        projectile.creator = id;
    }
    hspd = 0;
    vspd = 0;
} else if (round(ff_timer) <= duration + 8){
    hspd = Tween(EASESMOOTHER,0,lengthdir_x(change,ff_dir),ff_timer-(duration+3),5);
    vspd = Tween(EASESMOOTHER,0,lengthdir_y(change,ff_dir),ff_timer-(duration+3),5);
} else {
    hspd = 0;
    vspd = 0;
    ff_target = noone;
    state = stateFREE;
    exit;
}

/*
if (argument_count >= 1){
    image_index = Tween(EASESMOOTH,0,(duration+8)/(image_number-1),ff_timer,duration+8);
}*/

