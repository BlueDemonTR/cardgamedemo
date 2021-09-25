function scr_copy_stats(copyMonster, pasteMonster, copyLevel, copyAttack, copyMaxHP, copyHP, copyArmor, copyRegen, copyDodge){
	if(copyLevel){
		pasteMonster.cardStat[0] = copyMonster.cardStat[0]
	}
	if(copyAttack){
		pasteMonster.cardStat[1] = copyMonster.cardStat[1]
	}
	if(copyMaxHP){
		pasteMonster.cardStat[2] = copyMonster.cardStat[2]
	}
	if(copyHP){
		pasteMonster.cardStat[3] = copyMonster.cardStat[3]
	}
	if(copyArmor){
		pasteMonster.cardStat[4] = copyMonster.cardStat[4]
	}
	if(copyRegen){
		pasteMonster.cardStat[5] = copyMonster.cardStat[5]
	}
	if(copyDodge){
		pasteMonster.cardStat[6] = copyMonster.cardStat[6]
	}
	scr_message_last_action(macros.name[cardNum]+" copies "+macros.name[copyMonster.cardNum] +" stats");
	scr_last_action(macros.name[cardNum]+" copies "+macros.name[copyMonster.cardNum] +" stats");
	scr_message_field_card_stats(pasteMonster.position);	
}
