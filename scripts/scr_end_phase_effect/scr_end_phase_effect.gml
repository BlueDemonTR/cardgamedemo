// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_end_phase_effect(){
	switch(cardNum){
		case "X-Makine Shared Effect":
			
			momentum = max(momentum-3,0);
			scr_message_stats()
			obj_player.endPhaseChainCount--
			return;
		break;
		case 16:
		break;
		case 34:
			if !fieldCard[endPhaseChains[endPhaseChainCount-1,2]].cardStatus[StatusSilenced] scr_burn(opponent,3,34)
			endPhaseChainCount--
			return;			
		break;
		case 36:
			if !fieldCard[endPhaseChains[endPhaseChainCount-1,2]].cardStatus[StatusSilenced] scr_burn(opponent,2,36)		
			endPhaseChainCount--
			return;				
		break;
		case 38:
			if !fieldCard[endPhaseChains[endPhaseChainCount-1,2]].cardStatus[StatusSilenced] scr_burn(opponent,1,38)	
			endPhaseChainCount--
			return;				
		break;
		case 56:
		break;		
		case 72:

		break;
		case "destroyDuringEP":
		break;
	}
}