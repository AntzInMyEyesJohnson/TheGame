///animate_to_alarm(alarm_set_rate,alarm_used,[start_index],[number_of_images]);
//
//  Returns the image index for a sprite that corresponds 
//  to the alarm being used and helps to lessen the amount of sprites
//  needed in a project. For example, in a 2d top down game, normally,
//  a right attack sprite, a up attack sprite, and a down attack sprite
//  would be needed.  With this script you just need one attack sprite.
//
//
//      alarm_set_rate      what the alarm being used is set at each time it is used, real
//
//      alarm_used          the alarm that the image_index will be stretched to, real.
//
//      start_index         (Optional) The starting image_index 
//                          (when multiple sprites are combined), real.
//
//      number_of_images    (Optional) The number of images
//                          (when multiple sprites are combined), real.
//
//  Another example: When making an attack animation, instead of having to adjust the
//  number of images in the animation each time the attack rate changes, this script
//  can be used and the attack can be set to an alarm.  So if you wanted to decrease
//  your characters attack rate the only thing you would need to adjust is the number
//  used each time the attack alarm is set (alarm_set_rate).
//  With this script, the sprite animation will stretch automatically instead of
//  having to manually adjust the animation each time the attack rate changed. 
//
/// GMLscripts.com/license
{
    //init
    image_speed = 0;
    var alarm_set_rate = argument[0];
    var alarm_used = argument[1];
    var start_index = 0;
    var number_of_images = image_number;
    
    //for when multiple animations are in one sprite
    if (argument_count > 2){
        start_index = argument[2];
        number_of_images = argument[3];
    } 
    
    //returns the image index according to the time left in alarm
    for (var i = 1;i <= number_of_images;i += 1){
        if ( alarm_used >= alarm_set_rate - (i/number_of_images*alarm_set_rate) ) {
            image_index = i-1+start_index;
            break;        
        }
    }
    
    return image_index;
}



