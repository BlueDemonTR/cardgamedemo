function scr_filter_archetype_infirmary(argument0, argument1, argument2, argument3, argument4) {
	//filtered_cards array states the infirmaryPos not the cardNum
	var filterArchetype = argument0,
	filterTypes = argument1, //main,momentum,all
	filterMinLevel = argument2, //int64 0-12
	filterMaxLevel = argument3, //int64 1-13
	checkLimitedSummon = argument4,
	j = 0;
	with(player){
		for (var i = 0; i < infirmaryCount; i++){
		
			if (filterArchetype=="any"|| scr_check_archetype(infirmary[i,0],filterArchetype)){
			
				if(!checkLimitedSummon || scr_limited_summon(infirmary[i,0])){
				
					if(macros.origStat[infirmary[i,0],0] < filterMaxLevel && macros.origStat[infirmary[i,0],0] > filterMinLevel){
					
						if((filterTypes = "main" || filterTypes = "all") && macros.card_type[infirmary[i,0]]= 0){
							
							global.filtered_cards[j++] = i;}
						if((filterTypes = "momentum" || filterTypes = "all") && macros.card_type[infirmary[i,0]]= 2){global.filtered_cards[j++] = i;}
					}
				}
			}
		}
	}
	filtered_card_count = j;



}
