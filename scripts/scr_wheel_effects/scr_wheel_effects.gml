function scr_wheel_effects(wheelNum, wheelEffect) {
	if(scr_legal_activation("WheelEffect", wheelEffect, wheelNum)){
		scr_add_to_resolution_pile(["WheelEffect", wheelEffect, -1, wheelNum, false])
	}
}
