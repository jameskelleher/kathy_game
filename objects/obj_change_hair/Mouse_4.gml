with (obj_character_selection) {
	var hair_list_len = ds_list_size(hair_list);
	if (hair_ix == hair_list_len - 1) {
		hair_ix = 0;
	} else {
		hair_ix += 1;
	}
}