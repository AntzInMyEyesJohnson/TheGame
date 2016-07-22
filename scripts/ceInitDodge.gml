///ceInitDodge();

/*DOUBLE CHECK THE WALL OBJECT SPRITE MASK or FIND A WAY TO CHECK FOR A LINE ON A GRID*/

//enemy dodges (if no/shortest collision) left or right from bullet attack
var leftdir = point_direction(x,y,player.x,player.y)-90;
var rightdir = point_direction(x,y,player.x,player.y)+90;
var backdir = point_direction(x,y,player.x,player.y)-180;
var lx = lengthdir_x(120,leftdir);
var ly = lengthdir_y(120,leftdir);
var rx = lengthdir_x(120,rightdir);
var ry = lengthdir_y(120,rightdir);
var bx = lengthdir_x(120,backdir);
var by = lengthdir_y(120,backdir);
var nx = x;
var ny = y;
//find longest line between our position and wall to the left
if !(LoS_ToPoint(nx+lx,ny+ly)){
    kx = sign(lx)*4;
    ky = sign(ly)*4;
    while(!LoS_ToPoint(nx+kx,ny+ky)){
        nx += -kx;
        ny += -ky;
    }
}
//find longest line between our position and wall to the right
if !(LoS_ToPoint(nx+rx,ny+ry)){
    kx = sign(rx)*4;
    ky = sign(ry)*4;
   while(!LoS_ToPoint(nx+kx,ny+ky)){
        nx += -kx;
        ny += -ky;
    }
}
//find longest line between our position and wall to the back
if !(LoS_ToPoint(nx+bx,ny+by)){
    kx = sign(bx)*4;
    ky = sign(by)*4;
    while(!LoS_ToPoint(nx+kx,ny+ky)){
        nx += -kx;
        ny += -ky;
    }
}

//get longest line
var lm = abs(lx)+abs(ly);
var rm = abs(rx)+abs(ry);
var bm = abs(bx)+abs(by);
var maxlrb = max(lm,rm,bm);
//set xx and yy to the end point coordinates of the longest line
if (lm == maxlrb){
    xx = lx;
    yy = ly;
} else if (rm == maxlrb) {
    xx = rx;
    yy = ry;
} else {
    xx = bx;
    yy = by;
}

//start the dodge alarm
ani_alarm = alarm_len;
//play dodging sound
PlaySound(choose(snd_dodge1,snd_dodge2),.5,choose(8,9),random_range(.9,1.1));


/*
//slow down to close to a stop if moving
if (hspd != 0 or vspd != 0){
    hspd = 0;
    vspd = 0;
}

if (hitby_dmg_type == obj_projectile_melee){
    //enemy dodges directly backwards from melee attack
    xx = x + lengthdir_x(100,point_direction(player.x,player.y,x,y));
    yy = y + lengthdir_y(100,point_direction(player.x,player.y,x,y));
} else {
    //enemy dodges left or right from bullet attack
    dodge_left_right = choose(90,-90);
    xx = x + lengthdir_x(100,point_direction(player.x,player.y,x,y)+dodge_left_right);
    yy = y + lengthdir_y(100,point_direction(player.x,player.y,x,y)+dodge_left_right);
}
//subtract from react counter
react_count--;
//play dodging sound
PlaySound(choose(snd_dodge1,snd_dodge2),1,choose(6,7),random_range(.9,1.1));
//reset ani alarm for the dodge in case it isnt at -1
ani_alarm = -1;
//start getting dodge effects
comscript = ceDodge;
exit;
