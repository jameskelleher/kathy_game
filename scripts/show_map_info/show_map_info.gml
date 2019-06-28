var map = argument0;

for (var k = ds_map_find_first(map); !is_undefined(k); k = ds_map_find_next(map, k)) {
	show_debug_message(string(k) + ": " + string(map[? k]));
}