/// @func send_character_sprite(spr_body, spr_outfit, spr_hair, room_id)
/// @desc upload character sprite data to the server
/// @param spr_body
/// @param spr_outfit
/// @param spr_hair
/// @param room_id

var event_name = "send_character_sprite"

show_debug_message(event_name);

var spr_body = argument0;
var spr_outfit = argument1;
var spr_hair = argument2;
var room_id = argument3;

show_debug_message(spr_body)

#region packet
	var data = ds_map_create();
		data[? "spr_body"] = spr_body;
		data[? "spr_outfit"] = spr_outfit;
		data[? "spr_hair"] = spr_hair;
		data[? "room_id"] = room_id;
		sio_emit(event_name, json_encode(data));
	ds_map_destroy(data);
#endregion