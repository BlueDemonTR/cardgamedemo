function scr_chosen_action_effect(argument0, argument1) {
	var cardNum=argument0,
	choiceNum =argument1;
	switch(cardNum){
		case 44:
			if(choiceNum=0){
				scr_deal_damage_to_target("all","all",0,13,"any",7,cardNum,-1);
			}else{
				
			}
		break;
		case 93:
			with(obj_player){		
				if(choiceNum == 0){
					temp1 = 0
					for(var i = infirmaryCount-1; temp1 < 5; i--){
						if(infirmary[i,0] == 84){
							temp1++
							scr_remove_from_infirmary(i);
						}
					}
					mana += 3
					scr_message_stats()
					scr_draw(1, true)
					global.effect_successful = true
				}
				else if(choiceNum == 1){
					for(i = 0; i < infirmaryCount; i++){
						if(infirmary[i,0] == 86){
							scr_remove_from_infirmary(i);
						}
						break;
					}
					
					mana += 3
					scr_message_stats()
					scr_draw(1, true)
					global.effect_successful = true;			
				}
			}
		break;
		case 112:
			with(obj_player){
				if(choiceNum=0){
					scr_deal_damage_to_target("opponent","all",0,13,"any",8,cardNum,-1);
				}else{
					scr_burn(obj_opponent,8,cardNum);
				}
			}
		break;
	}



}
