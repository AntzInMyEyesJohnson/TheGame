///ActionInit(x1,y1,x2,y2,action_length,action_sound);
var ax1,ay1,ax2,ay2,action_snd;
ax1 = argument[0];
ay1 = argument[1];
ax2 = argument[2];
ay2 = argument[3];
action1_length = argument[4];
action2_length = argument[4];
shield_health = argument[4]/4;//=4
action_snd = argument[5];

//reset timers
action1_timer = 0;
action2_timer = 0;

//get destination distance (action position)
action_dist = point_distance(ax1,ay1,ax2,ay2);
action_dir = point_direction(ax1,ay1,ax2,ay2);

//reset hspd and vspd
hspd = 0;
vspd = 0;

//play sound
if (action_snd != 0){
    PlaySound(action_snd,.6,choose(8,9),random_range(.9,1.1));
}
            
       
    


    
        

