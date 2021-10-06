
if(cardStat[StatHP]>cardStat[StatMaxHP]){
	cardStat[StatHP]=cardStat[StatMaxHP];
	scr_message_field_card_stats(position)
}
if(cardStat[StatATK]<0){
	cardStat[StatATK]=0;
	scr_message_field_card_stats(position)
}
if(cardStat[StatHP] <= 0 && alarm[2]==-1){
	alarm[2]=10;	
}
if(cardNum==65){
	if(cardStat[StatHP] = 1){
		scr_spin(position)
	}
}
if(obj_player.field[position,0] > 0 && cardNum != obj_player.field[position,0]){
	i = position;
	with(obj_player){	
		scr_message_field(i, field[i,0], field[i,1], "none");
		fieldCard[i] = instance_create_depth(field_card_zone_x[i],field_card_zone_y[i],1,obj_field_card);
		var 
		tempCardNum = field[i,0],
		tempArtNum = field[i,1],
		sprite = macros.sprite_array[tempCardNum,tempArtNum];
		with(fieldCard[i]){
			player = obj_player;
			opponent = obj_opponent;
			self.cardNum = tempCardNum;
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


if(!cardStatus[StatusSilenced]){
	if(global.drawing_card){
		if(cardNum ==20){scr_spin(position);}
	}
}

if(cardStatus[StatusSilenced] && !silence_reset){
	
	cardStat[StatMaxHP] = macros.origStat[cardNum,StatMaxHP];
	cardStat[StatATK] = macros.origStat[cardNum,StatATK];
	cardStat[StatLevel] = macros.origStat[cardNum,StatLevel];

	cardStat[StatArmor] = macros.origStat[cardNum,StatArmor]
	cardStat[StatRegeneration] = macros.origStat[cardNum,StatRegeneration]
	cardStat[StatDodge] = macros.origStat[cardNum,StatDodge]

	for(var i = 0; i < macros.status_count; i++){
		cardStatus[i] = false;
	}
	cardStatus[StatusSilenced] = true
	silence_reset = true;
	scr_message_field_card_stats(position)
}
if(player.start_turn && !start_turn_effects_resolved){
	end_phase_effects_resolved = false;
	if(cardNum==64){
		scr_burn(opponent,8,64);
	}
	scr_message_field_card_stats(position);
	start_turn_effects_resolved = true;
}

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
