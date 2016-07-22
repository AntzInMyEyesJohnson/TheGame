///ceMirage();

//wander if just a mirage
if (mirage == true){
    comscript = ceWanderArea;
    exit;
} else {
    //no more than 4 mirages
    if (mirage_array[3] != noone and mirage_array[2] != noone and mirage_array[1] != noone and mirage_array[0] != noone){
        comscript = ceChase;
        exit;
    }

    //slow down
    if (hspd != 0 or vspd != 0){
        hspd *= decel;
        vspd *= decel;
    }

    //set charging alarm length and start animation alarm
    if (ani_alarm <= -1){
        alarm_len = 40;
        ani_alarm = alarm_len;
    }

    //sprite change and use script to animate with respect to the time left in the alarm
    sprite_index = ani_mirage;
    image_index = AnimateToAlarm(alarm_len,ani_alarm);

    //make mirages at end of animation
    if (round(ani_alarm) == 0){
        CreateMirages();
        comscript = ceChase;
    }    
}

ani_alarm--;
