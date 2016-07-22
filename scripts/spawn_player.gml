///spawn_player(spawnx,spawny);
var sx = argument[0];
var sy = argument[1];
//create the player at start of game
if (!instance_exists(obj_player)){
    player = instance_create(sx*CELL_WIDTH+CELL_WIDTH/2, sy*CELL_HEIGHT+CELL_HEIGHT/2,global.champion_selected);
    //obj_player.given_starting_weapon = true;
} else {
    obj_player.x = sx*CELL_WIDTH+CELL_WIDTH/2;
    obj_player.y = sy*CELL_HEIGHT+CELL_HEIGHT/2;
}

