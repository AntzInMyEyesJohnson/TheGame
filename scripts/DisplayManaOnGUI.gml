///DisplayManaOnGUI;
var yy = 42;
//time_mana meter
if (instance_exists(obj_viking)){
    if (obj_viking.berserk_juice_left >= obj_viking.berserk_juice_max) {
        draw_sprite(spr_player_juice,sprite_get_number(spr_player_juice)-1,15,yy);
    }else if (obj_viking.berserk_juice_left >= 0){
        draw_sprite(spr_player_juice,round(obj_viking.berserk_juice_left/obj_viking.berserk_juice_max*(sprite_get_number(spr_player_juice)-1)),15,yy);
    }else {
        draw_sprite_ext(spr_player_juice,0,15,yy,1,1,0,color,1);
        if (color == c_red){
            color = c_maroon;
        } else if (color == c_ltgray){
            color = c_red;
        } else if (color == c_white){
            color = c_ltgray;
        } else {
            color = c_white;
        }
    }
}

if (instance_exists(obj_gunslinger)){
    if (obj_gunslinger.deadeye_juice_left >= obj_gunslinger.deadeye_juice_max) {
        draw_sprite(spr_player_juice,sprite_get_number(spr_player_juice)-1,15,yy);
    }else if (obj_gunslinger.deadeye_juice_left >= 0){
        draw_sprite(spr_player_juice,round(obj_gunslinger.deadeye_juice_left/obj_gunslinger.deadeye_juice_max*(sprite_get_number(spr_player_juice)-1)),15,yy);
    }else {
        draw_sprite_ext(spr_player_juice,0,15,yy,1,1,0,color,1);
        if (color == c_red){
            color = c_maroon;
        } else if (color == c_ltgray){
            color = c_red;
        } else if (color == c_white){
            color = c_ltgray;
        } else {
            color = c_white;
        }
    }
}

if (instance_exists(obj_samurai)){
    if (obj_samurai.juice1_left >= obj_samurai.juice1_max) {
        draw_sprite(spr_player_juice,sprite_get_number(spr_player_juice)-1,15,yy);
    }else if (obj_samurai.juice1_left >= 0){
        draw_sprite(spr_player_juice,round(obj_samurai.juice1_left/obj_samurai.juice1_max*(sprite_get_number(spr_player_juice)-1)),15,yy);
    }else {
        draw_sprite_ext(spr_player_juice,0,15,yy,1,1,0,color,1);
        if (color == c_red){
            color = c_maroon;
        } else if (color == c_ltgray){
            color = c_red;
        } else if (color == c_white){
            color = c_ltgray;
        } else {
            color = c_white;
        }
    }
}

if (instance_exists(obj_bandit)){
    if (obj_bandit.shadow_juice_left >= obj_bandit.shadow_juice_max) {
        draw_sprite(spr_player_juice,sprite_get_number(spr_player_juice)-1,15,yy);
    }else if (obj_bandit.shadow_juice_left >= 0){
        draw_sprite(spr_player_juice,round(obj_bandit.shadow_juice_left/obj_bandit.shadow_juice_max*(sprite_get_number(spr_player_juice)-1)),15,yy);
    }else {
        draw_sprite_ext(spr_player_juice,0,15,yy,1,1,0,color,1);
        if (color == c_red){
            color = c_maroon;
        } else if (color == c_ltgray){
            color = c_red;
        } else if (color == c_white){
            color = c_ltgray;
        } else {
            color = c_white;
        }
    }
}

