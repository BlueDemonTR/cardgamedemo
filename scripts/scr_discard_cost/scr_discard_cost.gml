function scr_discard_cost(argument0, argument1, argument2, argument3, argument4, argument5) {
	var filterArchetype=argument0,//any if generic
	filterTypes=argument1, //monster,spell,all
	filterMinLevel=argument2, //int64 0-12
	filterMaxLevel=argument3,//int64 1-13
	activatedCard=argument4,
	discardCard=argument5, //If the activated card will be sent from hand to infirmary
	temp1 = 0;
	if(discardCard){
		if(hand_position != player.handCount -1){
			temp1 = true;
		}
	}
	if (!variable_instance_exists(id,"hand_position")){
		hand_position = -1
	}
	global.effect_successful = true;
	obj_player.mid_effect =true;

	scr_appropiate_hand(filterArchetype,filterTypes,filterMinLevel,filterMaxLevel, discardCard, false);

	for (var i=0; i < filtered_card_count; i++){
		if(temp1 || i != hand_position){
			if(discardCard){
				if(global.filtered_cards[i] > hand_position){
					global.filtered_cards[i]--
				}
			}
			target_select[i] = instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)
			with(target_select[i]){
				player=obj_player;
				field_location = global.filtered_cards[i];
				current_function = "discard";
				x=player.handCard[i].x
				y=player.handCard[i].y
				effectBelongsTo = activatedCard;	
			}
		}
	}

	if(filtered_card_count==0){
		global.effect_successful=false;
		obj_player.mid_effect = 0;
	}


}
