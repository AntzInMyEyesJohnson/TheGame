///DisplayReloadOnGUI();
//init reload text colors
var rcolor1 = make_colour_hsv(40,240,205);
var rcolor2 = make_colour_hsv(40,240,205);

if (obj_player.gun_type == REVOLVER1 or obj_player.gun_type == REVOLVER2){
    if (obj_player.revolver1_bullet <= 1 or obj_player.revolver2_bullet <= 1){
        //reload flashing
        if (reload_alpha >= 2){
            alpha_rate = -.2;
        } else if (reload_alpha <= 0){
            alpha_rate = .2;    
        }
        
        reload_alpha += alpha_rate;
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_font(fnt_reload);
        draw_set_colour(c_white);
        draw_text_colour(view_wport/2,view_hport/2-200,"RELOAD",rcolor1,rcolor2,rcolor1,rcolor2,reload_alpha);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
} else if (obj_player.gun_type == SHOTGUN){
    if (obj_player.shotgun_bullet <= 0){
        //reload flashing
        if (reload_alpha >= 2){
            alpha_rate = -.2;
        } else if (reload_alpha <= 0){
            alpha_rate = .2;    
        }
        
        reload_alpha += alpha_rate;
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_font(fnt_reload);
        draw_set_colour(c_white);
        draw_text_colour(view_wport/2,view_hport/2-200,"RELOAD",rcolor2,rcolor1,rcolor2,rcolor1,reload_alpha);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}

