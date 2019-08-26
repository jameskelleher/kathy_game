with (obj_character_selection) {
	var outfit_list_len = ds_list_size(outfit_list);
	if (outfit_ix == outfit_list_len - 1) {
		outfit_ix = 0;
	} else {
		outfit_ix += 1;
	}
}