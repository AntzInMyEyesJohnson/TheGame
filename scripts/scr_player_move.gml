///scr_player_move();
GetMovementInput();
move_speed = 4;
//accelerates and stops at max speed
hspd += (right_keyc-left_keyc)*(accel);
if (abs(hspd) > (move_speed)) {hspd = sign(hspd)*(move_speed);}
vspd += (down_keyc-up_keyc)*(accel);
if (abs(vspd) > ((move_speed-.5))) {vspd = sign(vspd)*((move_speed-.5));}

//set decel for slide and not slide
//if (is_sliding){
    //decel = .9;
    //play sliding sound
    //if ( !audio_is_playing(snd_sslide) and audio_move_alarm < 0 ) {
        //audio_move_alarm = 15;
        //scr_play_sound(snd_sslide,.6,5,.75);
    //}
    //create smoke particles when sliding
    //var dust_color = make_color_hsv(20,20,220);
    //part_particles_create_colour(global.ps,x+lengthdir_x(30,round(current_dir/30)*30),y+lengthdir_y(30,round(current_dir/30)*30),global.pt_slide,dust_color,5);
//} else {//not sliding
    decel = .65;
//}

//stopping if not pressing a left or right move button
if ( !(right_keyc xor left_keyc) ) {
    hspd *= decel;
} 

//stopping if not pressing a up or down move button
if ( !(down_keyc xor up_keyc) ) {
    vspd *= decel;
}
/*
//set is sliding to false when below .7 speed
if ( abs(speed) < .7 or 
    abs(hspd) > 0 or 
    abs(vspd) > 0 or
    state != scr_player_free )
{
    is_sliding = false;
}
/*
if (state != scr_player_hit){
if (right_keyc and 
    up_keyc){
    facing_dir = NORTHEAST;
}else if (left_keyc and
          up_keyc){
    facing_dir = NORTHWEST;
}else if (right_keyc and
          down_keyc){
    facing_dir = SOUTHEAST;
}else if (left_keyc and
          down_keyc){
    facing_dir = SOUTHWEST;
}else if (right_keyc){
    facing_dir = EAST;
}else if (left_keyc){
    facing_dir = WEST;
}else if (up_keyc){
    facing_dir = NORTH;
}else if (down_keyc){
    facing_dir = SOUTH;
}
}

/*
if (right_keyc or 
    left_keyc or 
    up_keyc or 
    down_keyc)
{
    //create dust
    if (!instance_exists(obj_dust) and (abs(hspeed) >= 1.5 or abs(vspeed) >= 1.5)) {
        if (hspeed > 0) {
            dust = instance_create(xprevious-5,yprevious+8,obj_dust);
        } else if (hspeed < 0) {
            dust = instance_create(xprevious+5,yprevious+8,obj_dust);
        }
    }
    
    //create running sound
    if ( !audio_is_playing(snd_brun_gravel) and 
         (abs(hspeed) >= 1.5 or abs(vspeed) >= 1.5) and
         audio_move_alarm < 0 )
    {
        audio_move_alarm = 23-(abs(speed));
        scr_play_sound(snd_brun_gravel,.4,5,random_range(.95,1.05));
    }
} 

if (audio_move_alarm >= 0){
    audio_move_alarm--;
}
