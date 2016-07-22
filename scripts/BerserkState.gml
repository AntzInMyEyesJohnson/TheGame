///BerserkState();
var collide_with_enemy;
if (ability_keyc){
    if (weapon_number == 1){//shield
        if (ability_power_up){
            if (action2_timer >= action2_length){
                //shield bash
            }
        } else {
            if (action1_timer >= action1_length){
                //shield knockback
            }
        }
    } else {//2 axes
        if (ability_power_up){
            if (action2_timer >= action2_length){
                //whirlwind dash
            }
        } else {
            if (action1_timer >= action1_length){
                //spin attack
            }
        }
    }
}

if (main_keyp and attack_alarm < 0){
    AttackInit(obj_projectile_melee,.3,snd_weapon_ax2,12);
    ActionInit(x,y,obj_mouse.x,obj_mouse.y,16,0);
    collide_with_enemy = false;
}

if (attack_alarm >= 0){
    sprite_index = animate_attack;//animate_unique
    img_xsc = XscaleFlip(attack_dir);
    img_spd = 0;
    image_index = Tween(EASESMOOTHER,0,attack_length/(image_number-1),attack_alarm,attack_length);
    var dash_length = round(action1_length/2);
    if (collision_line(x,y,x+hspd,y+vspd,obj_enemy_parent,false,true)){
        collide_with_enemy = true;
    }
    if (action1_timer > dash_length or collide_with_enemy == true){
        hspd *= decel;
        vspd *= decel;
    } else{
        hspd = Tween(EASESMOOTHER,lengthdir_x(8,action_dir),lengthdir_x(1,action_dir),action1_timer,dash_length);
        vspd = Tween(EASESMOOTHER,lengthdir_y(8,action_dir),lengthdir_y(1,action_dir),action1_timer,dash_length);
    }
}

if (attack_alarm < 0){
    PlayerMovement(2);
}

/*
///FreeflowState();
var change = min(12,round(ff_dist/2));
var duration = round(ff_dist/sqrt(sqr(lengthdir_x(change,ff_dir))+sqr(lengthdir_y(change,ff_dir))));
if (round(ff_timer) <= duration){
    hspd = Tween(EASEINOUTCIRC,lengthdir_x(change/3,ff_dir),lengthdir_x(change,ff_dir),ff_timer,duration);
    vspd = Tween(EASEINOUTCIRC,lengthdir_y(change/3,ff_dir),lengthdir_y(change,ff_dir),ff_timer,duration);
} else if (round(ff_timer) <= duration + 3){
    //create slash hitbox
    if (!instance_exists(obj_projectile_melee)){
        var newff_dir = point_direction(x,y,ff_target.x,ff_target.y);
        var projectile = instance_create(x + lengthdir_x(2,newff_dir),y + lengthdir_y(2,newff_dir),obj_projectile_melee);
        projectile.creator = id;
    }
    hspd *= .5;
    vspd *= .5;
} else if (round(ff_timer) <= duration + 8){
    hspd = Tween(EASESMOOTH,0,lengthdir_x(change,ff_dir),ff_timer-(duration+3),5);
    vspd = Tween(EASESMOOTH,0,lengthdir_y(change,ff_dir),ff_timer-(duration+3),5);
} else {
    hspd = 0;
    vspd = 0;
    ff_target = noone;
    state = stateFREE;
    exit;
}

/*
if (argument_count >= 1){
    image_index = Tween(EASESMOOTH,0,(duration+8)/(image_number-1),ff_timer,duration+8);
}*/
