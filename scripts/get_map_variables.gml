///get_map_variables(current map);
switch(argument[0])
{
    case HUBMAP:
        wall_tile_type = bg_hub_wall;
        wall_tile_type_rare = bg_hub_wall_rare;
        wall_odds = 5;//5 is default
        foliage_tile_type = bg_hub_foliage;
        foliage_odds = 25;
        path_tile_type = bg_hub_path;
        path_odds = 0;
        floor_tile_type = bg_hub_floor;
        floor_odds = 0;
        shadow_tile_type = bg_default_shadow;
        shadow_tile_type_rare = bg_default_shadow_rare;
        shadow_odds = 5;
        background_tile_type = bg_hub_background;
        cont_dt_odds = 3;//3 is default
        map_size = 0;
        map_gateways = 4;
        destroy_island_cells = true;
        global.enemy_type_array[2] = obj_archer;
        global.enemy_type_array[1] = obj_mercenary;
        global.enemy_type_array[0] = obj_meatman;
        enemy_spawn_odds = 350;
        //room_width = 4096;
        //room_height = 4096;
    break;
    case PURPLEMAP:
        wall_tile_type = bg_poison_wall;
        wall_tile_type_rare = bg_poison_wall_rare;
        wall_odds = 5;//5 is default
        foliage_tile_type = bg_poison_foliage;
        foliage_odds = 15;
        path_tile_type = bg_poison_path;
        path_odds = 0;
        floor_tile_type = bg_poison_floor;
        floor_odds = 0;
        shadow_tile_type = bg_default_shadow;
        shadow_tile_type_rare = bg_default_shadow_rare;
        shadow_odds = 5;
        background_tile_type = bg_poison_background;
        cont_dt_odds = 6;//3 is default
        map_size = 1000;
        map_gateways = 2;
        destroy_island_cells = true;
        //map_trap_script = FireTrap;
        //counters:wizard countered_by:viking
        global.enemy_type_array[2] = obj_assassin;//teleport negates range
        global.enemy_type_array[1] = obj_slime;//range do less damage
        global.enemy_type_array[0] = obj_meatman;//immune to moving spells
        enemy_spawn_odds = 100;
        //map_boss = obj_fear_boss;//fast regen and immovable
        //room_width = 3072;
        //room_height = 3072;
    break;
    case BLUEMAP:
        wall_tile_type = bg_water_wall;
        wall_tile_type_rare = bg_water_wall_rare;
        wall_odds = 5;//5 is default
        foliage_tile_type = bg_water_foliage;
        foliage_odds = 15;
        path_tile_type = bg_water_path;
        path_odds = 1;
        floor_tile_type = bg_water_floor;
        floor_odds = 0;
        shadow_tile_type = bg_default_shadow;
        shadow_tile_type_rare = bg_default_shadow_rare;
        shadow_odds = 5;
        background_tile_type = bg_water_background;
        cont_dt_odds = 3;//3 is default
        map_size = 1000;
        map_gateways = 2;
        destroy_island_cells = true;
        //map_trap_script = FloorTrap;
        //counters:samurai countered_by:gunslinger
        global.enemy_type_array[2] = obj_shielder;//blocks weak melee attacks
        global.enemy_type_array[1] = obj_archer;//pins fast movers
        global.enemy_type_array[0] = obj_flyer;//immune to melee if in water
        enemy_spawn_odds = 100;
        //map_boss = obj_alien_boss;//parry master 
        //room_width = 3072;
        //room_height = 3072;
    break;
    case YELLOWMAP:
        wall_tile_type = bg_desert_wall;
        wall_tile_type_rare = bg_desert_wall_rare;
        wall_odds = 5;//5 is default
        foliage_tile_type = bg_desert_foliage;
        foliage_odds = 15;
        path_tile_type = bg_desert_path;
        path_odds = 0;
        floor_tile_type = bg_desert_floor;
        floor_odds = 0;
        shadow_tile_type = bg_default_shadow;
        shadow_tile_type_rare = bg_default_shadow_rare;
        shadow_odds = 5;
        background_tile_type = bg_desert_background;
        cont_dt_odds = 3;//3 is default
        map_size = 2000;
        map_gateways = 2;
        destroy_island_cells = true;
        //map_trap_script = MirageTrap;
        //counters:gunslinger countered_by:wizard
        global.enemy_type_array[2] = obj_ninja;//dodges bullets
        global.enemy_type_array[1] = obj_graboid;//immune to range when underground
        global.enemy_type_array[0] = obj_sorceress;//mirages
        enemy_spawn_odds = 100;
        //map_boss = obj_bandit_boss;//time manipulation like jake gylenholl
        //room_width = 3072;
        //room_height = 3072;
    break;
    case GREENMAP:
        wall_tile_type = bg_forest_wall;
        wall_tile_type_rare = bg_forest_wall_rare;
        wall_odds = 5;//5 is default
        foliage_tile_type = bg_forest_foliage;
        foliage_odds = 3;
        path_tile_type = bg_forest_path;
        path_odds = 0;
        floor_tile_type = bg_forest_floor;
        floor_odds = 0;
        shadow_tile_type = bg_forest_shadow;
        shadow_tile_type_rare = bg_forest_shadow_rare;
        shadow_odds = 5;
        background_tile_type = bg_forest_background;
        cont_dt_odds = 3;//3 is default
        map_size = 1500;
        map_gateways = 2;
        destroy_island_cells = true;
        //map_trap_script = HunterTrap;
        //counters:viking countered_by:samurai
        global.enemy_type_array[2] = obj_mercenary;//shotgun blows through defense and hard to deflect with attack
        global.enemy_type_array[1] = obj_mole;//appears suddenly so good against slow movers
        global.enemy_type_array[0] = obj_hunter;//2 proned attack (them + pet) to negate shield
        enemy_spawn_odds = 100;
        //map_boss = obj_predator_boss;//superior weapons and doesn't have time to bleed
        //room_width = 3072;
        //room_height = 3072;
    break;
}

