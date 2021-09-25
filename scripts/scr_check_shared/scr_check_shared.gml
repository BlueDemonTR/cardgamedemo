function scr_check_shared(cardNum,sharedEffectNumber) {
	for(var i = 0; i < macros.origSharedEffectsCount[cardNum]; i++){
		if (macros.origSharedEffects[cardNum,i] = sharedEffectNumber) {return true}
	}
	return false

}
