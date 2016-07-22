///cePatrolArea();

//perform projectile and player checks
checkType = H;

//slow down
if (hspd != 0 or vspd != 0){
    hspd *= decel;
    vspd *= decel;
}

//find a random destination to patrol to within 200 pixels
xx = irandom_range(x-300,x+300);
yy = irandom_range(y-100,y+100);

//if the random destination is within the grid then change command script
if (LoS_ToPoint(xx,yy)){
    move_speed = 0;
    ani_alarm = -1;
    comscript = cePatrolToXY;
    exit;
}

//sprite changes
sprite_index = ani_idle;
img_spd = .1;

comscript = cePatrolArea;
