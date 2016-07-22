///ceChase();

//continue patrolling if player dies
if (!instance_exists(player)){
    comscript = cePatrolToXY
    exit;
}

//perform projectile and player checks
checkType = H;

//continue inspect the area the player was in
if (!LoS_ToObject(player)){
    comscript = ceInspectArea;
    exit;
} 

if (point_distance(x,y,player.x,player.y) < my_attack_range){
    comscript = ceChargeAttack;
    exit;
}

//slightly increase move speed and continue to patrol if player not spotted and not within attack range
move_speed = max_speed+(10/room_speed);
destdir = point_direction(x,y,player.x,player.y);
hspd += lengthdir_x(max_speed/3,destdir);
vspd += lengthdir_y(max_speed/3,destdir);

//sprite changes
sprite_index = ani_move;
img_spd = max(abs(hspd),abs(vspd))/image_number;
