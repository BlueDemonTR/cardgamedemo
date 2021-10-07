// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_count_types_in_deck(){
	with(obj_deck_builder){
		monsterCount = 0
		spellCount = 0
		for(var i = 0; i < deckCount; i++){
			if(macros.card_type[deck[i, CardNumber]] == TypeMonster){
				monsterCount++
			}else{
				spellCount++
			}
		}
	}
}