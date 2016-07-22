///ChampionAbility();
var attack,proj_object,act_snd1,act_snd2,ax1,ay1,ax2,ay2;
attack = argument[0];
proj_object = argument[1];
max_dist = argument[2];
act_snd1 = argument[3];
act_snd2 = argument[4];
ax1 = x;
ay1 = y;
ax2 = obj_mouse.x;
ay2 = obj_mouse.y;

GetAbilityInput();
/*###############ABILITY UPGRADE*/
//check for the ability upgrade if not already upgraded
if (ability_power_up == false and !ds_list_empty(attached_upgrades)){
    for(var i = 0;i < ds_list_size(attached_upgrades);i++){
        if (attached_upgrades[| i] == ABILI_POW){
            //if present then bandit can assassinate
            ability_power_up = true;
            break;
        }
    }
}

if (ability_keyp){ 
    if (ability_power_up == true){
        if (ObjectInPath(ax1,ay1,ax2,ay2,obj_enemy_parent) and
            action2_timer >= p_ray[curPly,ACT_T2]){
            //reset timers
            action1_timer = 0;
            action2_timer = 0;
            //action position (instance variables)
            action_xpos = target_locked.x;
            action_ypos = target_locked.y;
            //get destination distance (action position)
            action_dist = point_distance(ax1,ay1,action_xpos,action_ypos);
            action_dir = point_direction(ax1,ay1,action_xpos,action_ypos);
            //create hitbox/projectile if ability calls for it
            if (attack == true){
                var projectile = instance_create(ax1+lengthdir_x(8,action_dir),ay1+lengthdir_y(8,action_dir),proj_object);
                projectile.creator = self.id;
                projectile.accuracy = action_dir;
            }
            //reset hspd and vspd
            hspd = 0;
            vspd = 0;
            //play sound
            PlaySound(act_snd2,.6,choose(8,9),random_range(.9,1.1));
            //set state
            state = stateACTION2;
            exit;
        } 
    }


    if (action1_timer >= p_ray[curPly,ACT_T1]){}
        //reset timer
        action1_timer = 0;
        //get destination distance (mouse position)
        action_dist = point_distance(ax1,ay1,ax2,ay2);
        action_dir = round(point_direction(ax1,ay1,ax2,ay2)/15)*15;
        //if destination less than
        if (action_dist <= max_dist){
            action_xpos = ax2;
            action_ypos = ay2;
        } else {//if action outside max dist
            action_xpos = ax1 + lengthdir_x(max_dist,action_dir);
            action_ypos = ay1 + lengthdir_y(max_dist,action_dir);
        }
        //reset hspd and vspd
        hspd = 0;
        vspd = 0;
        //play sound
        PlaySound(act_snd1,.6,choose(8,9),random_range(.9,1.1));
        //set state
        state = stateACTION1;
        exit;
    }
}



