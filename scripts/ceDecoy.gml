///ceDecoy();

//zed swap with mirage
if (ani_alarm <= -1){
    var zx,zy,count;
    count = 3;
    while (count >= 0) {
        if (mirage_array[count] != noone){
            zx = mirage_array[count].x;
            zy = mirage_array[count].y;
            break;
        }
        count--;
    }
    mirage_array[count].x = x;
    mirage_array[count].y = y;
    x = zx;
    y = zy;
    alarm_len = 30;
    ani_alarm = alarm_len;
}

//sprite change and use script to animate with respect to the time left in the alarm
sprite_index = ani_decoy;
image_index = AnimateToAlarm(alarm_len,ani_alarm);

if (round(ani_alarm) == 0){
    comscript = cePatrolArea;
}

ani_alarm--;
