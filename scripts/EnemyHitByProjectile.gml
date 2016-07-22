///EnemyHitByProjectile
incoming_player_projectile = instance_place(x,y,obj_projectile_parent);
if (instance_exists(incoming_player_projectile)){    
    if (state != 'death'){
        //knockback
        
        //if enemy gets hooked
        if(incoming_player_projectile.object_index == obj_projectile_special){
            //increase move speed so it can follow the grapple hook
            move_speed = 600/room_speed;
            if (!hooked){
                hooked = true;
                hook_spd = 0;
                global.screenfreeze = 4;
                hit_timer = 0;
                state = 'hit';
            }
        }else {
            move_speed = 120/room_speed;
            hspd = incoming_player_projectile.hspd;
            vspd = incoming_player_projectile.vspd;
        }
        
        death_speed = max(hspd,vspd);        
        //so only hit once
        if (ds_list_find_index(hitby_list,incoming_player_projectile) == -1 and !hooked){
            //add projectile to list so it cannot damage more than once
            ds_list_add(hitby_list,incoming_player_projectile);
            
            //start hitby list timer countdown
            hitby_list_timer = room_speed*10;
            
            //damage enemy
            enemy_health -= incoming_player_projectile.damage;
            
            //play hit by projectile sound
            PlaySound(choose(snd_hit1,snd_hit2),1,12,random_range(1,1.1));
            
            //set blood splatter proportiate to the amount of damage the projectile has
            part_amount = min(incoming_player_projectile.damage*20,120);            
            
            //freeze screen
            if (incoming_player_projectile.object_index == obj_projectile_melee){
                global.screenfreeze = 8;//about 5-10 milliseconds;
                death_by_slash = true; 
            }else {
                global.screenfreeze = 6;
                death_by_slash = false;
            }        
            //determine state
            if (enemy_health > 0){
                hit_timer = 0;
                state = 'hit';
            } else {
                death_alarm = death_alarm_time;
                state = 'death';
            }
        }
    }
}



