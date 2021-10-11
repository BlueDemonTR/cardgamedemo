function scr_burn(target, damage, cardNum) {

	if(scr_check_archetype(cardNum, ArcPoleClan)){
		for (var i=0;i < 5;i++){
			if(obj_player.field[i, 0]==38){damage++;}
		}
	}

	scr_give_player_stats(target, 0, -damage, 0, 0)
	
	switch(obj_player.selected_wheel){
		case 3://Pole Clan Wheel Gain Activation Trigger
			if(target != obj_opponent){return false}
			if(!scr_legal_activation("WheelGain", 0, obj_player.selected_wheel)){return false}
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = "WheelGain"
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = obj_player.selected_wheel
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPile[obj_player.resolutionPileCount,5] = damage
			obj_player.resolutionPileCount++		
		break;
	}	

}
