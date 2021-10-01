function scr_sacrifice(argument0) {
	var position = argument0;
	with(obj_player.fieldCard[position]){
		var cardNum = self.cardNum,
		var artNum = self.artNum;
		scr_on_sacrificed(cardNum);
		player.mana += cardStat[StatLevel];
		scr_message_stats();
		animationType = "destroy"
		obj_player.infirmary[obj_player.infirmaryCount,0] = cardNum;
		obj_player.infirmary[obj_player.infirmaryCount++,1] = artNum;
		scr_message_infirmary()
		scr_message_field(position, 0, 0, "destroy")
		instance_destroy();
		player.mid_effect = false;
	}


}
