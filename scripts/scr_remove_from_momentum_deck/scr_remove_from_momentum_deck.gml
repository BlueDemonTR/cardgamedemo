function scr_remove_from_momentum_deck(argument0) {
	var temp1 = argument0;
	with(obj_player){
		for (var i=temp1; i < momentumDeckCount; i++){
			momentum_deck[i,0] = momentum_deck[i+1,0];
			momentum_deck[i,1] = momentum_deck[i+1,1];
		}
		momentumDeckCount--;
	}
	scr_message_momentum_deck();


}
