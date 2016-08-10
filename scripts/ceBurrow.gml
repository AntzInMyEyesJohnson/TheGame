///ceBurrow();

//immune while burrowed.
checkType = HRm;//only check for melee cause immune to ranged while buried.
mask_index = ani_idle;

if (InstanceInView(self) and point_distance(x,y,player.x,player.y) < my_attack_range and LoS_ToObject(player) == true){
    comscript = ceChargeAttack;
    mask_index = ani_attack;
    exit;
}

//sprite changes
sprite_index = ani_idle;
img_spd = .1;
