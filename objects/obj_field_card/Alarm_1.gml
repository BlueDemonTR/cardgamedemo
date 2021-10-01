if(scr_check_shared(cardNum, ArcIgloo)){
	for(i=0;i<5;i++){
		if(obj_player.field[i,0] > 0)
			if(i!=position && scr_check_shared(obj_player.field[i,0], ArcIgloo)){
				if(obj_player.fieldCard[i].cardStat[StatMaxHP] <= cardStat[StatMaxHP]){
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