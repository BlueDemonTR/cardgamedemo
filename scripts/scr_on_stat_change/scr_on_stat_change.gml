// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_on_stat_change(cardObject){
	var position = cardObject.position,
	player = cardObject.player;
	if(cardObject.cardStat[StatHP] == 0){//Destruction by Injury
		scr_destroy(player, position, SendInjuries)
	}
	switch(cardObject.cardNum){
		case 65://Homesick Soldier Effect Activation Trigger
			if(!scr_legal_activation(cardObject.cardNum, 0, cardObject.position)){break}
			scr_add_to_resolution_pile([cardObject.cardNum, 0, 0, cardObject.position, false])
		break;
	}
}