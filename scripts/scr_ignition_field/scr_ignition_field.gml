// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ignition_field(player, position){
	var cardNum = player.field[position, 0]
	switch(cardNum){
		case 29://Visclades of Bargaining Ignition Check
		case 47://Igloo Castle Ignition Check
		case 49://Igloo Kingdom Ignition Check
		case 60://The Great Leader Ignition Check
		case 62://Awoken Civillian Ignition Check
		case 83://Fisherman Rookie Ignition Check
		case 85://Wise Fisherman Ignition Check
		case 87://Lucky Fisherman Ignition Check
		case 88://Strong Fisherman Ignition Check
		case 89://Naive Fisherman Ignition Check
		case 90://Fisherman of the Oceans Ignition Check
		case 107://X-Makine Casey
		case 108://X-Makine Theo
		case 109://X-Makine Lily
		case 110://X-Makine Robert
		case 111://X-Makine Dom
		case 112://DX-Makine Jason
			return 0
		break;
		
		default:
			return -1
		break;
	}
}