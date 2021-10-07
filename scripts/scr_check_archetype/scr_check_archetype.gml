function scr_check_archetype(cardNum,archetypeNumber) {
	if(array_includes(macros.origArchetype[cardNum], archetypeNumber)){
		return true
	}
	return false
}
