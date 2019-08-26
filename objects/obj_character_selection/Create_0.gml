hair_list = ds_list_create()
outfit_list = ds_list_create()
body_list = ds_list_create()

ds_list_add(hair_list,
	spr_hair_pink,
	spr_hair_yellowpigtails,
	spr_hair_limespike,
	spr_hair_greenbob,
	spr_hair_graybald,
	spr_hair_blueshave)
	
ds_list_add(outfit_list,
	spr_outfit_orange,
	spr_outfit_yellow)
	
ds_list_add(body_list,
	spr_body_espresso,
	spr_body_golden,
	spr_body_ivory,
	spr_body_vanilla)
	
hair_ix = irandom(ds_list_size(hair_list) - 1)
outfit_ix = irandom(ds_list_size(outfit_list) - 1)
body_ix = irandom(ds_list_size(body_list) - 1)
