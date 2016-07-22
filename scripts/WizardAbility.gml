///WizardAbility();
if (ability_keyp){
    if (last_gravity_timer >= between_gravity_time){
            //reset last gravity timer
            last_gravity_timer = 0;
            //create gravity well
            if !instance_exists(obj_gravity_well){
                if (grid_place_meeting(obj_mouse.x,obj_mouse.y,0)){
                    var mdir = point_direction(obj_mouse.x,obj_mouse.y,x,y);
                    while(grid_place_meeting(obj_mouse.x+lengthdir_x(1,mdir),obj_mouse.y+lengthdir_y(1,mdir),0)){
                        obj_mouse.x += lengthdir_x(1,mdir);
                        obj_mouse.y += lengthdir_y(1,mdir);
                    }
                    instance_create(obj_mouse.x,obj_mouse.y,obj_gravity_well);
                } else {
                    instance_create(obj_mouse.x,obj_mouse.y,obj_gravity_well);
                }
            }
            //play sound
            ////////////////////
            
            //set state
            //state = 'gravity';
    }
} 
