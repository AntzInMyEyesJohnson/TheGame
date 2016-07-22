///PlayerSwapSecondary();
swap_keyp = keyboard_check_pressed(ord('Q'));
if (swap_keyp){
    //switch to next weapon up
    selected_weapon_index++;
    if (selected_weapon_index >= weapon_count){
        selected_weapon_index = 0;
    }
}
