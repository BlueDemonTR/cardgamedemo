switch(current_function){
	case "deck":
	case "infirmary":
	case "momentumdeck":
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos] = self.position;
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,2]++
		obj_legal_targets.alarm[0] =1	
	break;
}
/*
if(current_function=="search"){
	obj_player.resolutionPile[obj_player.resolutionPileCount-1,array_length(obj_player.resolutionPile[obj_player.resolutionPileCount-1])] = self.placeInDeck;
	obj_player.resolutionPile[obj_player.resolutionPileCount-1,2]++
	obj_legal_targets.alarm[0] =1
}
else if(current_function=="deck"){
	obj_player.resolutionPile[obj_player.resolutionPileCount-1,array_length(obj_player.resolutionPile[obj_player.resolutionPileCount-1])] = self.placeInDeck;
	obj_player.resolutionPile[obj_player.resolutionPileCount-1,2]++
	obj_legal_targets.alarm[0] =1
}
else if(current_function=="mill"){
	var placeInDeck = self.placeInDeck;
	with(obj_player){
		card_to_add = deck[placeInDeck,0];
		art_to_add = deck[placeInDeck,1];
		deck[placeInDeck,0] = deck[deckCount-1,0];
		deck[placeInDeck,1] = deck[deckCount-1,1];
		deck[deckCount-1,0] = card_to_add;
		deck[deckCount-1,1] = art_to_add;
		scr_mill_from_top(1);
		obj_legal_targets.alarm[0] =1;
		scr_shuffle_deck();
	}
}
else if(current_function=="infirmary"){
	var 
	infirmaryPos = self.infirmaryPos,
	effectBelongsTo = self.effectBelongsTo;
	with(obj_player){
		if(effectBelongsTo== 52){
			momentum -= macros.origStat[infirmary[infirmaryPos],0];
			scr_message_stats();
		}
		scr_summon_from_infirmary(infirmaryPos);
	}
	obj_legal_targets.alarm[0] =1;
}
else if(current_function=="recover"){
	var 
	infirmaryPos = self.infirmaryPos,
	effectBelongsTo = self.effectBelongsTo;
	with(obj_player){
		scr_recover_infirmary(infirmaryPos);
	}
	obj_legal_targets.alarm[0] =1;
}
else if(current_function=="impact"){
	var placeInMomentumDeck = self.placeInMomentumDeck;
	with(obj_player){
		if (momentum_deck[placeInMomentumDeck,0] > 10 && momentum_deck[placeInMomentumDeck,0] < 17){
			scr_impact_summon_materials(placeInMomentumDeck, "all", 0, macros.origStat[momentum_deck[placeInMomentumDeck,0]]);
		}
		else if (momentum_deck[placeInMomentumDeck,0] >= 27 && momentum_deck[placeInMomentumDeck,0] <= 31){
			scr_impact_summon_materials(placeInMomentumDeck, "all", 0, macros.origStat[momentum_deck[placeInMomentumDeck,0]]);
		}
		else if (momentum_deck[placeInMomentumDeck,0] >= 47 && momentum_deck[placeInMomentumDeck,0] <= 49){
			scr_impact_summon_materials(placeInMomentumDeck, "all", 0, macros.origStat[momentum_deck[placeInMomentumDeck,0]]);
		}
		else if (momentum_deck[placeInMomentumDeck,0] == 70){
			scr_impact_summon_materials(placeInMomentumDeck, "all", 0, macros.origStat[momentum_deck[placeInMomentumDeck,0]]);
		}
		else if(momentum_deck[placeInMomentumDeck,0] == 78){
			scr_impact_summon_materials(placeInMomentumDeck, "all", 0, macros.origStat[momentum_deck[placeInMomentumDeck,0]]);
		}
		else if(momentum_deck[placeInMomentumDeck,0] == 90){
			scr_impact_summon_materials(placeInMomentumDeck, "all", 0, macros.origStat[momentum_deck[placeInMomentumDeck,0]]);
		}
		else if(momentum_deck[placeInMomentumDeck,0] == 112){
			scr_impact_summon_materials(placeInMomentumDeck, "all", 0, macros.origStat[momentum_deck[placeInMomentumDeck,0]]);
		}
	}
	obj_legal_targets.alarm[0] =1;
}


else if(current_function=="momentumDeck"){
	var placeInMomentumDeck = self.placeInMomentumDeck;
		with(obj_player){
				scr_summon_momentum_deck(placeInMomentumDeck);
		}
		if(self.effectBelongsTo == 16){
			obj_player.endPhaseChainCount--
		}else if(self.effectBelongsTo == 24){
			with(obj_player.fieldCard[4,0]){
				destroy_during_ep = true;
			}
		}
	obj_legal_targets.alarm[0] =1;
}