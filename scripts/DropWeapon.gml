///DropWeapon();
result = false;
GetPickUpInput();
weapon_replacing_me = instance_place_notme(x,y,obj_weapon_parent);
if (instance_exists(weapon_replacing_me)){
        if (owner.weapon_count >= owner.weapon_count_max){
            if (pickup_keyp){
                //noone owns us
                owner = noone;
                //set state
                state = 'canbepickedup';
                result = true;
            }
        }
}
return result
