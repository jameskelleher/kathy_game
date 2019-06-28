if (room == 0) {
	
	if (global.collection_flag == false) {
		// report final result
		//for (var i = 0; i < ds_list_size(global.transition_list); i++) {
		//	show_map_info(global.transition_list[| i]);
		//}
		send_transitions(global.transition_list);
		show_debug_message("destroying");
		ds_list_destroy(global.transition_list);
		instance_destroy();
		exit;
	} else {
		global.collection_flag = false
	}
}


with (obj_transition) {
	
	var n = global.num_transitions;
	
	show_debug_message("adding data for transition " + string(n));
	
	var t_map = ds_map_create();
	
	t_map[? "x"] = x;
	t_map[? "y"] = y;
	t_map[? "w"] = sprite_width;
	t_map[? "h"] = sprite_height;
	t_map[? "room"] = room;
	t_map[? "dest_room"] = dest_room;
	t_map[? "dest_x"] = dest_x;
	t_map[? "dest_y"] = dest_y;
	
	ds_list_add(global.transition_list, t_map);
	ds_list_mark_as_map(global.transition_list, n);
	
	//global.transition_list[| n] = t_map;
	
	global.num_transitions++;
	
	//instance_destroy(t_map);
	
	//global.transition_grid[# 0, n] = x;
	//global.transition_grid[# 1, n] = y;
	//global.transition_grid[# 2, n] = sprite_width;
	//global.transition_grid[# 3, n] = sprite_height;
	//global.transition_grid[# 4, n] = room;
	//global.transition_grid[# 5, n] = dest_room;
}

if room_exists(room + 1) room_goto(room + 1);
else room_goto(0)
	