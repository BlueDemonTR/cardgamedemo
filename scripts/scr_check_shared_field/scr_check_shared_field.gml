function scr_check_shared_field(controller,position,sharedEffectNumber){
	with(controller.fieldCard[position]){
		for(var i = 0; i < cardSharedEffectsCount; i++){
			if(cardSharedEffects[i] = sharedEffectNumber){
				return true
			}
		}
	}
	return false;
}
