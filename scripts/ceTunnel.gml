///ceTunnel();

//continue patrolling if player dies
if (!instance_exists(player)){
    comscript = cePatrolToXY
    exit;
}

//immune to ranged (only checks for melee) cause underground
checkType = HRm;

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
spd += 20/room_speed;
spd = clamp(spd,0, max_speed+(20/room_speed));
GetPathToObject(epath,spd,player);

//sprite changes
sprite_index = ani_move;
img_spd = abs(spd)/image_number;
