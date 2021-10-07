obj_player.mid_effect=true;
var origin_card_location = self.origin_card_location;
switch(activation_mode){
	case "Attack":
		scr_attack(origin_card_location);
	break;
	case "Sacrifice":
		scr_sacrifice(origin_card_location);	
	break;
	case "Effect":
		switch(obj_player.field[origin_card_location,0]){
			case 14://Motorbiker Leader Cleo Activation
			case 29://Visclades of Denial Activation
			case 35://Pole Clan Mage Activation Activation
			case 47://Igloo Castle Activation
			case 49://Igloo Kingdom Activation
				obj_player.resolutionPile[obj_player.resolutionPileCount,0] = obj_player.field[origin_card_location,0]
				obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
				obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
				obj_player.resolutionPile[obj_player.resolutionPileCount,3] = origin_card_location
				obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
				obj_player.resolutionPileCount++				
			break;
			case 60:
				scr_discard_cost("any","all",0,13,60, false);
			break;
			case 62:
				scr_recruit(63,0,62);
				if(global.effect_successful && obj_player.fieldCard[origin_card_location] != noone){
					obj_player.fieldCard[origin_card_location].opt_used = true;
				}			
			break;
			case 79://long figure
				scr_discard_cost("any","all",0,13,79,false)
				if(global.effect_successful && obj_player.fieldCard[origin_card_location] != noone){
					scr_hopt_used(obj_player.field[origin_card_location,0])
				}	
			break;
			case 80:
				scr_discard_cost("any","all",0,13,80,false)
				if(global.effect_successful && obj_player.fieldCard[origin_card_location] != noone){
					scr_hopt_used(obj_player.field[origin_card_location,0])
				}	
			break;
			case 81:
				if(obj_opponent.momentum > 2){
					obj_opponent.momentum -= 2;
				}else{
					obj_opponent.momentum = 0
				}
				global.effect_successful=true;
				if(global.effect_successful && obj_player.fieldCard[origin_card_location] != noone){
					scr_hopt_used(obj_player.field[origin_card_location,0])
					scr_message_opponent_stats()
				}
			break;
			case 82:
	
			break;
			case 83:
			break;	
			case 85:
			break;
			case 88:
				with(obj_player){
					var temp1 = irandom_range(0,100)
					if(temp1 < 10){
						global.effect_successful = true
					}else if(temp1 < 90){
						scr_recruit(84,0,85)
					}else if(temp1 <= 100){
						scr_destroy_target("opponent","all",0,13,"any",88,-1)
						scr_recruit(84,0,83)
					}
				}
				if(obj_player.fieldCard[origin_card_location] != noone){
					obj_player.fieldCard[origin_card_location].opt_used = true;
				}	
			break;
			case 89:
				with(obj_player){
					var temp1 = irandom_range(0,100)
					if(temp1 < 10){
						for(i = 0; i < 5; i++){
							if(scr_check_archetype(field[i, CardNumber],10)){
								fieldCard[i].cardStatus[StatusUnarmed] = true;
							}
						}
						global.effect_successful = true
					}else if(temp1 < 30){
						scr_recruit(84,0,89)
					}else if(temp1 < 90){
						temp2 = false
						scr_recruit(84,0,89)
						if(global.effect_successful){temp2 = true}
						scr_recruit(84,0,89)
						if(temp2){global.effect_successful = true}
					}else if(temp1 <= 100){
						scr_recruit(86,0,89)
					}
				}
				if(obj_player.fieldCard[origin_card_location] != noone){
					obj_player.fieldCard[origin_card_location].opt_used = true;
				}			
			break;
			case 90:
				with(obj_player){
					var temp1 = irandom_range(0,100)
					if(temp1 < 30){
						scr_recruit(84,0,90)
						
					}else if(temp1 < 80){
						scr_recruit(84,0,90)
						if(global.effect_successful){temp2 = true}
						scr_summon_from_infirmary_archetype("all",0,13,9,90)
						if(temp2){global.effect_successful = true}
					}else if(temp1 < 95){
						scr_recruit(84,0,90)
						if(global.effect_successful){temp2 = true}
						scr_recruit(84,0,90)
						scr_recruit(84,0,90)
						if(temp2){global.effect_successful = true}
					}else if(temp1 <= 100){
						scr_recruit(86,0,90)
					}
				}
				if(obj_player.fieldCard[origin_card_location] != noone){
					if(obj_player.fieldCard[origin_card_location].mtpt > 0){
						obj_player.fieldCard[origin_card_location].mtpt--
					}
					if(obj_player.fieldCard[origin_card_location].mtpt = 0){
						obj_player.fieldCard[origin_card_location].opt_used = true;
					}
				}
			break;
			case 107:
				with(obj_player){
					for(var i=0; i < 5; i++){
						if(i = origin_card_location){continue}
						if(field[i, CardNumber]> 0){
							if(scr_check_archetype(field[i, CardNumber], 11)){
								fieldCard[i].cardStat[StatATK]+=1;
								scr_message_field_card_stats(i);
							}
						}
					}
					momentum += 4;
					scr_message_stats()
				}
				if(obj_player.fieldCard[origin_card_location] != noone){
					obj_player.fieldCard[origin_card_location].opt_used = true;
				}
			break;
			case 108:
				with(obj_player){
					for(var i=0; i < 5; i++){
						if(i = origin_card_location){continue}
						if(field[i, CardNumber]> 0){
							if(scr_check_archetype(field[i], 11)){
								fieldCard[i].cardStat[StatMaxHP] +=1;
								fieldCard[i].cardStat[StatHP] +=1;
								scr_message_field_card_stats(i);
							}
						}
					}
					momentum += 4;
					scr_message_stats()
				}
				if(obj_player.fieldCard[origin_card_location] != noone){
					obj_player.fieldCard[origin_card_location].opt_used = true;
				}				
			break;
			case 109:
				with(obj_player){
					scr_search_archetype(11,0,0,13,109)
					momentum += 4;
					scr_message_stats()
				}
				if(obj_player.fieldCard[origin_card_location] != noone){
					obj_player.fieldCard[origin_card_location].opt_used = true;
				}				
			break;
			case 110:
				with(obj_player){
					scr_recover_infirmary_archetype("all",0,13,11,110)
					
					momentum += 4;
					scr_message_stats()
				}
				if(obj_player.fieldCard[origin_card_location] != noone){
					obj_player.fieldCard[origin_card_location].opt_used = true;
				}				
			break;
			case 111:
			break;
			case 112:
			break;
		}
	case "Hand Effect":
		if(scr_check_shared(obj_player.hand[origin_card_location,0], ArcVisclades)){
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = "SharedVisclades"
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = origin_card_location
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPileCount++
		}
	break;
	case "Infirmary Effect":
		switch(obj_player.infirmary[origin_card_location,0]){
			case 21:
				obj_player.resolutionPile[obj_player.resolutionPileCount,0] = "Shared3"
				obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 1
				obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
				obj_player.resolutionPile[obj_player.resolutionPileCount,3] = origin_card_location
				obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
				obj_player.resolutionPileCount++				
			break;
		}
	break;
	case "Multiple Choices":
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos] = choiceNum;
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,2]++
		with(obj_activation_box){
			if(global.effect_successful && activation_mode == "Multiple Choices"){
				instance_destroy();
			}
		}	
	break;	
}
with(obj_activation_box){
	if(activation_mode != "Multiple Choices"){
		instance_destroy();
	}
}