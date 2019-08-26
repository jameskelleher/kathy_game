hair_spr = hair_list[| hair_ix]
outfit_spr = outfit_list[| outfit_ix]
body_spr = body_list[| body_ix]

//draw_sprite_part_ext(spr_body_golden, 0, 0, 0, 32, 32, x, y, 2, 2, c_white, 1)
//draw_sprite_part_ext(spr_outfit_yellow, 0, 0, 0, 32, 32, x+1, y+11, 2, 2, c_white, 1)


draw_sprite_part(body_spr, 0, 0, 0, 32, 32, x, y)
draw_sprite_part(outfit_spr, 0, 0, 0, 32, 32, x, y)
draw_sprite_part(hair_spr, 0, 0, 0, 32, 32, x, y)