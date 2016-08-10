///ceDefend();
//continue patrolling if player dies
if (!instance_exists(player)){
    comscript = cePatrolToXY
    exit;
}

//use shield if it is not broken
if (shield_health > 0){
    checkType = Hs;
} else {
    checkType = H;
}

//continue inspect the area the player was in
if (!LoS_ToObject(player)){
    comscript = ceInspectArea;
    exit;
} 

//start attacking if within range
if (InstanceInView(self) and point_distance(x,y,player.x,player.y) < my_attack_range){
    comscript = ceChargeAttack;
    exit;
}

//move towards player (using paths not hspd and vspd)
hspd = 0;
vspd = 0;
spd += 10/room_speed;
spd = clamp(spd,0, max_speed);
GetPathToObject(spd,player);

//sprite changes
sprite_index = ani_move;
img_spd = abs(spd)/image_number;
