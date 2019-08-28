if (is_undefined(global.sprite_grid)) exit;

ds_grid_sort(global.sprite_grid, 1, true);

var num_sprites = ds_grid_height(global.sprite_grid);

//show_grid_info(spr_grid);

for (var i = 0; i < num_sprites; i++) {
	var spr_room = global.sprite_grid[# 4, i];
	if room != spr_room continue;
	
	var xx = global.sprite_grid[# 0, i];
	var yy = global.sprite_grid[# 1, i];
	var spr_left = global.sprite_grid[# 2, i];
	var spr_top = global.sprite_grid[# 3, i];
	
	var spr_body = global.sprite_grid[# 5, i];
	var spr_outfit = global.sprite_grid[# 6, i];
	var spr_hair = global.sprite_grid[# 7, i];
	
	draw_sprite_part(spr_body, 0, spr_left, spr_top, player_frame_size, player_frame_size, xx, yy);
	draw_sprite_part(spr_outfit, 0, spr_left, spr_top, player_frame_size, player_frame_size, xx, yy);
	draw_sprite_part(spr_hair, 0, spr_left, spr_top, player_frame_size, player_frame_size, xx, yy);


	//draw_sprite_part(spr_body, 0, spr_left, spr_top, player_frame_size, player_frame_size, xx, yy);
	//draw_sprite_part(spr_outfit, 0, spr_left, spr_top, player_frame_size, player_frame_size, xx, yy);
	//draw_sprite_part(spr_hair, 0, spr_left, spr_top, player_frame_size, player_frame_size, xx, yy);

	
	//draw_sprite_part_ext(spr_body_vanilla, 0, spr_left, spr_top, player_frame_size, player_frame_size, xx, yy, 3, 3, c_white, 1);
	//draw_sprite_part_ext(spr_outfit_orange, 0, spr_left, spr_top, player_frame_size, player_frame_size, xx, yy, 2, 2, c_white, 1);
	//draw_sprite_part_ext(spr_hair_greenbob, 0, spr_left, spr_top, player_frame_size, player_frame_size, xx, yy, 3, 3, c_white, 1);
	
}
