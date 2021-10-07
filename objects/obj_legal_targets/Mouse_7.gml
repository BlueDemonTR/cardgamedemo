switch(current_function){
	case "deck":
	case "infirmary":
	case "momentumDeck":
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos] = self.position;
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,2]++
		obj_legal_targets.alarm[0] =1
	break;
}