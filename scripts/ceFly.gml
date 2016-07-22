///ceFly();

//continue patrolling if player dies
if (!instance_exists(player)){
    comscript = cePatrolToXY
    exit;
}

//perform projectile and player checks
checkType = HRr;

//continue inspect the area the player was in
if (!LoS_ToObject(player)){
    comscript = ceInspectArea;
    exit;
} 

var dist_to_player = point_distance(x,y,player.x,player.y);
var dir_to_player = point_direction(x,y,player.x,player.y);
if (dist_to_player < my_attack_range){
    comscript = ceChargeAttack;
    exit;
} else if (dist_to_player < my_attack_range*4) {
    checkType = HR;
    spd += 10/room_speed;
    spd = clamp(spd,0, max_speed+(30/room_speed));
    GetPathToPoint(spd,round(player.x+lengthdir_x(my_attack_range*3,dir_to_player)),round(player.y+lengthdir_y(my_attack_range*3,dir_to_player)));  
} else {
    move_speed = max_speed+(10/room_speed);
    destdir = point_direction(x,y,player.x,player.y);
    hspd += lengthdir_x(max_speed/3,destdir);
    vspd += lengthdir_y(max_speed/3,destdir);
}

//sprite changes
sprite_index = ani_move;
img_spd = max(abs(hspd),abs(vspd))/image_number;
