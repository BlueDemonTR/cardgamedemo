function scr_burn(target, damage, cardNum) {

	if(scr_check_archetype(cardNum, ArcPoleClan)){
		for (var i=0;i < 5;i++){
			if(obj_player.field[i,0]==38){damage++;}
		}
	}


	target.playerHP -= damage;
	if(obj_player.selected_wheel=3 && target=obj_opponent){
		scr_give_player_stats(obj_player, 0, 0, 0, damage)
		obj_player.momentum += damage;
	}
	global.effect_successful = true
	if(target = obj_player){
		scr_message_stats();
	}else if(target = obj_opponent){
		scr_message_opponent_stats()
	}

}
