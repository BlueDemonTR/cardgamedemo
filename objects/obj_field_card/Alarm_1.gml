scr_message_last_action("Opponent "+ summoning_method +" summons "+ macros.name[cardNum]);
scr_last_action("You "+ summoning_method +" summoned "+ macros.name[cardNum]);
if(scr_check_shared(cardNum,5)){
	for(i=0;i<5;i++){
		if(obj_player.field[i,0] > 0)
			if(i!=position && scr_check_shared(obj_player.field[i,0], 5)){
				if(obj_player.fieldCard[i].cardStat[2] <= cardStat[2]){
					scr_bounce(i)
				}else{
					scr_bounce(position)
				}				
			}
	}
}
scr_on_summon(cardNum);
switch(summoning_method){
	case "mana":
		scr_on_mana_summon(cardNum);
	break;
	case "impact":
		scr_on_impact_summon(cardNum)
	break;
}
switch(cardNum){
	case 90:
		mtpt = 3
	break;
}