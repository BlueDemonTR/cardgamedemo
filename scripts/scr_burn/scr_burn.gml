function scr_burn(target, damage, cardNum) {

	if(scr_check_archetype(cardNum,4)){
		for (var i=0;i < 5;i++){
			if(obj_player.field[i,0]==38){damage++;}
		}
	}


	target.playerHP -= damage;
	if(obj_player.selected_wheel=3 && target=obj_opponent){
		obj_player.momentum += damage;
	}
	global.effect_successful = true
	if(target = obj_player){
		scr_message_stats();
	}else if(target = obj_opponent){
		scr_message_opponent_stats()
	}

}
