var tempCardNum = cardNum,
tempArtNum = artNum;

switch(animationType){
	case "destroy":
		cardsenttoInfirmary[1]= instance_create_depth(x,y,-1,card_animations);
		with(cardsenttoInfirmary[1]){
			angle=180
			targetX = obj_opponent.infirmary_x
			targetY = obj_opponent.infirmary_y
			activation_mode = "fieldToOpponentInfirmary"
			self.cardNum =tempCardNum;
			self.artNum =tempArtNum;
		}
	break;
	case "spin":
		if(macros.card_type[tempCardNum] == TypeMomentum){
			cardsenttoInfirmary[1] = instance_create_depth(x,y,1,card_animations)
			with(cardsenttoInfirmary[1]){
				angle=180
				targetX = obj_opponent.momentum_deck_x
				targetY = obj_opponent.momentum_deck_y
				current_function = "toOpponentMomentumDeck"
				self.cardNum = tempCardNum
				self.artNum =tempArtNum;
			}
		}else{
			cardsenttoInfirmary[1] = instance_create_depth(x,y,1,card_animations)
			with(cardsenttoInfirmary[1]){
				angle=180
				targetX = obj_opponent.deck_x
				targetY = obj_opponent.deck_y
				current_function = "toOpponentDeck"
				self.cardNum = tempCardNum
				self.artNum =tempArtNum;
			}
		}
	break;	
	
}
obj_opponent.fieldCard[position]=noone;
obj_opponent.field[position, 0]=0;
obj_opponent.field[position,1]=0;


