///InitStartingWeapon()
if (given_starting_weapon == true){
    weapon[selected_weapon_index] = starting_weapon.id;
    weapon_count++;
    starting_weapon.state = 'unholstered';
    given_starting_weapon = false;
}
