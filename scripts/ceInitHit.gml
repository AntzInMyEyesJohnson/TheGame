///ceInitHit();
//start the hit alarm
ani_alarm = alarm_len;
//set the particle type direction (TWO of two steps to register)
CreateParticle(global.pt_blood,destdir,part_amount,0);
//play getting hit sound
//PlaySound(choose(snd_hit1,snd_hit2,snd_hit3),1,12,random_range(.9,1.1))

//die if no health left else continue with hit command animation
if (enemy_health <= 0){
    //ceDeathType predetermined in object create event
    comscript = ceDeath;
    //reset alarm for death command
    ani_alarm = -1;
    return false;
} 

return true;
