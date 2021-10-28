var function_check = current_function,
arrayPos = self.arrayPos;
switch (current_function){
	case TargetMonster:
	case TargetZone:
		if(obj_player.own_turn){
			obj_player.resolvingPile[obj_player.resolvingPileCount-1,arrayPos] = position;
			obj_player.resolvingPile[obj_player.resolvingPileCount-1,arrayPos+1] = player;
			obj_player.resolvingPile[obj_player.resolvingPileCount-1,2]++
		}else{
			scr_message_handle_response(arrayPos, position, string(player))
		}
		with(obj_appropiate_targets){
			if(function_check == current_function){
				instance_destroy();
			}
		}
	break;
	case TargetImpact:
		if(selected){
			for(var i = 0; i < array_length(obj_player.resolvingPile[obj_player.resolvingPileCount-1,arrayPos]); i++){
				if(obj_player.resolvingPile[obj_player.resolvingPileCount-1,arrayPos][i] == position){
					array_delete(obj_player.resolvingPile[obj_player.resolvingPileCount-1,arrayPos],i,1)
					break;
				}
			}
			selected = false
		}else{
			array_push(obj_player.resolvingPile[obj_player.resolvingPileCount-1,arrayPos], position)
			selected = true
		}
		with(obj_appropiate_targets){
			if(function_check == current_function && !selected){
				instance_destroy();
			}
		}
		with(obj_player){
			scr_select_materials(player, obj_player.resolvingPile[obj_player.resolvingPileCount-1,arrayPos-1], arrayPos)
		}		
	break;
	case TargetAttack:
		var attackingCard = self.attackingCard,
		attackedCard = obj_opponent.fieldCard[position];

		attackingCard.attacksLeft--
		attackingCard.sacrificable = false;
		
		scr_add_to_resolution_pile("Attack", 0, 0, attackingCard.player, attackingCard.position, -1, attackedCard)
		
		scr_on_attack(attackingCard, attackedCard)
		
		scr_card_on_attacked(attackedCard, attackingCard)

		with(obj_appropiate_targets){
			if(function_check == current_function || current_function == TargetDirect){
				instance_destroy();
			}
		}
		obj_player.open_game_state = true;
	break;

	case TargetDirect:
		var attackingCard = self.attackingCard;
		
		attackingCard.attacksLeft--
		attackingCard.sacrificable = false;
		
		scr_add_to_resolution_pile("DirectAttack", 0, 0, attackingCard.player, attackingCard.position, -1)
		
		scr_on_attack(attackingCard, player)
		scr_on_direct_attack(attackingCard)
		
		with(obj_appropiate_targets){
			if(function_check == current_function || current_function == TargetAttack){
				instance_destroy();
			}
		}
		obj_player.open_game_state = true;
	break;

	case TargetDiscard:
		selectedCard = player.hand[position, 0];
		if(obj_player.own_turn){
			obj_player.resolvingPile[obj_player.resolvingPileCount-1,arrayPos] = position;
			obj_player.resolvingPile[obj_player.resolvingPileCount-1,arrayPos + 1] = player;
			obj_player.resolvingPile[obj_player.resolvingPileCount-1,arrayPos + 2] = selectedCard;
			obj_player.resolvingPile[obj_player.resolvingPileCount-1,2]++
		}else{
			scr_message_handle_response(arrayPos, position, player, selectedCard)
		}
		with(obj_appropiate_targets){
			if(function_check == current_function){
				instance_destroy();
			}
		}
	break;
}