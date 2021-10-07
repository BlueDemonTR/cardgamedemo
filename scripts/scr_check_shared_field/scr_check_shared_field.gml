function scr_check_shared_field(controller,position,sharedEffectNumber){
	with(controller.fieldCard[position]){
		if(array_includes(cardSharedEffects[cardNum], sharedEffectNumber)){
			return true
		}
	}
	return false;
}
