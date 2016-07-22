///ceWanderArea();

//perform projectile and player checks
checkType = H;

//slow down
if (hspd != 0 or vspd != 0){
    hspd *= decel;
    vspd *= decel;
}

//find a random destination to wander to within 200 pixels
randomize();
xx = irandom_range(x-200,x+200);
yy = irandom_range(y-100,y+100);

//if the random destination is within the grid then change command script
if (LoS_ToPoint(xx,yy)){
    move_speed = 0;
    comscript = ceWanderToXY;
    exit;
}

//sprite changes
sprite_index = ani_idle;
img_spd = .1;

comscript = ceWanderArea;
