///ThousandSwords();
GetMainInput();
if (juice1_left > 0 /*and charges_left > 0*/ and spec_alarm < 0){
    SetTimeState(true,false,true);
    hspd = 0;
    vspd = 0;
    var sword_present = instance_place(obj_mouse.x,obj_mouse.y,obj_planted_sword);
    if (sword_present != noone and main_keyp){
        sword_present.isSelected = true;
        spec_alarm_length = 6;
        spec_alarm = spec_alarm_length;
        spec_spd = round(point_distance(x,y,sword_present.x,sword_present.y)/spec_alarm_length);
        spec_dir = point_direction(x,y,sword_present.x,sword_present.y);
        //charges_left--;
        spec_x = x;
        spec_y = y;
        //var enemiesInLine = collision_line_list(spec_x,spec_y,x+lengthdir_x(spec_spd*spec_alarm_length,spec_dir),y+lengthdir_y(spec_spd*spec_alarm_length,spec_dir),obj_enemy_parent,false,true);
    }
} else {
    if (spec_alarm > 0){
        hspd = lengthdir_x(spec_spd,spec_dir);
        vspd = lengthdir_y(spec_spd,spec_dir);
        /*
        var swordsInLine = collision_line_list(x,y,x+hspd,y+vspd,obj_planted_sword,false,true);
        if (swordsInLine != noone){
            for(var i = 0;i < ds_list_size(swordsInLine);i++;){
                instance_create(swordsInLine[| i].x,swordsInLine[| i].y,obj_projectile);
            }
            ds_list_destroy(swordsInLine);
        }
        */
    }
    if (spec_alarm == 1){
        var enemiesInLine = collision_line_list(spec_x,spec_y,x+lengthdir_x(spec_spd*spec_alarm_length,spec_dir),y+lengthdir_y(spec_spd*spec_alarm_length,spec_dir),obj_enemy_parent,false,true);
        if (ds_exists(enemiesInLine,ds_type_list) and enemiesInLine != noone){
            for(var i = 0;i < ds_list_size(enemiesInLine);i++;){
                var slashEnemy = instance_create(enemiesInLine[| i].x,enemiesInLine[| i].y,obj_projectile_melee);
                slashEnemy.creator = id;
                slashEnemy.specialPositioning = enemiesInLine[| i].id
            }
            ds_list_destroy(enemiesInLine);
        }
    }
    if (spec_alarm < 0){
        hspd = 0;
        vspd = 0;
        //charges_left = charges_max;
        SetTimeState(false,false,false);
        state = stateFREE;
        exit;
    }   
}

spec_alarm--;


/*

///ThousandSwordsOLD();
GetMainInput();
juice1_left -= 1/room_speed;
if (juice1_left > 0){
    //samurai cannot move while choosing attack route
    time_exception = false;
    //switch to time stop but also make sure time slow isnt running
    time_stop = true;
    time_slow = false;
    //TODO play time warp sound
    //###############
    //TODO create time warp effect
    //##################
    if (main_keyp){
        if (grid_place_meeting(obj_mouse.x,obj_mouse.y,0)){
            var mdir = point_direction(obj_mouse.x,obj_mouse.y,x,y);
            while(grid_place_meeting(obj_mouse.x+lengthdir_x(1,mdir),obj_mouse.y+lengthdir_y(1,mdir),0)){
                obj_mouse.x += lengthdir_x(1,mdir);
                obj_mouse.y += lengthdir_y(1,mdir);
            }
            //create dash queue if DNE then add the point to the queue
            ds_queue_enqueue(swords_queue,obj_mouse.x);
            ds_queue_enqueue(swords_queue,obj_mouse.y);
            //create connecting dots thousands swords effect
            swords_effect = instance_create(obj_mouse.x,obj_mouse.y,obj_effect_swords);
            swords_effect.create_number = (ds_queue_size(swords_queue)/2)-1;
        } else {
            //create dash queue if DNE then add the point to the queue
            ds_queue_enqueue(swords_queue,obj_mouse.x);
            ds_queue_enqueue(swords_queue,obj_mouse.y);
            //create connecting dots thousands swords effect
            swords_effect = instance_create(obj_mouse.x,obj_mouse.y,obj_effect_swords);
            swords_effect.create_number = (ds_queue_size(swords_queue)/2)-1;
        }
    }       
} else {
    //at spec of moving sequence toggle dequeue to true
    if (juice1_left == 0){
        dequeue_to_next_point = true;
        ds_queue_copy(copy_queue,swords_queue);
        while(!ds_queue_empty(copy_queue)){
            //set top two points to destination x and y
            copy_x = ds_queue_dequeue(copy_queue);
            copy_y = ds_queue_dequeue(copy_queue);
            var c_dist = distance_to_point(copy_x,copy_y);
            var c_dir = point_direction(x,y,copy_x,copy_y);
            TossObject(spr_weapon_katana,1,0,c_dist,c_dir,1,spr_weapon_katana,true);
            repeat(10){
                TossObject(spr_weapon_katana,1,0,irandom(c_dist+20),irandom_range(c_dir-90,c_dir+90),1,spr_axman_shadow,true);
            }
        }
    }
    //wait for all the swords to be tossed
    if (!instance_exists(obj_projectile_arc)){
        //allow the samurai to move
        time_exception = true;
        //switch from time stop to time slow
        time_stop = false;
        time_slow = true;
        //get the next position to travel to
        if (dequeue_to_next_point == true){
            global.screenzoom -= .05;
            //set top two points to destination x and y
            swords_x = ds_queue_dequeue(swords_queue);
            swords_y = ds_queue_dequeue(swords_queue);
            //set swords direction for the melee projectile
            swords_direction = point_direction(x,y,swords_x,swords_y);
            //set swords speed
            swords_speed += 100/room_speed;//7
            //clamp swords speed
            swords_speed = clamp(swords_speed,-660/room_speed,+660/room_speed);
            //spec path
            GetPathToPoint(path,swords_x,swords_y,swords_speed);
            //create slash hitbox
            var projectile = instance_create(x+lengthdir_x(8,swords_direction),y+lengthdir_y(8,swords_direction),obj_projectile_melee);
            projectile.creator = self.id;
            //reset next point toggle
            dequeue_to_next_point = false;
        }
        if (path_position == 1){
            //check to make sure there is still more points
            if (!ds_queue_empty(swords_queue)){
                dequeue_to_next_point = true;
            } else {
                //reset time change variables
                time_exception = false;
                time_stop = false;
                time_slow = false;
                //reset swords speed
                swords_speed = 360/room_speed;
                //reset the zoom factor
                global.screenzoom = 0;
                //exit state
                state = stateFREE;
            }
        }
    }
}
