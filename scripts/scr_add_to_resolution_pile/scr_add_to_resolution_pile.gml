// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_add_to_resolution_pile(cardNum, effectNum, resolutionStep, player, position, negated){
	for(var i = 0; i < argument_count; i++){
		array_set(obj_player.resolutionPile[obj_player.resolutionPileCount], i, argument[i])
	}
	obj_player.resolutionPileCount++
	/*
	HOW TO WRITE AN EFFECT

	scr_add_resolution_pile(arguments)

	0 = cardNum
	1 = if the card has multiple effects, which one is trying to resolve
	2 = 0 Means Effect Hasn't Resolved Yet, 1-98 Effect Has Started Resolving, 99 Effect Successfully Resolved
	3 = which player does the card belong
	4 = if the card has a relevant position, what is it?
	5 = is the effect negated (true, false or -1 (Unsilencable))
	6 = if the card has a target what is it? (optional)
	7+= if it has another target OR other information to remember what are those? (optional)

	How the resolution pile works
	When effects stop triggering and neither player have responses, the resolutionPile will be copied to the
	resolvingPile and it will start resolving from there.
	The Effect at the top tries to resolve, it if's, Resolution Step is at 99 resolving pile count goes down
	and the next effect starts resolving
	*/
}