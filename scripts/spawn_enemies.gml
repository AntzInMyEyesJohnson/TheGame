///spawn_enemies(enemy_spawn_odds, enemy_type0, enemy_type1, enemy_type2);
if (argument[0] == 0){exit;}//for levels that should have no enemies
var enemy_odds = argument[0];//map_size/enemy_odds = approx amount of enemies, 1000/50 = 20 enemies
var et0 = argument[1];
var et1 = argument[2];
var et2 = argument[3];
var enemy_count = 0;
var ex,ey;

for(var yy = 0;yy < height;yy++;){for(var xx = 0; xx < width;xx++;){
    if (grid[# xx, yy] == FLOOR){
        ex = xx*CELL_WIDTH + CELL_WIDTH/2;//middle of cell
        ey = yy*CELL_HEIGHT + CELL_HEIGHT/2;//middle of cell
        if (point_distance(ex, ey, obj_player.x, obj_player.y) > 96){
            if (irandom(enemy_odds) == enemy_odds){
                instance_create(ex, ey, choose(et2,et1,et0));
                enemy_count++;
            }
        }
    }
}
}

if (enemy_count <= (3+global.difficulty)){
    while(enemy_count <= 3){
        instance_create(ex,ey,choose(et2,et1,et0))
        enemy_count++;
    }
} 
