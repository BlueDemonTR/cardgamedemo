
for (var i=0; i < obj_player.infirmaryCount; i++){
	var sprite_num = i;
	line_number = i mod 4;
	column_number =  int64(i/4);
	infirmaryarray[i] =instance_create_layer(715+(line_number*(card_width+30)),infirmaryListy+(column_number*(card_height+30)),"UpperInstances",obj_infirmary_list);
	infirmaryListOpened=true;
		with (infirmaryarray[sprite_num]){
			infirmaryPos = i
			sprite_index = macros.sprite_array[obj_player.infirmary[sprite_num,0],obj_player.infirmary[sprite_num,1]];
			card_number = obj_player.infirmary[sprite_num,0];
			art_number = obj_player.infirmary[sprite_num,1];
		}
}
