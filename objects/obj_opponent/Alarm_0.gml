for (var i = 0; i < obj_opponent.infirmaryCount; i++){
	var sprite_num = i,
	line_number = i mod 4,
	column_number =  int64(i/4);
	
	obj_infirmary.infirmaryListOpened = true;
	
	with(
		instance_create_layer(
			715 + (line_number*(card_width + 30)),
			obj_infirmary.infirmaryListy + (column_number*(card_height + 30)),
			"UpperInstances",
			obj_infirmary_list
		)
	){
		cardNum = obj_opponent.infirmary[sprite_num,0];
		artNum = obj_opponent.infirmary[sprite_num,1];
		sprite_index = macros.sprite_array[cardNum,artNum];
	}
}
