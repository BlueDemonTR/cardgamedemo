for (i=0; i < obj_opponent.infirmaryCount; i++){
	var sprite_num = i;
	line_number = i mod 4;
	column_number =  int64(i/4);
	infirmaryArray[i] =instance_create_layer(715+(line_number*(card_width+30)),obj_infirmary.infirmaryListy+(column_number*(card_height+30)),"UpperInstances",obj_infirmary_list);
	obj_infirmary.infirmaryListOpened=true;
	with (infirmaryArray[sprite_num]){
		card_number = obj_opponent.infirmary[sprite_num,0];
		art_number = obj_opponent.infirmary[sprite_num,1];
		sprite_index = macros.sprite_array[card_number,art_number];
	}
}
