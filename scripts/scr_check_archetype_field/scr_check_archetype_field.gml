function scr_check_archetype_field(controller,position,archetypeName){
	with(controller.fieldCard[position]){
		for(var i = 0; i < cardArchetypeCount; i++){
			if(cardArchetype[i] = archetypeName){
				return true
			}
		}
	}
	return false;
}
