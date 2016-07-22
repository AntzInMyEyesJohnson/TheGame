///ScreenFreezeCheck();
if (global.screenfreeze > 0){
    if (change_once == true){
        hd = hspd;
        vd = vspd;
        ss = speed;
        is = image_speed;
        ps = path_speed;
        pp = path_position;
        hspd = 0;
        vspd = 0;
        speed = 0;
        image_speed = 0;
        path_speed = 0;
        change_once = false;
    }
    return true; 
} else {
    if (global.screenfreeze == 0){
        hspd = hd;    
        vspd = vd;
        speed = ss;
        image_speed = is;
        path_position = pp;
        path_speed = ps;
        hd = 0;//hspd
        vd = 0;//vspd
        ss = 0;//speed
        is = 0;//image_speed
        ps = 0;//path_speed    
    }
    change_once = true;
    return false;
}

