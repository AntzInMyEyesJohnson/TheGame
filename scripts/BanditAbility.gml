///BanditAbility();
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
//if (parried == false){
    if (ability_keyp){
        if (ObjectInPath(x,y,obj_teleport_mouse.x,obj_teleport_mouse.y,10,obj_enemy_parent) and  
            ability_power_up == true and
            last_assassinate_timer >= between_assassinate_time){
            //reset last teleport timer so it doesnt allow for assassinations then immediate teleportation
            last_teleport_timer = 0;
            //reset last assassinate timer
            last_assassinate_timer = 0;
            //reset hspd and vspd
            hspd = 0;
            vspd = 0;
            //play sound
            PlaySound(snd_bandit_teleport,.6,choose(8,9),random_range(.9,1));
            //set state
            state = stateACTION2;
        } else {
            if (last_teleport_timer >= between_teleport_time){
                //reset last teleport timer
                last_teleport_timer = 0;
                //get teleport position
                var tele_to_mouse_dist = point_distance(x,y,obj_mouse.x,obj_mouse.y);
                //if teleporting less than the max range
                if (tele_to_mouse_dist <= 180){
                    teleport_xpos = obj_mouse.x;
                    teleport_ypos = obj_mouse.y;
                } else {//if teleporting outside max teleport range
                    teleport_xpos = x + lengthdir_x(180,point_direction(x,y,obj_mouse.x,obj_mouse.y));
                    teleport_ypos = y + lengthdir_y(180,point_direction(x,y,obj_mouse.x,obj_mouse.y));
                }
                //check that not colliding into a wall
                if (grid_place_meeting(teleport_xpos,teleport_ypos,0)){
                    while (grid_place_meeting(teleport_xpos,teleport_ypos,0)){
                        //push teleport location off of wall and towards players current position
                        teleport_xpos += lengthdir_x(1,point_direction(teleport_xpos,teleport_ypos,x,y));
                        teleport_ypos += lengthdir_y(1,point_direction(teleport_xpos,teleport_ypos,x,y));
                    }
                }
                //reset hspd and vspd
                hspd = 0;
                vspd = 0;
                //play sound
                PlaySound(snd_bandit_teleport,.6,choose(8,9),random_range(.9,1));
                //set state
                state = stateACTION1;
            }
        }
    }
//}
