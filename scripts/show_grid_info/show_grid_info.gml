var grid = argument0;

for (var j = 0; j < ds_grid_height(grid); j++) {
	var str = ""
	for (var i = 0; i < ds_grid_width(grid); i++) {
		str = str + string(grid[# i, j]) + " | "
	}
	show_debug_message(str);
}

ds_grid_destroy(grid);