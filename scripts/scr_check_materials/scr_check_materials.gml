function scr_check_materials(argument0) {
	var cardNum= argument0
	if (obj_player.currentLevel >= macros.origStat[cardNum, StatLevel]){
		if (cardNum > 10 && cardNum < 16){
			if(obj_player.motorbikers >= 2){
				return true;
			}
		}
		else if (cardNum == 16){
			if(obj_player.motorbikers >= 2 && obj_player.leader = true){
				return true;
			}
		}
		else if (cardNum >= 27 && cardNum <= 31){
			if(obj_player.visclades>= 2){
				return true;
			}
		}
		else if (cardNum >= 47 && cardNum <= 49){
			if(obj_player.poleclan >= 1 && obj_player.igloo = true){
				return true;
			}
		}
		else if (cardNum == 70){
			if(true){
				return true;
			}
		}
		else if (cardNum == 78){
			if(obj_player.sacrifices>= 2){
				return true;
			}		
		}
		else if (cardNum == 90){
			if(obj_player.fishes >= 2 && obj_player.fisherman = true){
				return true;
			}
		}
		else if (cardNum == 112){
			if(obj_player.x_makines >= 2){
				return true;
			}
		}
	}


}
