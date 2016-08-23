///DisplayChargesOnGUI;
var yy = 48;
var xx = 54;
if (instance_exists(obj_samurai)){
    if (obj_samurai.charges_left >= obj_samurai.charges_max) {
        draw_sprite(spr_blood_splatter,sprite_get_number(spr_blood_splatter)-1,xx,yy);
    }else if (obj_samurai.charges_left >= 0){
        draw_sprite(spr_blood_splatter,round(obj_samurai.charges_left/obj_samurai.charges_max*(sprite_get_number(spr_blood_splatter)-1)),xx,yy);
    }else {
        draw_sprite_ext(spr_blood_splatter,0,xx,yy,1,1,0,color,1);
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
