///CanBePickedUp();
GetPickUpInput();
//weapon pick up
if (instance_exists(instance_place(x,y,obj_player))){
    if (pickup_keyp){
        //remember who owns us
        owner = obj_player.id;
        //if full inventory
        if (owner.weapon_count >= owner.weapon_count_max){
            //clear the current weapon and add the new one            
            owner.weapon[owner.selected_weapon_index] = self.id;
            //set state
            state = 'unholstered';
        } else {
            owner.selected_weapon_index = owner.weapon_count;
            //add us to our new owners weapon array
            owner.weapon[owner.selected_weapon_index] = self.id;
            //tell our owner that they have one more weapon
            owner.weapon_count++;
            //set state
            state = 'unholstered';
        }
    }
}

