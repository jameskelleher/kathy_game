var json = json_decode(argument0);
var player_list = json[? "default"];

show_debug_message(argument0)

var num_players = ds_list_size(player_list);

global.sprite_grid = ds_grid_create(4, num_players);

for (var i = 0; i < num_players; i++) {
	var p = player_list[| i];
	
	//show_debug_message(string(i) + ": " + string(p))
	
	//for (var k = ds_map_find_first(p); !is_undefined(k); k = ds_map_find_next(p, k)) {
	//	var val = p[? k];
	//	show_debug_message("\t" + k + ": " + string(val));
	//}
	
	var xx = p[? "x"];
	var yy = p[? "y"];
	var spr_left = p[? "spr_left"];
	var spr_top = p[? "spr_top"];
	
	global.sprite_grid[# 0, i] = xx;
	global.sprite_grid[# 1, i] = yy;
	global.sprite_grid[# 2, i] = spr_left;
	global.sprite_grid[# 3, i] = spr_top;
}

ds_map_destroy(json);