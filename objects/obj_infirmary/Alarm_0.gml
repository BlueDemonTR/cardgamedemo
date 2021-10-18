for (var i = 0; i < infirmaryShownCount; i++){
	var infirmaryPos = i;
	line_number = i mod 4;
	column_number =  int64(i/4);
	infirmaryListOpened = true;
	with(instance_create_layer(715+(line_number*(card_width+30)),infirmaryListy+(column_number*(card_height+30)),"UpperInstances",obj_infirmary_list)){
		position = infirmaryPos
		cardNum = obj_infirmary.infirmaryShown[infirmaryPos,0];
		artNum = obj_infirmary.infirmaryShown[infirmaryPos,1];
	}
}
