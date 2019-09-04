if (room == room_welcome) {
	if keyboard_check_pressed(vk_enter) {
		room_goto(room_start);
		send_character_sprite(body_spr, outfit_spr, hair_spr, room_start)
	}
}