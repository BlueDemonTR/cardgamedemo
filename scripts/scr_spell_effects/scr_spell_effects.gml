function scr_spell_effects(cardNum) {
	switch(cardNum){
		case 8://Rev Up The Engines Activation
		case 9://Leader Takeover
		case 10://The Hunt is on Boys!
			if(scr_legal_activation(cardNum, 0, hand_position)){
				obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
				obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
				obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
				obj_player.resolutionPile[obj_player.resolutionPileCount,3] = hand_position
				obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
				obj_player.resolutionPileCount++
			}
		break;
		
		case 24://Cries of the Underworld
			j=0;
			with(player){
				if(field[4,0]== 0){
					var visclades=0;
					for(var i=0;i <infirmaryCount; i++){
						if(scr_check_archetype(infirmary[i,0], 3)){
							visclades++
						}
					}
					if(visclades >= 4){		
						for(var i = 0; i < player.momentumDeckCount; i++){
							if(scr_limited_summon(player.momentum_deck[i,0]) && scr_check_archetype(momentum_deck[i,0], 3)){
								global.filtered_cards[j++] = i;				
							}
						}
						filtered_card_count = j;
						if (filtered_card_count > 0){
							obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
							obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
							obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
							obj_player.resolutionPile[obj_player.resolutionPileCount,3] = hand_position
							obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
							obj_player.resolutionPileCount++
						}
					}
				}
			}
		break;
	
	
	
	
		case 25://Second Coming
			if(!scr_if_field_full()){
				obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
				obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
				obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
				obj_player.resolutionPile[obj_player.resolutionPileCount,3] = hand_position
				obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
				obj_player.resolutionPileCount++				
			}
		break;
	
	
		case 26://Bloody Sacrifice
			with(obj_player){
				scr_mill_archetype(3,0,0,13,cardNum)
			}
			if(global.effect_successful){scr_discard(cardNum);}
		break;
	
	
	
		case 39://Blizzard - Icewall
			if(obj_player.momentum > 0){
				scr_give_atk_hp("player","all",0,13,5,0,5,cardNum,-1);
				if(global.effect_successful){
					scr_discard(cardNum);
					obj_player.momentum--;
					scr_message_stats();
				}
			}
		break;
	
	
		case 40:
			with(obj_player){//Icicle Storm
				if(momentum >= 3){
					scr_miscellaneous_target("all", "all",0,13,5,cardNum,"Spell",-1);
				}
			}
			if(global.effect_successful){
				obj_player.momentum-= 3;
				scr_message_stats();				
				scr_discard(cardNum);
					
			}
		break;
	
	
	
		case 41://Recruitment
			with(obj_player){
				scr_search_archetype(4, 0, 0,13,cardNum);
			}
			if(global.effect_successful){scr_discard(cardNum);}
		break;
	
	
	
		case 42://Hibernation
			with(obj_player){
				if(momentum >= 3){
					scr_paralyze_target("opponent", "all",0,13,"any",cardNum,-1);
				}
			}
			if(global.effect_successful){
				scr_discard(cardNum);
			}
		break;
	
	
	
		case 43://Lockdown
			for(i=0; i < 5; i++){
				if(obj_player.field[i,0] != 0 || obj_opponent.field[i,0] != 0){
					scr_discard_cost("any","monster",0,13,cardNum, true);
					break;
				}
			}
			if(global.effect_successful){
				scr_discard(cardNum);
			}
		break;
	
	
	
		case 44://Frost Beam
			for(i=0; i < 5; i++){
				if(obj_player.field[i,0] == 35 && obj_player.momentum >= 3){
					global.effect_successful = true;
				}
			}
				if(global.effect_successful){
					scr_give_choice(cardNum, "To a Monster", "To the Opponent");
					obj_player.momentum -= 3
					scr_message_stats()
					scr_discard(cardNum);
				}
		
		break;
	
	
	
	
		case 51://At long last
			if(obj_player.handCount >= 2){	
				var temp1 = obj_player.handCount - 1;
				scr_discard(cardNum);
				while (obj_player.handCount != 0){
					with(obj_player.handCard[0]){
							scr_discard(self.cardNum);
					}
			
				}
			
				with(obj_player){
					scr_draw(temp1, true);
					momentum = momentum + temp1;
					scr_message_stats();
				}

			
			}
		break;
	
	
	
		case 52://Centrifugal Reborn
			if(!scr_if_field_full()){
				var temp1 = 0;
				with(obj_player){
					if(infirmaryCount>0){
						for(var i = 0; i < infirmaryCount; i++){
							if(temp1 < macros.cardStat[infirmary[i,0],0]){temp1 = macros.cardStat[infirmary[i,0],0]+1;}
						}
						if(momentum<temp1){temp1=momentum+1;}
						scr_summon_from_infirmary_archetype("all",0,temp1,"any",cardNum);
					}
	 			}
			}
			if(global.effect_successful){scr_discard(cardNum);}
		break;
	
	
		case 53: //Healing Lullaby
			if (obj_player.momentum > 0){
				var paid_momentum = obj_player.momentum;
				obj_player.momentum = 0;
				obj_player.playerHP = obj_player.playerHP + 2*paid_momentum;
				scr_message_stats();
				paid_momentum = 0;
				scr_discard(cardNum);
			}
		break;
	
	
	
		case 56://Earthquake
			obj_player.endPhaseEffects[obj_player.endPhaseCount++]=cardNum
			global.effect_successful=true;
			scr_discard(cardNum);
		break;
	
	
		case 57://Power Discharge
			if(instance_exists(obj_field_card) || instance_exists(obj_opponent_field_card)){global.effect_successful = true;}
			if(global.effect_successful){
				scr_discard_cost("any","all",0,13,cardNum, true);
				if(global.effect_successful){
					scr_discard(cardNum);
				}
			}
		break;
	
	
		case 66://Bloodthirst
			if(player.momentum >= 6){
		
				scr_give_atk_hp("all","all",0,13,"any",6,0,cardNum,-1);
				if(global.effect_successful){	
					player.momentum -= 6;
					scr_message_stats();
					scr_discard(cardNum);
				}
			}
		break;
	
	
	
		case 91://Lucky Reel
			with(obj_player){
				var temp1 = irandom_range(0,100)
				if(temp1 < 10){
					global.effect_successful = true
				}else if(temp1 < 90){
					scr_recruit(84,0,91)
				}else if(temp1 < 99){
					scr_recruit(84,0,91)
					scr_recruit(84,0,91)
				}else if(temp1 <= 100){
					scr_recruit(86,0,91)
				}
			}
			if(global.effect_successful){	
				scr_discard(cardNum);
			}
		break;
	
	
	
		case 92://Cursed Reel
			with(obj_player){
				if (momentum > 0 && !scr_if_field_full()){
					var paid_momentum = momentum;
					momentum = 0;
					scr_message_stats();
					for (var i = 0; i < paid_momentum; i++)
					{
						var randomNum = irandom_range(0,100)
						if (randomNum <80){//Do Nothing
						}
						else if(randomNum >=80 && randomNum < 95){
							scr_recruit(84,0,92)
						}
						else if(randomNum <=100){
							scr_recruit(86,0,92)
						}
					}
					global.effect_successful=true;
				}
			}
			if(global.effect_successful){
				scr_discard(cardNum);
			}
		break;
	
	
		case 93://Marketplace of Seas
			with(obj_player){
				var temp1 = 0,
				temp2 = false;
				for(i = 0; i < infirmaryCount; i++){
					if(infirmary[i,0] == 84){
						temp1++
					}
					if(infirmary[i,0] == 86){
						temp2 = true	
					}
				}
				if(temp1 >= 5 && temp2){
					scr_give_choice(93,"Voidfy 5 Fish","Voidfy a Goldfish")
				}
				else if(temp1 >= 5){
					scr_chosen_action_effect(cardNum,0)
				}
				else if(temp2){
					scr_chosen_action_effect(cardNum,1)
				}
			}
			if(global.effect_successful){
				scr_discard(cardNum);
			}
		break;
		case 94://Highest Bidder
			with(obj_player){
				temp2 = false;
				for(i = 0; i < infirmaryCount; i++){
					if(infirmary[i,0] == 86){
						temp2 = true	
					}
				}
				if(temp2){
					for(i = 0; i < infirmaryCount; i++){
						if(infirmary[i,0] == 86){
							scr_remove_from_infirmary(i);
							break;
						}
						
					}
					scr_draw(2, true)
					scr_search_archetype(9, 0,0,13, 94)
					global.effect_successful = true;
				}
			}
			if(global.effect_successful){
				scr_discard(cardNum);
			}		
		break;
		case 100:
			scr_discard_cost("any","monster",0,13,cardNum,true)
			if(global.effect_successful){
				scr_discard(cardNum);
			}				
		break;
		case 113:
			var temp1 = 0,
			temp2= false;
			with(obj_player){
				for(i=0; i < 5; i++){
					if(scr_check_archetype(field[i,0],11)){
						temp1++;
					}
				}
				for(i=0; i < 5; i++){
					if(obj_opponent.field[i,0] !=0){
						temp2 = true;
						break;
					}
				}
				if(temp1 = 1 && temp2){
					scr_summon_from_deck_archetype(11,0,0,13,cardNum)
				}
			}
			if(global.effect_successful){
				scr_discard(cardNum);
			}				
		break;
		case 114:
			var temp1 = false;
			with(obj_player){
				for(i=0; i < 5; i++){
					if(scr_check_archetype(field[i,0],11)){
						if(!fieldCard[i].cardStatus[6]){
							temp1 = true
							break;
						}
					}
				}
				if(temp1){
					temp1 = momentum;
					momentum = 0;
					if(temp1 = 0){
						scr_miscellaneous_target("player","all",0,13,11,cardNum,"hand",-1)
					}else{
						scr_give_atk_hp("player","all",0,13,11,temp1,0,cardNum,-1)
					}
				}				
			}
			if(global.effect_successful){
				scr_discard(cardNum);
			}				
		break;
		case 115:
			var j=0,
			temp1 = false;
			
			with(obj_player){
				var x_makine=0;
				for(var i=0;i <5; i++){
					if(scr_check_archetype(field[i,0], 11)){
						x_makine++
					}
					if(macros.card_type[opponent.field[i,0]] = 1){
						temp1=true;
					}
				}
				if(temp1 && x_makine >= 2){
					for(var i = 0; i < player.momentumDeckCount; i++){
						if(scr_limited_summon(player.momentum_deck[i,0]) && scr_check_archetype(momentum_deck[i,0], 11)){
							global.filtered_cards[j++] = i;				
						}
					}
					filtered_card_count = j;
					if (filtered_card_count > 0){
						for(var i=0;i <5; i++){
							if(field[i,0] != 0){
								scr_destroy(i)
							}
						}
						global.effect_successful = true;
						for (var i = 0; i < filtered_card_count; i++){
							legal_targets[i] = instance_create_layer(525+((card_width+30)*i), room_height/2, "UpperInstances",obj_legal_targets);
							with(legal_targets[i]){
								placeInMomentumDeck = global.filtered_cards[i];
								self.cardNum = obj_player.momentum_deck[placeInMomentumDeck,0];
								self.artNum = obj_player.momentum_deck[placeInMomentumDeck,1];
								current_function = "freeImpact";
								effectBelongsTo = cardNum;
							}
						}
					}			
				}
			}
			
			if(global.effect_successful) {scr_discard(cardNum);}		
		break;
	}






	if(global.effect_successful){
		scr_message_last_action("Opponent activates "+macros.name[cardNum]);
		scr_last_action("You activated "+macros.name[cardNum]);
	}



}
