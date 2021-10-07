function scr_check_archetype_field(controller,position,archetypeNumber){
	with(controller.fieldCard[position]){
		if(array_includes(cardArchetype[cardNum], archetypeNumber)){
			return true
		}
	}
	return false
}
