///TimeStopCheck();
//set result
var result = false;
//when it is me using the time ability
if (time_exception == true){
    //immeaditely exit for time exceptions
    return result;
} else {
    if (time_stop == true){
        result = true;
        //remeber current values
        if (time_toggle == false){
            hd = hspd;
            vd = vspd;
            hs = hspeed;
            vs = vspeed;
            xh = xshunt;
            yh = yshunt;
            ss = speed;
            is = image_speed;
            hspd = 0;
            vspd = 0;
            hspeed = 0;
            vspeed = 0;
            xshunt = 0;
            yshunt = 0;
            speed = 0;
            image_speed = 0;
            time_toggle = true;
        }
    } else {
        if (time_slow != true){
            if (time_toggle == true){
                hspd = hd;    
                vspd = vd;
                hspeed = hs;
                vspeed = vs;
                xshunt = xh;
                yshunt = yh;
                speed = ss;
                image_speed = is;
                hd = 0;//hspd
                vd = 0;//vspd
                hs = 0;//hspeed
                vs = 0;//vspeed
                ss = 0;//speed
                xh = 0;//xshunt
                yh = 0;//yshunt
                is = 0;//image_speed 
                time_toggle = false;
            }
        }
    }
    /*
    if (time_slow == true){
        result = true;
        //remember current values
        if (time_toggle == false){
            hd = hspd;
            vd = vspd;
            hs = hspeed;
            vs = vspeed;
            xh = xshunt;
            yh = yshunt;
            ss = speed;
            is = image_speed;
            hspd = hd/5;
            vspd = vd/5;
            hspeed = hs/5;
            vspeed = vs/5;
            xshunt = xh/5;
            yshunt = yh/5;
            speed = ss/5;
            image_speed = is/3;
            time_toggle = true;
        }
    } else {
        if (time_stop != true){
            if (time_toggle == true){
                hspd = hd;    
                vspd = vd;
                hspeed = hs;
                vspeed = vs;
                xshunt = xh;
                yshunt = yh;
                speed = ss;
                image_speed = is;
                hd = 0;//hspd
                vd = 0;//vspd
                hs = 0;//hspeed
                vs = 0;//vspeed
                ss = 0;//speed
                xh = 0;//xshunt
                yh = 0;//yshunt
                is = 0;//image_speed 
                time_toggle = false;
            }
        }
    }*/
}

return result;



