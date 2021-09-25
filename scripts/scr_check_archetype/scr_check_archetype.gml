function scr_check_archetype(cardNum,archetypeNumber) {
	for(var i = 0; i < macros.origArchetypeCount[cardNum]; i++){
		if (macros.origArchetype[cardNum,i] = archetypeNumber) {return true}
	}
	return false

}
