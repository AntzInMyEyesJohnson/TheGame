///ButtonUpgradePressed(x,y,upgrade_type);
result = false;
xx = argument[0];
yy = argument[1];
up_type = argument[2];
//find corners of our button
BoxTop = yy - 50;
BoxBottom = yy + 50;
BoxLeft = xx - 100;
BoxRight = xx + 100;

if(device_mouse_x_to_gui(0) > BoxLeft and device_mouse_x_to_gui(0) < BoxRight and device_mouse_y_to_gui(0) > BoxTop and device_mouse_y_to_gui(0) < BoxBottom){
    image_alpha = 1;
    draw_set_alpha(1);
    if (main_keyp){
        result = true;
    }
} else {
    draw_set_alpha(.65);
    image_alpha = .65;
}

//draw the rectangle
draw_rectangle_colour(BoxLeft,BoxTop,BoxRight,BoxBottom,c_ltgray,c_ltgray,c_ltgray,c_ltgray,false);

//draw_sprite_ext(sprite_index,0,xx,yy,1,1,0,c_white,image_alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_select);
draw_set_colour(c_white);
draw_text(xx,BoxBottom+30,upgrade[up_type,text]);
draw_set_halign(fa_top);
draw_set_valign(fa_left);

return result;
