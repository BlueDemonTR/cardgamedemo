function scr_copy_stats(copyMonster, pasteMonster, copyLevel, copyAttack, copyMaxHP, copyHP, copyArmor, copyRegen, copyDodge){
	if(copyLevel){
		pasteMonster.cardStat[StatLevel] = copyMonster.cardStat[StatLevel]
	}
	if(copyAttack){
		pasteMonster.cardStat[StatATK] = copyMonster.cardStat[StatATK]
	}
	if(copyMaxHP){
		pasteMonster.cardStat[StatMaxHP] = copyMonster.cardStat[StatMaxHP]
	}
	if(copyHP){
		pasteMonster.cardStat[StatHP] = copyMonster.cardStat[StatHP]
	}
	if(copyArmor){
		pasteMonster.cardStat[StatArmor] = copyMonster.cardStat[StatArmor]
	}
	if(copyRegen){
		pasteMonster.cardStat[StatRegeneration] = copyMonster.cardStat[StatRegeneration]
	}
	if(copyDodge){
		pasteMonster.cardStat[StatDodge] = copyMonster.cardStat[StatDodge]
	}
	scr_message_last_action(macros.name[cardNum]+" copies "+macros.name[copyMonster.cardNum] +" stats");
	scr_last_action(macros.name[cardNum]+" copies "+macros.name[copyMonster.cardNum] +" stats");
	scr_message_field_card_stats(pasteMonster.position);	
}
