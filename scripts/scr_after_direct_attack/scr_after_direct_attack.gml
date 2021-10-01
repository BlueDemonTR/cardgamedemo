function scr_after_direct_attack(cardNum) {
	
	if (obj_player.selected_wheel = 1 && !obj_player.wheel_locked){
		if(scr_check_archetype(cardNum, ArcMotorbiker)){
			scr_give_player_stats(player, 0, 0, 0, resolutionPile[damageToPlayer,5]);
		}
	}
	if(cardStatus[StatusSilenced]){return;}
	switch(cardNum){
		case 11: //Motorbiker Leader Khan Effect Activation
		case 12: //Motorbiker Leaden Luther Effect Activation
			if(!scr_legal_activation(cardNum, 0, position)){break;}
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = position
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPileCount++
		break;
	}


}
