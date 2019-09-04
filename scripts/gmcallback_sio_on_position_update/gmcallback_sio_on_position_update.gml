var json = json_decode(argument0);
var player_list = json[? "default"];

//show_debug_message(argument0)

var num_players = ds_list_size(player_list);

if (is_undefined(num_players) or num_players == 0) {
	return;
}

global.sprite_grid = ds_grid_create(8, num_players);

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
	var spr_room = p[? "room_id"];
	var spr_body = p[? "spr_body"];
	var spr_outfit = p[? "spr_outfit"];
	var spr_hair = p[? "spr_hair"];
	
	global.sprite_grid[# 0, i] = xx;
	global.sprite_grid[# 1, i] = yy;
	global.sprite_grid[# 2, i] = spr_left;
	global.sprite_grid[# 3, i] = spr_top;
	global.sprite_grid[# 4, i] = spr_room;
	global.sprite_grid[# 5, i] = spr_body;
	global.sprite_grid[# 6, i] = spr_outfit;
	global.sprite_grid[# 7, i] = spr_hair;
	
}

ds_map_destroy(json);