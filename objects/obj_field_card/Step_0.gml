
if(cardStat[StatHP] <= 0 && alarm[2]==-1){
	alarm[2]=10;	
}

//TODO: scr_passive_effects(cardNum, position)


if(player.end_phase && !end_phase_effects_resolved){
	if(destroy_during_ep=true){
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,0] = "destroyDuringEP"
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,1] = false
		obj_player.endPhaseChains[obj_player.endPhaseChainCount++,2] = position
	}
	cardis_sacrificable = true;
	attacksLeft++;
	cardis_paralyzed = false;
	start_turn_effects_resolved = false;
	opt_used = false;
	switch(cardNum){
		case 90:
			mtpt = 3
		break;
	}	
	
	if(scr_check_shared(cardNum, ArcXMakine)){
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,0] = "X-Makine Shared Effect"
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,1] = false
		obj_player.endPhaseChains[obj_player.endPhaseChainCount++,2] = position
	}
	if(cardNum == 16){
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,0] = 16
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,1] = false
		obj_player.endPhaseChains[obj_player.endPhaseChainCount++,2] = position
	}
	else if (cardNum == 19 && variable_instance_exists(id,"stolenMonster")){
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,0] = 19
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,1] = false
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,2] = position
		obj_player.endPhaseChains[obj_player.endPhaseChainCount++,3] = stolenMonster
		stolenMonster = noone;
	}
	else if(cardNum == 34){
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,0] = 34
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,1] = false
		obj_player.endPhaseChains[obj_player.endPhaseChainCount++,2] = position		
	}
	else if(cardNum == 36){
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,0] = 36
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,1] = false
		obj_player.endPhaseChains[obj_player.endPhaseChainCount++,2] = position		
	}
	else if(cardNum == 38){
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,0] = 38
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,1] = false
		obj_player.endPhaseChains[obj_player.endPhaseChainCount++,2] = position				
	}
	else if(cardNum==72){
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,0] = 72
		obj_player.endPhaseChains[obj_player.endPhaseChainCount,1] = false
		obj_player.endPhaseChains[obj_player.endPhaseChainCount++,2] = position		
	}
	scr_message_field_card_stats(position)
	end_phase_effects_resolved = true;
}
