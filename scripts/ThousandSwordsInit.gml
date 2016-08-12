///ThousandSwordsInit(amount,range_x,range_y);
var toss_x,toss_y,toss_dist,toss_dir;
var amount = argument[0];
var range_x = argument[1];
var range_y = argument[2];
if (charges_left > charges_max){
    charges_left = charges_max;
}
repeat(amount){
    toss_x = irandom_range(x-range_x,x+range_x);
    toos_y = irandom_range(y-range_y,y+range_y);
    toss_dist = point_distance(x,y,toss_x,toss_y);
    TossObject(spr_weapon_katana,1,0,toss_dist,toss_dir,1,spr_weapon_katana,true);
}
