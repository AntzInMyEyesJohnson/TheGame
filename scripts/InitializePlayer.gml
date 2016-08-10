///InitializePlayer();
globalvar player_health_max,player_health,shield_health,parried,parried_enemy,parried_push,parried_click_count,parried_button;
player_health_max = 5;
player_health = player_health_max;
shield_health = 0;

parried = false;
parried_enemy = noone;
parried_push = false;
parried_click_count = 0;
parried_button = mb_none;

combatList = ds_list_create();
hitby_list = ds_list_create();//create hitbox ds list
hitby_list_timer = -1;
swords_queue = ds_queue_create();
copy_queue = ds_queue_create();
ds_queue_clear(swords_queue);
path = path_add();
state = stateFREE;
move_speed = 120/room_speed;//2
hspd = 0;
vspd = 0;
accel = 60/room_speed;
decel = .82;
combat_target = noone;
attack_dir = 0;
img_spd = 0;
img_xsc = 1;
ability_power_up = false;
special_power_up = false;
attack_power_up = false;
owner = noone;//for melee projectiles
scale_factor = .75;
part_alarm = 0;
weapon_number = 1;

//hit by projectile
incoming_khspd = 0;
incoming_kvspd = 0;
incoming_damage = 0;
incoming_creator = noone;

//grapple hook vars
grapple = noone;
grap_dir = 0;
grap_spd = 0;

//time stuff
time_exception = false;

//for commands later
action1_timer = 20;
action1_alarm = -1;
action1_length = 0;
action2_timer = 20;
action2_alarm = -1;
action2_length = 0;
ani_alarm = -1;
ani_length = 0;
action_dir = 0;
action_dist = 0;
attack_alarm = 0;
attack_length = 0;
action_combo = 0;
can_combo = false;
locked_timer = -1;
locked_length = 40;


//freeflow stuff
ff_list = ds_list_create();
ff_alarm = 0;
ff_alarm_set = room_speed*10;
ff_dir = 0;
ff_dist = 0;
ff_timer = 0;
ff_target = noone;

//weapon stuff
weapon_count = 0;
weapon_count_max = 2;
selected_weapon_index = 0;
given_starting_weapon = false;
if (instance_exists(obj_wizard)){
    starting_weapon = instance_create(x,y,obj_weapon_staff);
/*}else if (instance_exists(obj_gunslinger)){
    starting_weapon = instance_create(x,y,obj_weapon_revolver);*/
}else if (instance_exists(obj_bandit)){
    starting_weapon = instance_create(x,y,obj_weapon_knife);
/*}else if (instance_exists(obj_samurai)){
    starting_weapon = instance_create(x,y,obj_weapon_katana);*/
}/*else if (instance_exists(obj_viking)){
    starting_weapon = instance_create(x,y,obj_weapon_ax);
}*/
