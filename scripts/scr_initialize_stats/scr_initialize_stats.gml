// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_initialize_stats(){
	//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regeneration,
	//6 = Dodge, 7 =Spirit, 8 = Multiple Times Per Turn
	var i = 0;
	
	statName[i] = "Level"
	statDesc[i] = "How much mana is required to mana summon the card or what the total levels of the materials should exceed to Impact Summon this card."
	//statSymbol[i] = spr_taunt
	i++
	
	statName[i] = "ATK"
	statDesc[i] = "How much damage the card deals when attacking"
	//statSymbol[i] = spr_pierce
	i++
	
	statName[i] = "Max HP"
	statDesc[i] = "Maximum Value of a card's HP can be"
	//statSymbol[i] = spr_rebellious
	i++	
	
	statName[i] = "HP"
	statDesc[i] = "The value a card loses when damage is dealt to it, if it drops to 0 the card is destroyed"
	//statSymbol[i] = spr_unaffected
	i++	
	
	statName[i] = "Armor"
	statDesc[i] = "The card decreases damage dealt to it by attacks by "
	//statSymbol[i] = spr_indestructable
	i++		
	
	statName[i] = "Regeneration"
	statDesc[i] = "End of Turn: This card heals itself by "
	//statSymbol[i] = spr_lifesteal
	i++		

	statName[i] = "Dodge"
	statDesc[i] = "This card automatically will evade attacks. Uses Left: "
	//statSymbol[i] = spr_sneaky
	i++		

	statName[i] = "Spirit"
	statDesc[i] = "What kind of spirit a card has, this value does not affect gameplay."
	//statSymbol[i] = spr_unarmed
	i++		

	statName[i] = "Effect Uses Per Turn"
	statDesc[i] = "This card can use its limited effects that many times per turn"
	//statSymbol[i] = spr_ranged
	i++	

	stat_count = i



}