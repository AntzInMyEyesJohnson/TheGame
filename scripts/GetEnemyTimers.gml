///GetEnemyStateTimers
//idle state timers
idle_timer = 0;
idle_max_time = 0;

//wander state timers
wander_timer = 0;
wander_max_time = 0;

//chase state timers
chase_timer = 0;
chase_max_time = 0;
//chase state alarm
chase_alarm = 0;
chase_alarm_max = 0;

//alert state timers
alert_timer = 0;
alert_max_time = 0;

//hit state timers
hit_timer = 0;
hit_length = 0;
hit_direction = 0;
blood_alarm = 0;
hooked = false;
hook_spd = 0;
hook_dir = 0;

//attack state alarm
attack_alarm = -1;
attack_alarm_time = 0;

//charge state alarm
charge_alarm = -1;
charge_alarm_time = 0;

//dodge state timers
dodge_timer = 0;
dodge_max_time = 0;

//for frequency of looking for player while chasing
check_chance = 0;

//for death and debris
death_by_slash = false;
death_alarm = -1;
death_alarm_time = 0;

//bounce state alarm
bounce_alarm = -1;
bounce_alarm_time = 0;

//teleport state alarm
teleport_alarm = -1;
teleport_alarm_time = 0;

//for particles
part_amount = 0;
blood_spray = false;

//move direction
move_dir = 0;
player_dir = 0;
player_move_dir = 0;

//collision var that control speed/image speed and change in time stops and slows
hspd = 0;
vspd = 0;
img_spd = 0;
img_xs = 0;
