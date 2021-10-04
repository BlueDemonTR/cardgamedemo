function scr_burn(target, damage, cardNum) {

	if(scr_check_archetype(cardNum, ArcPoleClan)){
		for (var i=0;i < 5;i++){
			if(obj_player.field[i,0]==38){damage++;}
		}
	}

	scr_give_player_stats(target, 0, -damage, 0, 0)
	
	if(obj_player.selected_wheel=3 && target=obj_opponent){
		scr_give_player_stats(obj_player, 0, 0, 0, damage)
	}

}
