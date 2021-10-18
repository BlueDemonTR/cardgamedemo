function scr_select_materials(player, momentumDeckPos, arrayPos){
	//The way this will work is if there is no initially selected monsters it will 
	//create a obj_appropiate_targets around the card, then everytime a monster is selected OR deselected
	//all appropiate_target objects except the selected one will be destroyed and this function will be
	//called once again, then it will try to get remaining materials for the summon. This will all be handled by
	//obj_player
	var cardNum = player.momentumDeck[momentumDeckPos, 0],
	levelRequired = macros.origStat[cardNum, StatLevel],
	mainMaterial = -1,
	mainMaterialRequired = 0,
	keyMonster = 0,
	selectedCards = resolvingPile[resolvingPileCount-1, arrayPos];
	
	impactSummoning = true;
	
	materialDisplay[0] = ["Level Requirement", 0, levelRequired]
	
	switch(cardNum){//Additional Variables for the Summonable Check are also Set Here			
		case 16://Motorbiker EoS Summoning Condition
			keyMonster = ArcMotorbikerLeader
			materialDisplay[2] = ["Motorbiker Leader", 0, 1]
		case 11://Motorbiker Leader Khan Summoning Condition
		case 12://Motorbiker Leader Luther Summoning Condition
		case 13://Motorbiker Leader Toku Summoning Condition
		case 14://Motorbiker Leader Cleo Summoning Condition
		case 15://Motorbiker Leader Ceasar Summoning Condition
			mainMaterial = ArcMotorbiker;
			mainMaterialRequired = 2;
			materialDisplay[1] = ["Motorbiker Count", 0, mainMaterialRequired]
		break;
			
		case 27://Visclades of Denial Summoning Condition
		case 28://Visclades of Anger Summoning Condition
		case 29://Visclades of Bargaining Summoning Condition
		case 30://Visclades of Depression Summoning Condition
		case 31://Visclades of Acceptance Summoning Condition
			mainMaterial = ArcVisclades;
			mainMaterialRequired = 2;
			materialDisplay[1] = ["Visclades Count", 0, mainMaterialRequired]
		break;
			
		case 47://Igloo Castle Summoning Condition
			keyMonster = 32; //Igloo
		case 48://Igloo Citadel Summoning Condition
		case 49://Igloo Kingdom Summoning Condition
			if (!keyMonster) keyMonster = cardNum - 1; //Get the lower form
			mainMaterial = ArcPoleClan;
			mainMaterialRequired = 1;
			materialDisplay[1] = ["Pole Clan Count", 0, mainMaterialRequired]
			materialDisplay[2] = [macros.name[keyMonster], 0, 1]
		break;
			
		case 70://Vengeful Cyborg Summoning Condition
			mainMaterialRequired = 2;
			materialDisplay[1] = ["Monster Count", 0, mainMaterialRequired]
		break;
			
		case 90://Fisherman of the Oceans Summoning Condition
			keyMonster = ArcFisherman;
			mainMaterial = ArcFish;
			mainMaterialRequired = 2;
			materialDisplay[1] = ["Fish Count", 0, mainMaterialRequired]
			materialDisplay[2] = ["Fisherman Count", 0, 1]
		break;
			
		case 112://Jason, DX-Makine Thunderdragon Summoning Condition
			mainMaterial = ArcXMakine;
			mainMaterialRequired = 2;
			materialDisplay[1] = ["X-Makine Count", 0, mainMaterialRequired]
		break;
	}
		
	//Summonable Check Starts Here		
	var levelCount = 0,
	mainMaterialCount = 0,
	keyMonsterHere = 0,
	mmzOccupied = false;
		
	switch(cardNum){
		case 11://Motorbiker Leader Khan Summoning Check
		case 12://Motorbiker Leader Luther Summoning Check
		case 13://Motorbiker Leader Toku Summoning Check
		case 14://Motorbiker Leader Cleo Summoning Check
		case 15://Motorbiker Leader Ceasar Summoning Check
		case 27://Visclades of Denial Summoning Check
		case 28://Visclades of Anger Summoning Check
		case 29://Visclades of Bargaining Summoning Check
		case 30://Visclades of Depression Summoning Check
		case 31://Visclades of Acceptance Summoning Check
		case 112://Jason, DX-Makine Thundermech Summoning Check
			for(var i = 0; i < array_length(selectedCards); i++){
				var position = selectedCards[i],
				FieldCard = player.fieldCard[position],
				levelIncrease = 0;
					
				if(scr_check_archetype(player.field[position, 0], mainMaterial) && FieldCard.cardStat[StatLevel] < levelRequired){
					levelIncrease = FieldCard.cardStat[StatLevel]
					mainMaterialCount++
				}
				levelCount += levelIncrease
				if(position == 4 && !levelCount){
					mmzOccupied = true;
				}
			}
			materialDisplay[0, 1] = levelCount
			materialDisplay[1, 1] = mainMaterialCount
			
			if(mmzOccupied || levelCount < levelRequired || mainMaterialCount < mainMaterialRequired){
				var selectableTargets = [];
				for(var position = 0; position < player.field_zone_count - 1; position++){
					var FieldCard = player.fieldCard[position];
					
					if(array_includes(selectedCards, position)){continue}
					
					if(mmzOccupied && !array_includes(selectableTargets, 4)){
						array_push(selectableTargets, 4);
						break;
					}
					if(scr_check_archetype(player.field[position, 0], mainMaterial) && FieldCard.cardStat[StatLevel] < levelRequired){
						array_push(selectableTargets,position)
					}
				}
				for (var i = 0; i < array_length(selectableTargets); i++){
					with(instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)){
						self.player = player
						self.position = selectableTargets[i];
						self.arrayPos = arrayPos
						self.cardNum = self.player.field[self.position, 0];
						self.artNum = self.player.field[self.position, 1];
						x = player.field_card_zone_x[self.position];
						y = player.field_card_zone_y[self.position];
						current_function = "impact"
					}		
				}
				return;
			}
		break;
		case 16://EoS Summoning Check
		case 90://Fisherman of the Oceans Summoning Check
			for(var i = 0; i < array_length(selectedCards); i++){
				var position = selectedCards[i],
				FieldCard = player.fieldCard[position],
				levelIncrease = 0;
					
				if(scr_check_archetype(player.field[position, 0], mainMaterial) && FieldCard.cardStat[StatLevel] < levelRequired){
					levelIncrease = FieldCard.cardStat[StatLevel]
					mainMaterialCount++
				}
				if(scr_check_archetype(player.field[position, 0], keyMonster) && FieldCard.cardStat[StatLevel] < levelRequired){
					levelIncrease = FieldCard.cardStat[StatLevel]
					keyMonsterHere = true;
				}
				levelCount += levelIncrease
			}
			if(player.field[4,0] && !array_includes(selectedCards, 4)){
				mmzOccupied = true;
			}			
			materialDisplay[0, 1] = levelCount
			materialDisplay[1, 1] = mainMaterialCount
			materialDisplay[2, 1] = keyMonsterHere
			
			if(mmzOccupied || levelCount < levelRequired || mainMaterialCount < mainMaterialRequired || !keyMonsterHere){
				var selectableTargets = [];
				for(var position = 0; position < player.field_zone_count - 1; position++){
					var FieldCard = player.fieldCard[position];
					
					if(array_includes(selectedCards, position)){continue}
					
					if(mmzOccupied){
						array_push(selectableTargets, 4);
						break;
					}
					if(!keyMonsterHere && scr_check_archetype(player.field[position, 0], keyMonster) && player.fieldCard[i].cardStat[StatLevel] < levelRequired){
						array_push(selectableTargets,position)
					}else if(scr_check_archetype(player.field[position, 0], mainMaterial) && FieldCard.cardStat[StatLevel] < levelRequired){
						array_push(selectableTargets,position)
					}
				}
				for (var i = 0; i < array_length(selectableTargets); i++){
					with(instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)){
						self.player = player
						self.position = selectableTargets[i];
						self.arrayPos = arrayPos
						self.cardNum = self.player.field[self.position, 0];
						self.artNum = self.player.field[self.position, 1];
						x = player.field_card_zone_x[self.position];
						y = player.field_card_zone_y[self.position];
						current_function = "impact"
					}		
				}
				return;
			}
		break;
		case 47://Igloo Castle Summoning Check
		case 48://Igloo Citadel Summoning Check
		case 49://Igloo Kingdom Summoning Check
			for(var i = 0; i < array_length(selectedCards); i++){
				var position = selectedCards[i],
				FieldCard = player.fieldCard[position],
				levelIncrease = 0;
					
				if(scr_check_archetype(player.field[position, 0], mainMaterial) && FieldCard.cardStat[StatLevel] < levelRequired){
					levelIncrease = FieldCard.cardStat[StatLevel]
					mainMaterialCount++
				}
				if(player.field[position, 0] == keyMonster && FieldCard.cardStat[StatLevel] < levelRequired){
					levelIncrease = FieldCard.cardStat[StatLevel]
					keyMonsterHere = true;
				}
				levelCount += levelIncrease
				if(position == 4 && !levelCount){
					mmzOccupied = true;
				}
			}
			materialDisplay[0, 1] = levelCount
			materialDisplay[1, 1] = mainMaterialCount
			materialDisplay[2, 1] = keyMonsterHere
			
			if(mmzOccupied || levelCount < levelRequired || mainMaterialCount < mainMaterialRequired || !keyMonsterHere){
				var selectableTargets = [];
				for(var position = 0; position < player.field_zone_count - 1; position++){
					var FieldCard = player.fieldCard[position];
					
					if(array_includes(selectedCards, position)){continue}
					
					if(mmzOccupied){
						array_push(selectableTargets, 4);
						break;
					}
					if(!keyMonsterHere && player.field[position, 0] == keyMonster && FieldCard.cardStat[StatLevel] < levelRequired){
						array_push(selectableTargets,position)
					}else if(scr_check_archetype(player.field[position, 0], mainMaterial) && FieldCard.cardStat[StatLevel] < levelRequired){
						array_push(selectableTargets,position)
					}
				}
				for (var i = 0; i < array_length(selectableTargets); i++){
					with(instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)){
						self.player = player
						self.position = selectableTargets[i];
						self.arrayPos = arrayPos
						self.cardNum = self.player.field[self.position, 0];
						self.artNum = self.player.field[self.position, 1];
						x = player.field_card_zone_x[self.position];
						y = player.field_card_zone_y[self.position];
						current_function = "impact"
					}		
				}
				return;
			}
		break;
			
		case 70://Vengeful Cyborg Summoning Check
			for(var i = 0; i < array_length(selectedCards); i++){
				var position = selectedCards[i],
				FieldCard = player.fieldCard[position],
				levelIncrease = 0;
					
				if(FieldCard.cardStat[StatLevel] < levelRequired){
					levelIncrease = FieldCard.cardStat[StatLevel]
					mainMaterialCount++
				}
					
				levelCount += levelIncrease
				if(position == 4 && !levelCount){
					mmzOccupied = true;
				}
			}
			materialDisplay[0, 1] = levelCount

			if(mmzOccupied || levelCount < levelRequired || mainMaterialCount < mainMaterialRequired || keyMonsterHere){
				var selectableTargets = [];
				for(var position = 0; position < player.field_zone_count - 1; position++){
					var FieldCard = player.fieldCard[position];
					if(mmzOccupied){
						array_push(selectableTargets, 4);
						break;
					}
					if(FieldCard.cardStat[StatLevel] < levelRequired){
						array_push(selectableTargets,position)
					}
				}
				for (var i = 0; i < array_length(selectableTargets); i++){
					with(instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)){
						self.player = player
						self.position = selectableTargets[i];
						self.arrayPos = arrayPos
						self.cardNum = self.player.field[self.position, 0];
						self.artNum = self.player.field[self.position, 1];
						x = player.field_card_zone_x[self.position];
						y = player.field_card_zone_y[self.position];
						current_function = "impact"
					}		
				}
				return;
			}
		break;
	}
	//Success
	impactSummoning = false;
	obj_player.resolvingPile[obj_player.resolvingPileCount-1,2]++
}