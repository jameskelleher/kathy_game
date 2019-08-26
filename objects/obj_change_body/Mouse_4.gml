with (obj_character_selection) {
	var body_list_len = ds_list_size(body_list);
	if (body_ix == body_list_len - 1) {
		body_ix = 0;
	} else {
		body_ix += 1;
	}
}