function scr_on_sacrificed(argument0) {
	var cardNum = argument0;
	
	if(obj_player.selected_wheel = 4 && !obj_player.wheel_locked){
		obj_player.momentum += cardStat[StatLevel]
	}
	switch(cardNum){
		case 74://useless sacrifice
			scr_limit_summon_to(7, 8)
		break;
		case 75://wealthy sacrifice
			with(obj_player){
				scr_draw(1, true)
			}
		break;
		case 76://ruthless sacrifice
			scr_destroy_target("opponent","all",0,5,"any",cardNum,-1)
		break;
		case 77://Cursed Sacrifice
			scr_summon_from_infirmary_archetype("all",0,13,8,cardNum)
		break;
		case 78://Ultimate Sacrifice
			scr_summon_from_deck_archetype(8,0,0,13,cardNum)
		break;
	}


}
