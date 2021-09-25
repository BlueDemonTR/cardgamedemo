function scr_on_summon(argument0){
	var cardNum = argument0;
	if(scr_check_shared(cardNum, 2)){
		scr_limit_summoning_card(cardNum);
	}
	if(scr_check_archetype(cardNum, 10)){
		if(!scr_check_archetype(cardNum,11)){
			if (obj_player.selected_wheel = 5 && !obj_player.wheel_locked){
				obj_player.momentum += obj_player.fieldCard[position].cardStat[0]
				scr_message_stats();
			}
			for(var i = 0; i < 5; i++){
				if(obj_player.field[i,0] = 90){
					if(!obj_player.fieldCard[i].cardStatus[11]){
						obj_player.fieldCard[i].cardStat[1] += obj_player.fieldCard[position].cardStat[1];
						obj_player.fieldCard[i].cardStat[2] += obj_player.fieldCard[position].cardStat[2];
						obj_player.fieldCard[i].cardStat[3] += obj_player.fieldCard[position].cardStat[3];
						scr_message_field_card_stats(i);
					}
				}
			}
			for(var i = 0; i < 5; i++){
				if(obj_player.field[i,0] = 88){
					if(!obj_player.fieldCard[i].cardStatus[11]){
						obj_player.fieldCard[i].cardStat[1] += 1;
						scr_message_field_card_stats(i);
					}
				}
			}
		}

	}
	switch(cardNum){
		case 4://Motorbiker V-Rider Activation
		case 5://Motorbiker D-Rider Activation
		case 7://Motorbiker Protector Activation
		case 22://Envious Genocider Tia Invaden	Activation	
		case 27://Genocider of Rejection Activation
		case 28://Genocider of Anger Activation
		case 30://Genocider of Depression Activation
		case 31://Genocider of Acceptance Activation
		case 33://Pole Clan Builder Activation
		case 36://Pole Clan Defender Activation
		case 37://Pole Clan Beast Activation
		case 48://Igloo Citadel Activation
			if(!scr_legal_activation(cardNum, 0, position)){break;}
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = position
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPileCount++
		break;
	
	
	
		case 54://Medic
			with(player){
				scr_recover_infirmary_archetype("all",0,3,"any",cardNum);
			}
		break;
	
	
		case 61://Bodyguard
			for(i=0;i<5;i++){
				if(player.field[i,0]==60){
					player.fieldCard[i].cardStatus[4] = true;
					scr_message_field_card_stats(i);			
				}
			}
		break;
	
	
		case 63://Rebellion Ally
			with(player){
				for(i=0;i<5;i++){
					if(field[i,0]==62){
						fieldCard[i].cardStat[2] += 2;
						fieldCard[i].cardStat[3] += 2;
						scr_message_field_card_stats(i);
					}
				}
			}
		break;
	
	
		case 68://Machine Gun Soldiers
			for (var i=0;i<5;i++){
				if(opponent.field[i,0]>0){
					opponent.fieldCard[i].cardStat[3]--;
					scr_message_opponent_field_card_stats(i)
				}
			}
		break;
	
	
		case 69://Speed Soldier
			with(player){scr_draw(1, true);}
		break;
	
	
		case 70://Mad Cyborg
			cardStatus[9] = true;
		break;
	
	
		case 71://Fool with a gun
			scr_deal_damage_to_target("all","all",0,13,"any",1,cardNum,-1)
		break;
		case 86://Goldfish
			for(var i = 0; i < 5; i++){
				if(scr_check_archetype(obj_player.field[i,0],9)){
					obj_player.fieldCard[i].cardStat[1] += 2
					obj_player.fieldCard[i].cardStat[2] += 2
					obj_player.fieldCard[i].cardStat[3] += 2
					scr_message_field_card_stats(i);
				}
			}
		break;
		case 96:
			with(player){
				playerHP += 6
				scr_message_stats()
			}
		break;
		case 99:
			scr_destroy_target("opponent", "all", 0,13,"any",cardNum,-1)
		break;
		case 101:
			scr_discard_cost("any", "all", 0,13,cardNum,false)
		break;
	}




}
