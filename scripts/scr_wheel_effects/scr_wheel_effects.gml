function scr_wheel_effects(wheelNum, wheelEffect) {
	if(scr_legal_activation("WheelEffect", wheelEffect, wheelNum)){
		obj_player.resolutionPile[obj_player.resolutionPileCount,0] = "WheelEffect"
		obj_player.resolutionPile[obj_player.resolutionPileCount,1] = wheelEffect
		obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
		obj_player.resolutionPile[obj_player.resolutionPileCount,3] = wheelNum
		obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
		obj_player.resolutionPileCount++
	}
}
