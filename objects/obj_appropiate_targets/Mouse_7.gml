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
	
	
	
	case "impact":	
		if (!force_select){
			if(selected){
				selected = false;
				obj_player.currentLevel -= obj_player.fieldCard[self.position].cardStat[StatLevel];
				if (obj_player.momentum_deck[cardToSummon,0] > 10 && obj_player.momentum_deck[cardToSummon,0] < 17){
					obj_player.motorbikers--;
					if(obj_player.momentum_deck[cardToSummon,0] == 16 && scr_check_archetype(player.field[self.position,0], 2)){
						obj_player.leader = false;
					}
				}
				if (obj_player.momentum_deck[cardToSummon,0] >= 27 && obj_player.momentum_deck[cardToSummon,0] <= 31){
					obj_player.visclades--;
				}
				if (obj_player.momentum_deck[cardToSummon,0] >= 47 && obj_player.momentum_deck[cardToSummon,0] <= 49){
					obj_player.poleclan--;
				}
				if (obj_player.momentum_deck[cardToSummon,0] == 78){
					obj_player.sacrifices--;
				}
				if (obj_player.momentum_deck[cardToSummon,0] == 90){
					obj_player.fishes--;
					if(scr_check_archetype(player.field[self.position,0], 9)){
						obj_player.fisherman= false;
					}
				}
				else if (obj_player.momentum_deck[cardToSummon,0] == 112){
					obj_player.x_makines--;
				}				
			}
			else if(!selected){
				selected = true;
				obj_player.currentLevel += obj_player.fieldCard[self.position].cardStat[StatLevel];
				if (obj_player.momentum_deck[cardToSummon,0] > 10 && obj_player.momentum_deck[cardToSummon,0] < 17){
					obj_player.motorbikers++;
					if(obj_player.momentum_deck[cardToSummon,0] == 16 && scr_check_archetype(player.field[self.position,0], 2)){
						obj_player.leader = true;
						obj_player.motorbikers++;
		
					}
				}
				else if (obj_player.momentum_deck[cardToSummon,0] >= 27 && obj_player.momentum_deck[cardToSummon,0] <= 31){
					obj_player.visclades++;
				}
				else if (obj_player.momentum_deck[cardToSummon,0] >= 47 && obj_player.momentum_deck[cardToSummon,0] <= 49){
					obj_player.poleclan++;
				}
				else if (obj_player.momentum_deck[cardToSummon,0] == 78){
					obj_player.sacrifices++;
				}
				else if (obj_player.momentum_deck[cardToSummon,0] == 90){
					obj_player.fishes++;
					if(scr_check_archetype(player.field[self.position,0], 9)){
						obj_player.fisherman= true;
					}
				}
				else if (obj_player.momentum_deck[cardToSummon,0] == 112){
					obj_player.x_makines++;
				}
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