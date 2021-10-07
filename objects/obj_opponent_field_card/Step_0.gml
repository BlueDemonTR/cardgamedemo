if(cardStat[StatHP]<0){cardStat[StatHP]=0;}

if(player.field[position, CardNumber] == 0){
	player.fieldCard[position] = noone;
	instance_destroy();
}
if(obj_opponent.field[self.position,0] > 0 && cardNum != obj_opponent.field[self.position,0]){
	var i = self.position;
	with(obj_opponent){	
		scr_message_opponent_field(i, field[i, CardNumber], field[i, ArtNumber],"none");
		fieldCard[i] = instance_create_depth(field_card_zone_x[i],field_card_zone_y[i],1,obj_opponent_field_card);
		var 
		tempCardNum = field[i, CardNumber],
		tempArtNum = field[i, ArtNumber],
		sprite = macros.sprite_array[tempCardNum,tempArtNum];
		with(fieldCard[i]){
			player = obj_opponent;
			opponent = obj_player;
			self.cardNum = tempCardNum;
			self.artNum = tempArtNum;
			self.position = i;
			scr_info_to_instance(cardNum);
			summoning_method = "effect"
			field_x = player.field_card_zone_x[self.position];
			field_y = player.field_card_zone_y[self.position];
			sprite_index = sprite;
		}
	}
	instance_destroy(id,false)
}