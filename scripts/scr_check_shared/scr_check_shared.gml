function scr_check_shared(cardNum,sharedEffectNumber) {
	if(array_includes(macros.origSharedEffects[cardNum], sharedEffectNumber)){
		return true
	}
	return false
}
