var function_check = current_function;
switch (current_function){
	case "target":
	case "chooseZone":
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos] = position;
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos+1] = player;
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,2]++
		with(obj_appropiate_targets){
			if(function_check == current_function){
				alarm[0] = 1;
			}
		}
	break;

	case "attack":
		var effectBelongsToLocation = self.effectBelongsToLocation,
		field_location = self.field_location,
		attacker = obj_player.fieldCard[effectBelongsToLocation],
		attacked = obj_opponent.fieldCard[field_location];
		
		attacker.attacksLeft--
		attacker.cardis_sacrificable = false;
		if(attacked.cardStat[StatDodge] = 0){
			with (attacker){scr_on_attack(attacker.cardNum, attacker, attacked);}
			with (attacked){
				var excessDamage = (attacker.cardStat[StatATK] - cardStat[StatArmor]) - cardStat[StatHP];
				cardStat[StatHP] -= attacker.cardStat[StatATK] - cardStat[StatArmor];
				var counterAttack = cardStat[StatATK];
		
				if (attacker.cardStatus[StatusPierce] && excessDamage > 0){
					obj_opponent.playerHP -= excessDamage
					scr_message_opponent_stats();	
					with(attacker){scr_on_pierce(attacker.cardNum);}
				}
				if(cardStat[StatHP] <= 0){
					with(attacker){
						destroyedMonster = attacked.cardNum;
						scr_destroys_by_battle(cardNum, destroyedMonster);
					}
				}
			
			}
			with (attacker){
				if(cardNum != 14){cardStat[StatHP] -= counterAttack - cardStat[StatArmor];}
		
				if (attacked.cardStatus[StatusRebellious] && excessDamage > 0){
					obj_player.playerHP -= excessDamage
					scr_message_stats();
					with(attacked){scr_on_pierce(attacked.cardNum);}
				}
				if(cardStat[StatHP] > 0){scr_after_attack(cardNum)}
			}
		}else{
			attacked.cardStat[StatDodge]--;
		}
		scr_message_field_card_stats(effectBelongsToLocation);
		scr_message_opponent_field_card_stats(field_location);	
		with(obj_appropiate_targets){
			if(function_check == current_function || current_function == "direct_attack"){
				alarm[0] = 1;
			}
		}

	break;




	case "direct_attack":
		var effectBelongsToLocation = self.effectBelongsToLocation,
		field_location = self.field_location,
		attacker = obj_player.fieldCard[effectBelongsToLocation];
		with(attacker){
			attacksLeft--
			cardis_sacrificable = false;
		}
		with(attacker){
			scr_on_attack(cardNum, attacker, "opponent");
			scr_on_direct_attack(cardNum);
		}
		with(player){
			playerHP -= attacker.cardStat[StatATK];
			
		}
		
		with(attacker){
			damageToPlayer = attacker.cardStat[StatATK];
			scr_after_direct_attack(cardNum);
			scr_after_attack(cardNum);
			scr_message_field_card_stats(position)
		}
		scr_message_stats();
		scr_message_opponent_stats();
		with(obj_appropiate_targets){
			if(function_check == current_function || current_function == "attack"){
				alarm[0] = 1;
			}
		}

	break; 
	
	
	
	case "impact":	
		if (!force_select){
			if(selected){
				selected = false;
				obj_player.currentLevel -= obj_player.fieldCard[self.field_location].cardStat[StatLevel];
				if (obj_player.momentum_deck[cardToSummon,0] > 10 && obj_player.momentum_deck[cardToSummon,0] < 17){
					obj_player.motorbikers--;
					if(obj_player.momentum_deck[cardToSummon,0] == 16 && scr_check_archetype(player.field[self.field_location,0], 2)){
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
					if(scr_check_archetype(player.field[self.field_location,0], 9)){
						obj_player.fisherman= false;
					}
				}
				else if (obj_player.momentum_deck[cardToSummon,0] == 112){
					obj_player.x_makines--;
				}				
			}
			else if(!selected){
				selected = true;
				obj_player.currentLevel += obj_player.fieldCard[self.field_location].cardStat[StatLevel];
				if (obj_player.momentum_deck[cardToSummon,0] > 10 && obj_player.momentum_deck[cardToSummon,0] < 17){
					obj_player.motorbikers++;
					if(obj_player.momentum_deck[cardToSummon,0] == 16 && scr_check_archetype(player.field[self.field_location,0], 2)){
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
					if(scr_check_archetype(player.field[self.field_location,0], 9)){
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
		discardedCard = player.hand[position];
		
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos] = position;
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos+1] = discardedCard;
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,2]++
		with(obj_appropiate_targets){
			if(function_check == current_function){
				alarm[0] = 1;
			}
		}
	break;
}