///ceHunt();

if (chaser == false){
    //perform projectile and player checks
    checkType = H;

    if (InstanceInView(self) and point_distance(x,y,player.x,player.y) < my_attack_range){
        if (!instance_exists(partner)){
            comscript = ceChargeAttack;
            exit;
        } else {
            if (partner.comscript != ceChargeAttack and partner.comscript != ceAim and partner.comscript != ceAttack){
                comscript = ceChargeAttack;
                exit;
            }
        }
    }

    //hunt down player needs pathing
    move_speed = max_speed;
    spd += max_speed/3;
    GetPathToObject(epath,spd,player);

    //sprite changes
    sprite_index = ani_move;
    img_spd = max(abs(hspd),abs(vspd))/image_number;
} else {
    //perform projectile and player checks
    checkType = HR;

    if (instance_exists(partner)){
        if (partner.comscript == ceAttack){
            comscript = ceChargeAttack;
            exit;
        }
    } else {
        if (InstanceInView(self) and point_distance(x,y,player.x,player.y) < my_attack_range){
            comscript = ceChargeAttack;
            exit;
        }
    }

    //follow partner
    move_speed = max_speed;
    spd += max_speed/3;
    if (point_distance(x,y,partner.x,partner.y) >= 40){
        GetPathToObject(epath,spd,partner);
    }

    //sprite changes
    sprite_index = ani_move;
    img_spd = max(abs(hspd),abs(vspd))/image_number;
}
