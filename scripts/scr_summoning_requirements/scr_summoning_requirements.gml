function scr_summoning_requirements(argument0) {
	
	var placeInMomentumDeck = argument0,
	cardNum = momentum_deck[placeInMomentumDeck,0],
	mmzOccupied = false;
	if(cardNum >= 11 && cardNum <= 15){
		var levelSum = 0,
		motorbikers = 0;
	
		for(var i=0; i < 4; i++){
			if (field[i,0] > 0){
				if (fieldCard[i].cardStat[0]< macros.origStat[cardNum,0] && scr_check_archetype(field[i,0],1)){
					motorbikers++;
					levelSum += fieldCard[i].cardStat[0];
				}
			}
		}
		if (field[4,0] > 0){
			if (fieldCard[4].cardStat[0] < macros.origStat[cardNum,0] && scr_check_archetype(field[4,0],1)){
				motorbikers++;
				levelSum += fieldCard[4].cardStat[0];
			}else{mmzOccupied = true;}
		}
		if(!mmzOccupied && motorbikers >= 2 && levelSum >= macros.origStat[cardNum,0] && scr_limited_summon(cardNum)){
			global.filtered_cards[filtered_card_count++] = placeInMomentumDeck;
		}
	}
	else if(cardNum == 16){
		var levelSum = 0,
		motorbikers = 0,
		motorbiker_leader=false;
		for(var i=0; i < 4; i++){
			if (field[i,0] > 0){
				if (fieldCard[i].cardStat[0]< macros.origStat[cardNum,0] && scr_check_archetype(field[i,0],11)){
					motorbikers++;
					levelSum += fieldCard[i].cardStat[0];
					if (scr_check_archetype(field[i,0], 2)){
						motorbiker_leader= true;
					}
				}
			}
		}
		if (field[4,0] > 0){
			if (fieldCard[4].cardStat[0]< macros.origStat[cardNum,0] && scr_check_archetype(field[4,0],11)){
				motorbikers++;
				levelSum += fieldCard[4].cardStat[0];
				if (scr_check_archetype(field[4,0], 2)){
					motorbiker_leader= true;
				}
			}else{mmzOccupied = true;}
		}
		if(!mmzOccupied && motorbikers >= 2 && levelSum >= macros.origStat[cardNum,0] && motorbiker_leader && scr_limited_summon(cardNum)){
			global.filtered_cards[filtered_card_count++] = placeInMomentumDeck;
		}
	}
	else if(cardNum >= 27 && cardNum <= 31){
		var levelSum = 0,
		visclades = 0;
		for(var i=0; i < 4; i++){
			if (field[i,0] > 0){
				if (fieldCard[i].cardStat[0] < macros.origStat[cardNum,0] && scr_check_archetype(field[i,0], 3)){
					
					visclades++;
					levelSum += fieldCard[i].cardStat[0];
				}
			}
		}
		if (field[4,0] > 0){
			if (fieldCard[4].cardStat[0] < macros.origStat[cardNum,0] && scr_check_archetype(field[4,0], 3)){
				visclades++;
				levelSum += fieldCard[4].cardStat[0];
			}else{mmzOccupied = true;}
		}
		if(!mmzOccupied && visclades >= 2 && levelSum >= macros.origStat[cardNum,0] && scr_limited_summon(cardNum)){
			global.filtered_cards[filtered_card_count++] = placeInMomentumDeck;
		}
	}
	else if(cardNum == 47){
		var levelSum = 0,
		poleclan = 0,
		igloo_present = false;
		for(var i=0; i < 4; i++){
			if (field[i,0] > 0){
				if(fieldCard[i].cardStat[0] < macros.origStat[cardNum,0]){
					if (scr_check_archetype(field[i,0], 4)){
						poleclan++;
					}
					if (macros.name[field[i,0]] == "Igloo"){
						igloo_present=true;
					}
					if (macros.name[field[i,0]] == "Igloo" || scr_check_archetype(field[i,0], 4)){
						levelSum += fieldCard[i].cardStat[0];
					}
				}
			}
		}
		if (field[4,0] > 0){
			if(fieldCard[i].cardStat[0] < macros.origStat[cardNum,0]){
				if (scr_check_archetype(field[4,0], 4)){
					poleclan++;
				}
				if (macros.name[field[4,0]] == "Igloo"){
					igloo_present=true;
				}
				if (macros.name[field[4,0]] == "Igloo" || scr_check_archetype(field[4,0], 4)){
					levelSum += fieldCard[i].cardStat[0];
				}else{mmzOccupied = true;}
			}else{mmzOccupied = true;}
		}
		if(!mmzOccupied && poleclan >= 1 && igloo_present && levelSum >= macros.origStat[cardNum,0] && scr_limited_summon(cardNum)){
			global.filtered_cards[filtered_card_count++] = placeInMomentumDeck;
		}
	}
	else if(cardNum == 48){
		var levelSum = 0,
		poleclan = 0,
		igloo_present = false;
		for(var i=0; i < 4; i++){
			if (field[i,0] > 0){
				if(fieldCard[i].cardStat[0] < macros.origStat[cardNum,0]){
					if (scr_check_archetype(field[i,0], 4)){
						poleclan++;
					}
					if (macros.name[field[i,0]] == "Igloo Castle"){
						igloo_present=true;
					}
					if (macros.name[field[i,0]] == "Igloo Castle" || scr_check_archetype(field[i,0], 4)){
						levelSum += fieldCard[i].cardStat[0];
					}
				}
			}
		}
		if (field[4,0] > 0){
			if(fieldCard[i].cardStat[0] < macros.origStat[cardNum,0]){
				if (scr_check_archetype(field[4,0], "Pole Clan")){
					poleclan++;
				}
				if (name[field[4,0]] == "Igloo Castle"){
					igloo_present=true;
				}
				if (name[field[4,0]] == "Igloo Castle" || scr_check_archetype(field[4,0], "Pole Clan")){
					levelSum += fieldCard[i].cardStat[0];
				}else{mmzOccupied = true;}
			}else{mmzOccupied = true;}
		}
		if(!mmzOccupied && poleclan >= 1 && igloo_present && levelSum >= macros.origStat[cardNum,0] && scr_limited_summon(cardNum)){
			global.filtered_cards[filtered_card_count++] = placeInMomentumDeck;
		}
	}

	else if(cardNum == 49){
		var levelSum = 0,
		poleclan = 0,
		igloo_present = false;
		for(var i=0; i < 4; i++){
			if (field[i,0] > 0){
				if(fieldCard[i].cardStat[0] < macros.origStat[cardNum,0]){
					if (scr_check_archetype(field[i,0], "Pole Clan")){
						poleclan++;
					}
					if (name[field[i,0]] == "Igloo Citadel"){
						igloo_present=true;
					}
					if (name[field[i,0]] == "Igloo Citadel" || scr_check_archetype(field[i,0], "Pole Clan")){
						levelSum += fieldCard[i].cardStat[0];
					}
				}
			}
		}
		if (field[4,0] > 0){
			if(fieldCard[i].cardStat[0] < macros.origStat[cardNum,0]){
				if (scr_check_archetype(field[4,0], "Pole Clan")){
					poleclan++;
				}
				if (name[field[4,0]] == "Igloo Citadel"){
					igloo_present=true;
				}
				if (name[field[4,0]] == "Igloo Citadel" || scr_check_archetype(field[4,0], "Pole Clan")){
					levelSum += fieldCard[i].cardStat[0];
				}else{mmzOccupied = true;}
			}else{mmzOccupied = true;}
		}
		if(!mmzOccupied && poleclan >= 1 && igloo_present && levelSum >= macros.origStat[cardNum,0] && scr_limited_summon(cardNum)){
			global.filtered_cards[filtered_card_count++] = placeInMomentumDeck;
		}
	}
	else if(cardNum == 70){
		var levelSum = 0;
		for(var i=0; i < 4; i++){
			if (field[i,0] > 0){
				if(fieldCard[i].cardStat[0] < macros.origStat[cardNum,0]){
					levelSum += fieldCard[i].cardStat[0]
				}
			}
		}
		if (field[4,0] > 0){
			if(fieldCard[i].cardStat[0] < macros.origStat[cardNum,0]){
					levelSum += fieldCard[i].cardStat[0]
			}else{mmzOccupied = true;}
		}
		if(!mmzOccupied && levelSum >= macros.origStat[cardNum,0] && scr_limited_summon(cardNum)){
			global.filtered_cards[filtered_card_count++] = placeInMomentumDeck;
		}
	}
	else if(cardNum == 78){
		var levelSum = 0,
		sacrifices = 0;
		for(var i=0; i < 4; i++){
			if (field[i,0] > 0){
				if(fieldCard[i].cardStat[0] < macros.origStat[cardNum,0] && scr_check_archetype(field[i,0],"Sacrifice")){
					levelSum += fieldCard[i].cardStat[0]
					sacrifices++
				}
			}
		}
		if (field[4,0] > 0){
			if(fieldCard[i].cardStat[0] < macros.origStat[cardNum,0] && scr_check_archetype(field[i,0],"Sacrifice")){
					levelSum += fieldCard[i].cardStat[0]
					sacrifices++
			}else{mmzOccupied = true;}
		}
		if(!mmzOccupied && levelSum >= macros.origStat[cardNum,0] && sacrifices >= 2 && scr_limited_summon(cardNum)){
			global.filtered_cards[filtered_card_count++] = placeInMomentumDeck;
		}		
	}
	else if(cardNum == 90){
		var levelSum = 0,
		fishes = 0,
		fisherman =false;
		for(var i=0; i < 4; i++){
			if (field[i,0] > 0){
				if (fieldCard[i].cardStat[0] < macros.origStat[cardNum,0] && scr_check_archetype(field[i,0],"Fish")){
					fishes++;
					levelSum += fieldCard[i].cardStat[0];
					if (scr_check_archetype(field[i,0], 9)){
						fisherman= true;
					}
				}
			}
		}
		if (field[4,0] > 0){
			if (fieldCard[4].cardStat[0] < macros.origStat[cardNum,0] && scr_check_archetype(field[4,0],"Fish")){
				fishes++;
				levelSum += fieldCard[4].cardStat[0];
				if (scr_check_archetype(field[4,0],9)){
					fisherman= true;
				}
			}else{mmzOccupied = true;}
		}
		if(!mmzOccupied && fishes >= 2 && levelSum >= macros.origStat[cardNum,0] && fisherman && scr_limited_summon(cardNum)){
			global.filtered_cards[filtered_card_count++] = placeInMomentumDeck;
		}		
	
	}
	else if(cardNum=112){
		var levelSum = 0,
		x_makines = 0;
		
		for(var i=0; i < 4; i++){
			if (field[i,0] > 0){
				if (fieldCard[i].cardStat[0] < macros.origStat[cardNum,0] && scr_check_archetype(field[i,0],11)){
					x_makines++;
					levelSum += fieldCard[i].cardStat[0];
				}
			}
		}
		if (field[4,0] > 0){
			if (fieldCard[4].cardStat[0] < macros.origStat[cardNum,0] && scr_check_archetype(field[4,0],11)){
				x_makines++;
				levelSum += fieldCard[4].cardStat[0];
			}else{mmzOccupied = true;}
		}
		if(!mmzOccupied && x_makines >= 2 && levelSum >= macros.origStat[cardNum,0] && scr_limited_summon(cardNum)){
			global.filtered_cards[filtered_card_count++] = placeInMomentumDeck;
		}		
	
	}



}
