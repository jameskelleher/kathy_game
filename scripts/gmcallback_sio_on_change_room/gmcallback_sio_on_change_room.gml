var json = json_decode(argument0);

var dest_room = json[? "dest_room"];

show_debug_message("going to " + string(dest_room));
room_goto(dest_room);