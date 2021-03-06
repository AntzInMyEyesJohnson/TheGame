Information about object: obj_assassin
Sprite: spr_assassin_idle
Solid: false
Visible: true
Depth: 
0
Persistent: false
Parent: obj_enemy_parent
Children: 
Mask: spr_assassin_idle

No Physics Object

Create Event:

execute code:

///init enemy
comscript = ceWanderArea;
ani_alarm = -1;
ani_length = 0;
ani_idle = spr_assassin_idle;
ani_move = spr_assassin_move;
ani_charge = spr_assassin_charge;
ani_attack = spr_assassin_attack;
ani_hit = spr_assassin_hit;
ani_dodge = spr_assassin_dodge;
//ani_parry = spr_assassin_parry;
ani_retreat = spr_assassin_retreat;
ani_teleport = spr_assassin_teleport;
ani_vulnerable = spr_assassin_vulnerable;
ani_deathnormal = spr_assassin_deathnormal;
ani_deathbyslash = spr_assassin_deathbyslash;
ani_deathsplat = spr_assassin_death_splat;
sound_eattack = //snd_ninja_shuriken1;
vuln_type = vSTUNNED;
my_click_count = 0;
my_attack_range = 40;
react_count = 1;
max_speed = 75/room_speed;
move_speed = max_speed;//
enemy_health_max = 3;
enemy_health = enemy_health_max;
blood_type = global.pt_blood;
scale_factor = 1;

blood_alarm = 0;
vulnerable = false;
destdir = 0;
img_xsc = 0;
hspd = 0;
vspd = 0;
xx = x;
yy = y;
decel = .85;
image_speed = 0;
img_spd = 0;

InitializeScreenFreezeVariables();
hitby_list = ds_list_create();//create hitbox ds list
hitby_list_timer = -1;

event_inherited();


Destroy Event:

execute code:

///destroy list and draw to surface
if (ds_exists(hitby_list,ds_type_list)){
    ds_list_destroy(hitby_list);
}

//set death depth
depth = -(y+8);
//draw to surface
surface_set_target(obj_surface.surf);
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_gray,image_alpha)
surface_reset_target();


Step Event:

execute code:

///run command and collisions with grid
depth = -y;
//screen freeze check
if (ScreenFreezeCheck()){exit;}

//execute commands
//reset move speed for when it gets changed in script;
move_speed = max_speed;
//execute commands
//## MAIN = COMSCRIPT ######## -the command that will run until completion
script_execute(comscript,
    //## ARG0 = COMALERT ######### -the alert command that will run when alerted to player
    /*COMALERT:*/ceTeleport,

    //## ARG1 = COMENDATTACK ##### -the command that will run at completion of attacking
    /*COMENDATTACK:*/ceRetreat,

    //## ARG2 = COMREACTRESPONSE # -the reaction command that will run when confronted with players projectile
    /*COMREACTRESPONSE:*/ceInitDodge,

    //## ARG3 = COMENDREACT ###### -the command that will run at completion of reaction (ie ceDodgeAttack)
    /*COMENDREACT:*/ceTeleport,

    //## ARG4 = COMENDVULN ######## -the command that will run at completion of being vulnerable (ie frozen, stunned, dazed)
    /*COMENDVULN:*/ceWanderArea,

    //## ARG5 = COMENDHIT ######## -the command that will run at completion of getting hit
    /*COMENDHIT:*/ceRetreat,

    //## ARG6 = COMENDDEATH ###### -the command that will run at completion of dying
    /*COMENDDEATH:*/ceDestroy,

    //## ARG7 = VARATKTYPE ### -the hitbox object that will be created while attacking
    /*VARATKTYPE:*/obj_enemy_projectile_melee,

    //## ARG8 = VARATKNUMBER ### -the number of hitbox objects to create while attacking
    /*VARATKNUMBER:*/2,

    //## ARG9 = VARATKBUFFER ### -whether there is a buffer between hitbox object creation or creation all at once
    /*VARATKBUFFER:*/true);

//maintain facing direction
if (round(destdir/180) == 1){img_xsc = -1;}else {img_xsc = 1;}
img_xsc = sign(img_xsc)*scale_factor;
image_xscale = img_xsc;
image_yscale = sign(image_yscale)*scale_factor;

EnemyCollisionWithWallGrid();

HitbyListManagement();



Other Event: Room End:

execute code:

///destroy list
if (ds_exists(hitby_list,ds_type_list)){
    ds_list_destroy(hitby_list);
}


Draw Event:

execute code:

///draw assassin
if (comscript != ceDeath and comscript != ceDestroy){
    draw_sprite_ext(spr_assassin_shadow,0,x,y,image_xscale,image_yscale,0,c_white,.4);
}
draw_self();





