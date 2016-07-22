///SamuraiAbility();

    if (last_charge_timer >= between_charge_time){
        if (ObjectInPath(x,y,obj_mouse.x,obj_mouse.y,10,obj_enemy_parent) and 
            range_finder(x,y,point_direction(x,y,obj_mouse.x,obj_mouse.y),200,obj_enemy_parent,false,true) <= 110 and 
            ability_power_up == true){
            //reset timers
            if (instance_exists(obj_weapon_katana)){obj_weapon_katana.last_slash_timer = 0;}
            last_charge_timer = 0;
            action1_timer = 0;
            //get action1 direction
            charge_direction = point_direction(x,y,target_locked.x,target_locked.y);
            //reset hspd and vspd
            hspd = 0;
            vspd = 0;
            //create slash hitbox
            var projectile = instance_create(x + lengthdir_x(8,charge_direction),y + lengthdir_y(8,charge_direction),obj_projectile_melee);
            projectile.creator = self.id;
            //play sound
            PlaySound(snd_weapon_katana2,1,choose(10,11),random_range(1,1.2));
            //set state
            state = stateACTION1;
        } else {//do a regular charge
            //reset timers
            last_charge_timer = 0;
            action1_timer = 0;
            //get special direction
            charge_direction = round(point_direction(x,y,obj_mouse.x,obj_mouse.y)/15)*15;
            //reset hspd and vspd
            hspd = 0;
            vspd = 0;
            PlaySound(snd_samurai_dash,.5,choose(6,7),random_range(.9,1.1));
            //set state
            state = stateACTION1;
        }
    }

