///HitCheck(hitby_hitbox);
//returns whether a projectile has hit us
var _continue = false;
var hitby_hitbox = argument[0];
var incoming_player_projectile = instance_place(x,y,hitby_hitbox);

if(incoming_player_projectile){
    if (ds_list_find_index(hitby_list,incoming_player_projectile) == -1){
        //add the projectile to the list of the ones that have already hit us
        ds_list_add(hitby_list,incoming_player_projectile);
        hitby_list_alarm = room_speed*10;

        //do damage
        enemy_health -= incoming_player_projectile.damage;
        hitby_dmg_type = incoming_player_projectile.object_index;

        //screenfreeze effect
        if (hitby_dmg_type == obj_projectile_melee){
            global.screenfreeze = 6;
        } else {
            global.screenfreeze = 3;
        }

        //set particles
        destdir = point_direction(player.x,player.y,x,y);
        part_amount = min(incoming_player_projectile.damage*20,100);
        CreateParticle(global.pt_blood,destdir,part_amount,0);

        //set knockback spd to zero
        hspd = 0;
        vspd = 0;
        knockback = min(incoming_player_projectile.damage,2);

        //reset ani alarm so it doesn't skip the check for setting it and the blood particles later
        ani_alarm = -1;
        
        _continue = true;
    }
}

return _continue;
