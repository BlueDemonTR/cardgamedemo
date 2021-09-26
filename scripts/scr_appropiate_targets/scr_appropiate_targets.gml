function scr_appropiate_targets(targetController, targetTypes, targetMinLevel, targetMaxLevel, targetSpirit, targetArchetype, doesThisEffectTarget, ignoreTarget) {
	//player,opponent,all
	//main,momentum,all
	//int64 0-12
	//int64 1-13
	//write any if no archetypes

	//-1 if none
	var canTargetOwn = false,
	canTargetOpponents= false,
	canTargetMain = false,
	canTargetMomentum= false,
	j=0;
	
	for (var i = 0; i < 5; i++){global.appropiate_targets[i, 0]=-1;}
	for (var i = 0; i < 5; i++){global.appropiate_targets[i, 1]=-1;}

	if (targetController == "player" || targetController =="all"){canTargetOwn = true;}
	if (targetController =="opponent" || targetController =="all"){canTargetOpponents= true;}
	if (targetTypes == "main" || targetTypes =="all"){canTargetMain = true;}
	if (targetTypes =="momentum" || targetTypes =="all"){canTargetMomentum= true;}

	if(canTargetOwn){
		for (var i=0; i < 5; i++){
			if(i=ignoreTarget){continue;}
			if(obj_player.fieldCard[i] != noone){
				if(obj_player.fieldCard[i].cardStat[0] > targetMinLevel && obj_player.fieldCard[i].cardStat[0] < targetMaxLevel){
					if(targetArchetype == "any" || scr_check_archetype(obj_player.field[i,0], targetArchetype)){
						if(targetSpirit == "any" || array_count_variable(targetSpirit, obj_player.fieldCard[i].cardStat[7])){
							if (!obj_player.fieldCard[i].cardStatus[6] || !doesThisEffectTarget){
								if(canTargetMain && macros.card_type[obj_player.field[i,0]] == 0){global.appropiate_targets[j++, 0] = i;}
								if(canTargetMomentum &&macros.card_type[obj_player.field[i,0]] == 1){global.appropiate_targets[j++, 0] = i;}
							}
						}
					}
				}
			}
		}
	}
	appropiate_target_count_player = j;
	j=0;
	if(canTargetOpponents){
		for (var i=0; i < 5; i++){
			if(obj_opponent.fieldCard[i] != noone){
				if(obj_opponent.fieldCard[i].cardStat[0] > targetMinLevel && obj_opponent.fieldCard[i].cardStat[0] < targetMaxLevel){
					if(targetArchetype == "any" || scr_check_archetype(obj_opponent.field[i,0], targetArchetype)){
						if(targetSpirit == "any" || obj_player.fieldCard[i].cardStat[7] == targetSpirit){
							if (!obj_opponent.fieldCard[i].cardStatus[6] || !doesThisEffectTarget){
								if(canTargetMain &&  macros.card_type[obj_opponent.field[i,0]] == 0){global.appropiate_targets[j++, 1] = i;}
								if(canTargetMomentum &&  macros.card_type[obj_player.field[i,0]] == 1){global.appropiate_targets[j++, 1] = i;}
							}
						}
					}
				}
			}
		}
	}

	appropiate_target_count_opponent = j;




}
