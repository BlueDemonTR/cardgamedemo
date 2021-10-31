// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_count_impact(player){
	/*
	This is a special type of count function as it returns all
	impact summonable momentum monsters in the momentum 
	deck instead of just returning a number.
	
	FFA:
	Why does the code here look messy?
	Impact Summoning is an infinitely expandable mechanic, as such, the material check should also
	stay the same way, while most momentum monsters require a specific archetyped materials and maybe one
	key monster, some may require 3 key monsters, generic monsters, additional discards or maybe no monsters
	at all but for specific conditions to be met, hence why, everything that has anything to do with Impact
	summoning can't be standarized
	*/
	var summonableMonsters = [];
	
	for(var momentumDeckPos = 0; momentumDeckPos < player.momentumDeckCount; momentumDeckPos++){
		var cardNum = player.momentumDeck[momentumDeckPos, 0],
		levelRequired = macros.origStat[cardNum, StatLevel],
		mainMaterial = -1,
		mainMaterialRequired = 0,
		keyMonster = 0;
		
		if(!scr_limited_summon(cardNum)){continue;}
		
		switch(cardNum){//Additional Variables for the Summonable Check are also Set Here			
			case 16://Motorbiker EoS Summoning Condition
				keyMonster = ArcMotorbikerLeader
			case 11://Motorbiker Leader Khan Summoning Condition
			case 12://Motorbiker Leader Luther Summoning Condition
			case 13://Motorbiker Leader Toku Summoning Condition
			case 14://Motorbiker Leader Cleo Summoning Condition
			case 15://Motorbiker Leader Ceasar Summoning Condition
				mainMaterial = ArcMotorbiker;
				mainMaterialRequired = 2;
			break;
			
			case 27://Visclades of Denial Summoning Condition
			case 28://Visclades of Anger Summoning Condition
			case 29://Visclades of Bargaining Summoning Condition
			case 30://Visclades of Depression Summoning Condition
			case 31://Visclades of Acceptance Summoning Condition
				mainMaterial = ArcVisclades;
				mainMaterialRequired = 2;
			break;
			
			case 47://Igloo Castle Summoning Condition
				keyMonster = 32; //Igloo
			case 48://Igloo Citadel Summoning Condition
			case 49://Igloo Kingdom Summoning Condition
				if (!keyMonster) keyMonster = cardNum - 1; //Get the lower form
				mainMaterial = ArcPoleClan;
				mainMaterialRequired = 1;
			break;
			
			case 70://Vengeful Cyborg Summoning Condition
				mainMaterialRequired = 2;
			break;
			
			case 90://Fisherman of the Oceans Summoning Condition
				keyMonster = ArcFisherman;
				mainMaterial = ArcFish;
				mainMaterialRequired = 2;		
			break;
			
			case 112://Jason, DX-Makine Thunderdragon Summoning Condition
				mainMaterial = ArcXMakine;
				mainMaterialRequired = 2;
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
				for(var j = 0; j < player.field_zone_count; j++){
					var FieldCard = player.fieldCard[j],
					levelIncrease = 0;
					
					if(!instance_exists(FieldCard)){continue}
					
					if(scr_check_archetype(player.field[j, 0], mainMaterial) && FieldCard.getStat(StatLevel) < levelRequired){
						levelIncrease = FieldCard.getStat(StatLevel)
						mainMaterialCount++
					}
					levelCount += levelIncrease
					if(j == 4 && !levelCount){
						mmzOccupied = true;
					}
				}
				if(mmzOccupied || levelCount < levelRequired || mainMaterialCount < mainMaterialRequired){
					continue;
				}
			break;
			case 16://EoS Summoning Check
			case 90://Fisherman of the Oceans Summoning Check
				for(var j = 0; j < player.field_zone_count; j++){
					var FieldCard = player.fieldCard[j],
					levelIncrease = 0;
					
					if(!instance_exists(FieldCard)){continue}
					
					if(scr_check_archetype(player.field[j, 0], mainMaterial) && FieldCard.getStat(StatLevel) < levelRequired){
						levelIncrease = FieldCard.getStat(StatLevel)
						mainMaterialCount++
					}
					if(scr_check_archetype(player.field[j, 0], keyMonster) && FieldCard.getStat(StatLevel) < levelRequired){
						levelIncrease = FieldCard.getStat(StatLevel)
						keyMonsterHere = true;
					}
					levelCount += levelIncrease
					if(j == 4 && !levelCount){
						mmzOccupied = true;
					}
				}
				if(mmzOccupied || levelCount < levelRequired || mainMaterialCount < mainMaterialRequired || !keyMonsterHere){
					continue;
				}
			break;
			case 47://Igloo Castle Summoning Check
			case 48://Igloo Citadel Summoning Check
			case 49://Igloo Kingdom Summoning Check
				for(var j = 0; j < player.field_zone_count; j++){
					var FieldCard = player.fieldCard[j],
					levelIncrease = 0;
					
					if(!instance_exists(FieldCard)){continue}
					
					if(scr_check_archetype(player.field[j, 0], mainMaterial) && FieldCard.getStat(StatLevel) < levelRequired){
						levelIncrease = FieldCard.getStat(StatLevel)
						mainMaterialCount++
					}
					if(player.field[j, 0] == keyMonster && FieldCard.getStat(StatLevel) < levelRequired){
						levelIncrease = FieldCard.getStat(StatLevel)
						keyMonsterHere = true;
					}
					levelCount += levelIncrease
					if(j == 4 && !levelCount){
						mmzOccupied = true;
					}
				}
				if(mmzOccupied || levelCount < levelRequired || mainMaterialCount < mainMaterialRequired || !keyMonsterHere){
					continue;
				}
			break;
			
			case 70://Vengeful Cyborg Summoning Check
				for(var j = 0; j < player.field_zone_count; j++){
					var FieldCard = player.fieldCard[j],
					levelIncrease = 0;
					
					if(!instance_exists(FieldCard)){continue}
					
					if(FieldCard.getStat(StatLevel) < levelRequired){
						levelIncrease = FieldCard.getStat(StatLevel)
						mainMaterialCount++
					}
					
					levelCount += levelIncrease
					if(j == 4 && !levelCount){
						mmzOccupied = true;
					}
				}
				if(mmzOccupied || levelCount < levelRequired || mainMaterialCount < mainMaterialRequired){
					continue;
				}
			break;
		}
		array_push(summonableMonsters, momentumDeckPos)
	}
	return summonableMonsters;
}