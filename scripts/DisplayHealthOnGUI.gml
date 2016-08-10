///DisplayHealthOnGUI();
var spacing = 10;
for(var i = 0;i < player_health;i++){
    draw_sprite(spr_player_health,0,15+(i*spacing),20);
}
if (player_health != player_health_max){
    for(var j = player_health;j < player_health_max;j++){
        draw_sprite(spr_player_health,1,15+(j*spacing),20);    
    }
}
