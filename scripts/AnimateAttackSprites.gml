///AnimateAttackSprites(animation,[animation2],[animation3],...);
ani_atknumber = argument_count-1;
ani_atkcombo = -1;
ani_atkwindow_alarm = -1;
ani_atkwindow_length = 30;
for(var i = ani_atknumber;i >= 0;i--;){
    animate_attack[i] = argument[i];
}
