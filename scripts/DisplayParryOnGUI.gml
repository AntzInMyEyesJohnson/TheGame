///DisplayReloadOnGUI();
//init vars
var rcolor1,rcolor2,parry_string;
//init parry text colors
rcolor1 = make_colour_hsv(40,240,240);
rcolor2 = make_colour_hsv(40,240,240);


if (parried){
    //reset alpha if parry accept
    if (pcounter != parried_click_count){
        parry_alpha = 1.5;
        pcounter = parried_click_count;
    }
    //flash green if parry is accepted //and red if not
    if (parry_alpha >= 1.3){
        rcolor1 = c_lime;
        rcolor2 = c_lime;
        parry_string = "SUCCESS!";
    } else {//gives a lil delay befor string changes
        //get strings
        if(parried_button == mb_left){
            parry_string = "LEFT!";
        } else if (parried_button == mb_right){
            parry_string = "RIGHT!";
        } else {
            parry_string = "ANY!";
        }
    } 
    //set draw shit
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_parried);
    draw_set_colour(c_white);
    draw_text_colour(view_wport/2,view_hport/2-100,parry_string,rcolor1,rcolor2,rcolor1,rcolor2,parry_alpha);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    //parry fade but comes back if button pressed
    parry_alpha -= .01;
} else {
    parry_alpha = 1;
}
