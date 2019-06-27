var eventName = "update_key";

var key = argument0;
var status = argument1;

show_debug_message("key " + string(key) + " has status " + string(key_pressed[? key]));

if (status == 1 and key_pressed[? key] == true) return;

if (status == 1) key_pressed[? key] = true;
else key_pressed[? key] = false;

show_debug_message("jk sending data");
#region packet
	var data = ds_map_create();
		data[? "key"] = key;
		data[? "status"] = status;
		sio_emit(eventName, json_encode(data));
	ds_map_destroy(data);
#endregion