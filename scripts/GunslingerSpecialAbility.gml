///GunslingerSpecialAbility()
if ( (abs(hspeed) >= move_speed/2 or abs(vspeed) > move_speed/2) or
     (right_keyc or left_keyc or down_keyc or up_keyc) ){
    if (main_keyp){
         if (last_strafe_timer >= between_strafe_time){
            //reset last strafe timer
            last_strafe_timer = 0;
            //get special direction
            strafe_direction = round(point_direction(x,y,x+hspeed,y+vspeed)/45)*45;
            //reset speed
            hspd = 0;
            vspd = 0;
            //get strafe speed
            strafe_speed = 5;
            /*#play sound##
            #############*/
            //strafe
            xshunt += lengthdir_x(strafe_speed,strafe_direction);
            yshunt += lengthdir_y(strafe_speed,strafe_direction);
            /*create strafe effects
            ###############*/
        }
    }
}
       




