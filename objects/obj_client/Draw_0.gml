var num_sprites = ds_grid_height(global.sprite_grid);

for (var i = 0; i < num_sprites; i++) {
	var xx = global.sprite_grid[# 0, i];
	var yy = global.sprite_grid[# 1, i];
	var spr_left = global.sprite_grid[# 2, i];
	var spr_top = global.sprite_grid[# 3, i];
	
	draw_sprite_part(spr_yaeji, 0, spr_left, spr_top, player_frame_size, player_frame_size, xx, yy);
}
