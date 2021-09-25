function scr_cost_effect(argument0, argument1) {
	var cardNum = argument0,
	discardedCard = argument1;
	switch(cardNum){
		case 43:
			scr_silence_target("all", "all",0,13,"any",43, true);
		break;
		case 57:
			if(obj_player.playerHP > 5){
				scr_destroy_target("all","all",0,13,"any",cardNum,-1)
			}else{
				for(var j=0; j < 5; j++){
					if(obj_player.field[j,0] > 0){
						with(obj_player){scr_destroy(j);}
					}
					if(obj_opponent.field[j,0] > 0){
						with(obj_opponent){scr_destroy(j);}
					}
				}
			}
		break;
		case 60:
			scr_recruit(61,0,60);
		break;
		case 79:
		with(obj_opponent){
			if(handCount > 0){
				var temp1 = irandom_range(0,handCount-1),
				temp2 = hand[temp1,0],
				temp3 = hand[temp1,1];
				hand[temp1,0] = 0;
				hand[temp1,1] = 0;
				//for(var i = temp1; i < handCount; i++){
				//	hand[i] = hand[i+1];
							
				//}
				global.effect_successful = true;
				infirmary[infirmaryCount++,0] = temp2;
				infirmary[infirmaryCount++,1] = temp3;
				scr_message_opponent_infirmary();
				scr_message_opponent_hand_change();
			}
		}
		break;
		case 80:
			scr_spin_target("all","all",0,13,"any",cardNum,-1);
		break;
		case 100:
			with(obj_player){
				momentum += 3
				scr_message_stats()
			}
		break;
	}


}
