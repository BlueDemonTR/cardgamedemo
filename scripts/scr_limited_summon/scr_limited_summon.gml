function scr_limited_summon(cardNum) {
	with(player){
		if(limitationExists){
			for(var j = 0; j < limitSummonsToCount; j++){
				if(!(scr_check_archetype(cardNum,limitSummonsTo[j,0]) || scr_check_archetype(cardNum,limitSummonsTo[j,1]))){
					return false;
				}
			}
			for (var i=0; i < 2; i++){
				for(j = 0; j < limitSummonsOfCount; j++){
					if (!scr_check_archetype(cardNum,limitSummonsOf[j,i])){
						return false;
					}
				}
			}
			for (i=0; i < limitSummoningCardCount; i++){
				if (cardNum == limitSummoningCard[i]){
					return false;
				}
			}
		}
	}
	return true;


}
