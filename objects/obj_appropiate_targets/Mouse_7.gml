var function_check = current_function;
switch (current_function){
	case "target":
	case "chooseZone":
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos] = position;
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos+1] = player;
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,2]++
		with(obj_appropiate_targets){
			if(function_check == current_function){
				instance_destroy();
			}
		}
	break;
	case "impact":
		if(selected){
			array_push(obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos], position)
			selected = true
		}else{
			for(var i = 0; i < array_length(obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos]); i++){
				if(obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos][i] == position){
					array_delete(obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos],i,1)
					break;
				}
			}
			array_push(obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos], position)
			selected = false			
		}
		with(obj_player){
			scr_select_materials(player, obj_player.resolutionPile[obj_player.resolutionPileCount-2,arrayPos], arrayPos)
		}
		with(obj_appropiate_targets){
			if(function_check == current_function && !selected){
				instance_destroy();
			}
		}
	break;
	case "Attack":
		var attackingCard = self.attackingCard,
		position = self.position,
		attackedCard = obj_opponent.fieldCard[position];

		attackingCard.attacksLeft--
		attackingCard.sacrificable = false;
		
		scr_add_to_resolution_pile(["Attack", 0, 0, attackingCard, false, attackedCard])
		
		scr_on_attack(attackingCard, attackedCard)
		
		scr_card_on_attacked(attackedCard, attackingCard)

		with(obj_appropiate_targets){
			if(function_check == current_function || current_function == "direct_attack"){
				instance_destroy();
			}
		}
	break;

	case "DirectAttack":
		var attackingCard = self.attackingCard,
		position = self.position;

		attackingCard.attacksLeft--
		attackingCard.sacrificable = false;
		
		scr_add_to_resolution_pile(["DirectAttack", 0, 0, attackingCard, -1])
		
		scr_on_attack(attackingCard, attackedCard)
		scr_on_direct_attack(attackingCard)
		
		with(obj_appropiate_targets){
			if(function_check == current_function || current_function == "attack"){
				instance_destroy();
			}
		}
	break;

	case  "discard":
		discardedCard = player.hand[position, 0];
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos] = position;
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos+1] = player;
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos+2] = discardedCard;
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,2]++
		with(obj_appropiate_targets){
			if(function_check == current_function){
				alarm[0] = 1;
			}
		}
	break;
}