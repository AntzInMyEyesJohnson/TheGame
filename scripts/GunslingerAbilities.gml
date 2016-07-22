///GunslingerAbilities()
GetAbilityInput();
if (main_keyp){
    attack_direction = point_direction(x,y,mouse_x,mouse_y);
    //PlaySound(snd_main_ability,1,10,1);
    //eject shell
    //shoot bullet
    projectile = instance_create(x,y,obj_projectile);
    projectile.creator = object_index;
   
    //kick camera back and shake
    global.screenkick = -6;    
}



