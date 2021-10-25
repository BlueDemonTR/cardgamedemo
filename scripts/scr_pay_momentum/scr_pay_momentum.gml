function scr_pay_momentum(player, amount){
	//Makes player lose momentum equal to cost, if they can't the effect is tagged as Finished Resolving
	//Syntax:
	//player: either obj_player or obj_opponent, decides which player's card is affected
	//amount: int
	
	if(player.momentum < amount){
		resolvingPile[obj_player.resolvingPileCount-1,2] = 97
		return false;
	}
	
	scr_increase_stat_player(player, 0, 0, 0, -amount)
	return amount;
}