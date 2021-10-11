function scr_attack(attackingCard) {
	//attackingCard should be an object
	var i = 0,
	attackArray = scr_count_attack(attackingCard);
	
	if(attackArray[i] == "opponent"){
		with(instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)){
			player = obj_opponent
			current_function = "DirectAttack";
			x = 520;
			y = 325;
			self.attackingCard = attackingCard;	
		}
		i++
	}
	
	for (var i; i < array_length(attackArray); i++){
		with(instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)){
			player = obj_opponent
			position = i;
			current_function = "Attack";
			x = player.field_card_zone_x[position];
			y = player.field_card_zone_y[position];
			effectBelongsToLocation = attackingCard;
		}		
	}
}
