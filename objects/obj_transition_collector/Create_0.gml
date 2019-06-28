if (global.collection_flag == false) {
	instance_destroy();
	exit;
}

// x, y, width, height, current_room, dest_room
num_cols = 6

global.num_transitions = 0;
global.transition_list = ds_list_create();
