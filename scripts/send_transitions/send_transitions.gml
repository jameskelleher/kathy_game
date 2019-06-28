var eventName = "send_transitions";

var transition_list = argument0;

show_debug_message("sending_transitions");
show_debug_message(argument0);
for (var i = 0; i < ds_list_size(transition_list); i++) {
	show_map_info(transition_list[| i]);
}

#region packet
	var data = ds_map_create();
		ds_map_add_list(data, "t", transition_list);
		var json = json_encode(data);
		show_debug_message(json);
		sio_emit(eventName, json);
	//ds_map_destroy(data);
#endregion