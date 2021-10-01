switch(animationInfo[0]){
	case 1:
		{
			for(var i = 0; i < 2; i++){
				if(animationInfo[i+1] <= 4){
					locationInfo[i,0] = player.field_card_zone_x[animationInfo[i+1]]
					locationInfo[i,1] = player.field_card_zone_y[animationInfo[i+1]]
					if(i+1=1){
						cardAngle = 0
						cardNum = 1
						artNum = 0
					}
				}else if(animationInfo[i+1] <= 9){
					locationInfo[i,0] = opponent.field_card_zone_x[animationInfo[i+1]-5]
					locationInfo[i,1] = opponent.field_card_zone_y[animationInfo[i+1]-5]
					if(i+1=1){
						cardAngle =180
						cardNum = 1
						artNum = 0
					}
				}else if(animationInfo[i+1] = 10){
					locationInfo[i,0] = room_width/2
					locationInfo[i,1] = 0
				}else if(animationInfo[i+1] = 11){
					locationInfo[i,0] = room_width/2
					locationInfo[i,1] = room_height				
				}

			}
			x = locationInfo[0,0]
			y = locationInfo[0,1]
			timer = 1
			runAnimation = true		
		}
	break;
	case 2:
		{
			summonedCardNum = animationInfo[1]
			summonedArtNum = animationInfo[2]
			summonedCardLevel = 0;
			summonedCardAlpha = 0;
			materialCount = animationCount - 3
			for(var i = 3; i < animationCount; i++){
				materialInfo[i-3,0] = animationInfo[i] //position
				materialInfo[i-3,1] = player.field[materialInfo[i-3,0],0] //cardNum
				materialInfo[i-3,2] = player.field[materialInfo[i-3,0],1] //artNum
				//materialInfo[i-2,2] = player.fieldCard[materialInfo[i-3,0]] //Card Level
				materialInfo[i-3,3] = macros.origStat[i-3, StatLevel] //Card Level
			}
			for(var i = 0; i < materialCount; i += 2){
				materialInfo[i,4] = ((i+1)*(405/(materialCount/2 + 1))) + 75
				materialInfo[i+1,4] = -materialInfo[i,4]
			}
			for(var i = 0; i < materialCount; i++){
				materialInfo[i,5] = materialInfo[i,4]
			}
			obj_test_button.test_mode = materialInfo
			
			timer = 0
			runAnimation = true;
		}
	break;
	case 3:
		chanceOutcome = (animationInfo[1]/100)*360;
		slowdownStart = chanceOutcome + irandom(2)*360
		reelAngle = slowdownStart + random(8)*360
		reelSpeed = 7
		chanceCount = 0;
		for(var i = 0; i < animationCount-3; i = i + 2){
			chanceInfo[chanceCount,0] = animationInfo[i+2]
			chanceInfo[chanceCount++,1] = animationInfo[i+3]
		}
		obj_test_button.test_mode = string(chanceInfo)
		runAnimation = true
	break;
}