///AnimateToAlarm(max_rate,alarm,[start_index],[number_of_images]);
img_spd = 0;
var start_index,index_number,max_rate,alarm_used,index;
var index = 0;
var max_rate = argument[0];
var alarm_used = argument[1];
if (argument_count > 2){
    start_index = argument[2];
    index_number = argument[3];
} else {
    start_index = 0;
    index_number = image_number;
}

for (var i = 1;i <= index_number;i += 1){
    if ( alarm_used >= max_rate - (i/index_number*max_rate) ) {
        index = i-1+start_index;
        break;        
    }
}

return index;
