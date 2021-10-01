function scr_appropiate_hand(argument0,argument1, argument2, argument3, argument4, argument5) {
	//filtered_cards array hand_position not the cardNum
	var filterArchetype=argument0, //write "any" if generic
	filterTypes=argument1, //monster,spell,all
	filterMinLevel=argument2, //int64 0-12
	filterMaxLevel=argument3, //int64 1-13
	discardCard=argument4, //whether the activated card will be discarded or not
	checkLimitedSummon=argument5,
	j = 0;

	var hand_position = -1
	if(discardCard){hand_position = self.hand_position}

	with(player){
		for (var i = 0; i < handCount; i++){
			if(hand_position == i){continue;}
			if (filterArchetype=="any"|| scr_check_archetype(hand[i],filterArchetype)){
				if(!checkLimitedSummon || scr_limited_summon(hand[i])){
					if(macros.origStat[hand[i,0], StatLevel] < filterMaxLevel && macros.origStat[hand[i,0], StatLevel] > filterMinLevel){
						if((filterTypes = "monster" || filterTypes = "all") && macros.card_type[hand[i,0]] == TypeMonster){global.filtered_cards[j++] = i;}
					}
					if((filterTypes = "spell" || filterTypes = "all") && macros.card_type[hand[i,0]] == TypeSpell){global.filtered_cards[j++] = i;}
				}
			}
		}
	}
	filtered_card_count = j;



}
