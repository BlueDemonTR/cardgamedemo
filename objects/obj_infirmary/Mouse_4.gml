if(!infirmaryListOpened && infirmaryShownCount> 0){
	for (var infirmaryPos = 0; infirmaryPos < infirmaryShownCount; infirmaryPos++){
		var player = self.player;
		infirmaryListOpened = true;
		with(instance_create_layer(x,y,"UpperInstances",obj_infirmary_list)){
			position = infirmaryPos;
			line_number = position mod 4;
			column_number = int64(position/4);
			var surface_margin_x = room_width/2 - 900/2, 
			surface_margin_y = room_height/2 - 880/2;
	
			x = surface_margin_x + card_width/2 + 125 + (line_number*(card_width + 30))
			y = surface_margin_y + card_height/2 + 30 + (column_number*(card_height + 50))
			y_og = y;
			self.player = player;
			cardNum = obj_infirmary.infirmaryShown[infirmaryPos, 0];
			artNum = obj_infirmary.infirmaryShown[infirmaryPos, 1];
			destroyType = obj_infirmary.infirmaryShown[infirmaryPos, 2];
			length = ceil(obj_infirmary.infirmaryShownCount/4)
		}
	}
}
else if(infirmaryListOpened){
	instance_destroy(obj_infirmary_list);
	infirmaryListOpened = false;
}
