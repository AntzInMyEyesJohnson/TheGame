///RoundCorner(moving_direction);

lbb = abs(bbox_left-x);
rbb = abs(bbox_right-x);
tbb = abs(bbox_top-y);
bbb = abs(bbox_bottom-y);
/*
lbb = 12;
rbb = 12;
tbb = 25;
bbb = 25;
*/
if (argument[0] == 'lf'){
    round_top = collision_rectangle(x-lbb,y-tbb,x+rbb,y,obj_wall,false,true);
    round_bot = collision_rectangle(x-lbb,y,x+rbb,y+bbb,obj_wall,false,true);
    
    if (round_top == noone and round_bot != noone){
        y -= 1;
    } else if (round_top != noone and round_bot == noone){
        y += 1;
    }
} else if (argument[0] == 'tb'){
    round_left = collision_rectangle(x-lbb,y-tbb,x,y+bbb,obj_wall,false,true);
    round_right = collision_rectangle(x,y-tbb,x+rbb,y+bbb,obj_wall,false,true);
    
    if (round_left == noone and round_right != noone){
        x -= 1;
    } else if (round_left != noone and round_right == noone){
        x += 1;
    }
} 
