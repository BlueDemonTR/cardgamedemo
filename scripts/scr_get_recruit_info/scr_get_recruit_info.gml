// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_recruit_info(cardNum){
	switch(cardNum){
		case 60://body guard
			return "Body Guard (0/1/1): TAUNT, "+ macros.origText[61,0];
		break;
		
		case 62://awaken man
			return "Awaken Civillian(1/1/1): " + macros.origText[63,0];
		break;
		case 83:
			return "Fish (1/1/1): No effect"
		break;
		case 85:
		case 87:
		case 88:
		case 89:
		case 90:
		case 91:
		case 92:
			return "Fish (1/1/1): No effect. Goldfish (2/5/5): " + macros.origText[86,0]
		break;
		
	}
	return false;
}
