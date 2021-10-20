switch(current_function){
	case SelectDeck:
	case SelectInfirmary:
	case SelectMomentum:
		obj_player.resolvingPile[obj_player.resolvingPileCount-1,arrayPos] = position;
		obj_player.resolvingPile[obj_player.resolvingPileCount-1,arrayPos + 1] = player;
		obj_player.resolvingPile[obj_player.resolvingPileCount-1,2]++
		obj_legal_targets.alarm[0] = 1
	break;
}