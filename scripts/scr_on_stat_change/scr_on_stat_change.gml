// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_on_stat_change(cardObject){
	
	if(cardObject.cardStat[StatHP] == SendInjuries){//Destruction by Injury
		scr_destroy(cardObject, position, SendInjuries)
	}
	switch(cardObject.cardNum){
		case 65://Homesick Soldier Effect Activation Trigger
			if(!scr_legal_activation(cardObject.cardNum, 0, cardObject.position)){break}
			scr_add_to_resolution_pile([cardObject.cardNum, 0, 0, cardObject.position, false])
		break;
	}
}