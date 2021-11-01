switch(current_function){
	case SelectDeck:
	case SelectInfirmary:
	case SelectMomentum:
		if(obj_player.own_turn){
			obj_player.resolvingPile[obj_player.resolvingPileCount-1,arrayPos] = position;
			obj_player.resolvingPile[obj_player.resolvingPileCount-1,arrayPos+1] = player;
			obj_player.resolvingPile[obj_player.resolvingPileCount-1,2]++
		}else{
			scr_message_handle_response(arrayPos, position, string(player))
		}
		if(!obj_player.surfaceClean){
			obj_player.surfaceClean = true
		}
		instance_destroy(obj_legal_targets)
	break;
}