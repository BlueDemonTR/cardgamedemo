function scr_burn(target, origDamage, cardNum) {
	var damage = origDamage;

	if(scr_check_archetype(cardNum, ArcPoleClan)){
		for (var i = 0; i < 5; i++){
			if(obj_player.field[i, 0] == 38){
				damage++;
			}
		}
	}

	scr_increase_stat_player(target, PlayerHP, -damage)
	
	switch(obj_player.selected_wheel){
		case 3://Pole Clan Wheel Gain Activation Trigger
			if(target != obj_opponent){break;}
			if(!scr_legal_activation("WheelGain", 0, obj_player.selected_wheel)){break;}
			scr_add_to_resolution_pile(["WheelGain", 0, 0, obj_player.selected_wheel, false, damage])
		break;
	}	

}
