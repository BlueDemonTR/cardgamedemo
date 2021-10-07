for(i = 0; i < obj_player.field_zone_count; i++){
	if(field[i, CardNumber] > 0 && fieldCard[i] == noone){
		fieldCard[i] = instance_create_depth(field_card_zone_x[i],field_card_zone_y[i],1,obj_opponent_field_card);
		var 
		cardNum = field[i, CardNumber],
		artNum = field[i, ArtNumber],
		sprite = macros.sprite_array[cardNum,artNum],
		position = i;
		with(fieldCard[i]){
			player = obj_opponent;
			opponent = obj_player;
			self.cardNum = cardNum;
			self.artNum = artNum;
			self.position = position;
			scr_info_to_instance(cardNum);
			field_x = player.field_card_zone_x[self.position];
			field_y = player.field_card_zone_y[self.position];
			sprite_index = sprite;
		}
	}
}