function scr_on_destroyed(cardNum, destroyType){
	if(scr_check_shared(cardNum, SharedUnderworldVisclades)){
		obj_player.resolutionPile[obj_player.resolutionPileCount,0] = "SharedUnderworldVisclades"
		obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
		obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
		obj_player.resolutionPile[obj_player.resolutionPileCount,3] = position
		obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
		obj_player.resolutionPileCount++
	}
	if(scr_check_shared(cardNum, SharedSacrifice)){
		for(var i=0; i < 3; i++){scr_recruit(74,0,cardNum)}
	}
	switch(cardNum){
		case 3://Wildrider
			if(!scr_legal_activation(cardNum, 0, position)){break;}
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = position
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPileCount++
		break;
	
	
		case 58://Shield Guy
			scr_recruit(59,0,cardNum);
		break;
	
	
		case 61://Bodyguard
			for (i=0;i < 5;i++){
				if(player.field[i,0]==61){return;}
			}
			for (var i=0;i<5;i++){
				if(player.field[i,0]==60){
					player.fieldCard[i].cardStatus[StatusIndestructable] = false;
					scr_message_field_card_stats(i);
				}
			}
		break;
	
	
		case 63://Rebellious Guy
			with(player){
				for(i=0;i<5;i++){
					if(field[i,0]==62){
						fieldCard[i,0].cardStat[StatATK] += 2;
						scr_message_field_card_stats(i);
					}
				}
			}
		break;
	
	
		case 67://Man with a pan
			player.playerHP += 3;
			scr_message_stats();
		break;
		case 78://Ultimate Sacrifice
			for(var i=0; i < 3; i++){scr_recruit(random_range(74,77),0,cardNum)}
			
			
		break;
	}


}
