
var tempCardNum = cardNum,
tempArtNum = artNum;
switch(animationType){
	case "destroy":
		cardsenttoInfirmary[1]= instance_create_depth(x,y,-1,card_animations);
		with(cardsenttoInfirmary[1]){
			angle=0
			targetX = obj_player.infirmary_x
			targetY = obj_player.infirmary_y
			activation_mode = "fieldToPlayerInfirmary"
			self.cardNum =tempCardNum;
			self.artNum = tempArtNum
		}
		scr_card_sent_to_infirmary(cardNum);
	break;
	case "spin":
		if(macros.card_type[cardNum]==1){
			cardsenttoInfirmary[1] = instance_create_depth(x,y,1,card_animations)
			with(cardsenttoInfirmary[1]){
				angle=0
				targetX = obj_player.momentum_deck_x
				targetY = obj_player.momentum_deck_y
				current_function = "toMomentumDeck"
				self.cardNum = tempCardNum
				self.artNum = tempArtNum
			}
		}else{
			cardsenttoInfirmary[1] = instance_create_depth(x,y,1,card_animations)
			with(cardsenttoInfirmary[1]){
				angle=0
				targetX = obj_player.deck_x
				targetY = obj_player.deck_y
				current_function = "toDeck"
				self.cardNum = tempCardNum
				self.artNum = tempArtNum
			}
		}
	break;	
	
}

scr_message_field(position, 0, 0, animationType);
obj_player.fieldCard[position]=noone;
obj_player.field[position,0]=0;
obj_player.field[position,1]=0;
