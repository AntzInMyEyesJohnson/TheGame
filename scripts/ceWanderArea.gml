///ceWanderArea();

//perform projectile and player checks
checkType = H;

//slow down
if (hspd != 0 or vspd != 0){
    hspd *= decel;
    vspd *= decel;
}

//find a random destination to wander to within 200 pixels
xx = (irandom_range(x-300,x+300) div CELL_WIDTH)*CELL_WIDTH+CELL_WIDTH/2;
yy = (irandom_range(y-100,y+100) div CELL_HEIGHT)*CELL_HEIGHT+CELL_HEIGHT/2;


//if the random destination is within the grid then change command script
if (!grid_place_meeting(xx,yy,)){
    move_speed = 0;
    comscript = ceWanderToXY;
    exit;
}

//sprite changes
sprite_index = ani_idle;
img_spd = .1;

comscript = ceWanderArea;
