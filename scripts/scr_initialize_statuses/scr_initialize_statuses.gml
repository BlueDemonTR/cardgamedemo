// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_initialize_statuses(){
	//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
	//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can't Attack Directly
	var i = 0;
	
	statusName[i] = "TAUNT"
	statusDesc[i] = "Your opponent can only attack monsters with TAUNT"
	statusSymbol[i] = spr_taunt
	i++
	
	statusName[i] = "Pierce"
	statusDesc[i] = "When this card attacks your opponent gets damaged equal to the excess damage"
	statusSymbol[i] = spr_pierce
	i++
	
	statusName[i] = "Rebellious"
	statusDesc[i] = "Can't be silenced"
	statusSymbol[i] = spr_rebellious
	i++	
	
	statusName[i] = "Immune"
	statusDesc[i] = "Can't be affected by other card effects"
	statusSymbol[i] = spr_unaffected
	i++	
	
	statusName[i] = "Indestructable"
	statusDesc[i] = "Can't be destroyed by card effects"
	statusSymbol[i] = spr_indestructable
	i++		
	
	statusName[i] = "Lifesteal"
	statusDesc[i] = "You recover HP equal to the damage this card does"
	statusSymbol[i] = spr_lifesteal
	i++		

	statusName[i] = "Sneaky"
	statusDesc[i] = "Can't be targeted for attacks or effects, a card loses sneaky after it attacks or activates an effect"
	statusSymbol[i] = spr_sneaky
	i++		

	statusName[i] = "Unarmed"
	statusDesc[i] = "This card can't attack"
	statusSymbol[i] = spr_unarmed
	i++		

	statusName[i] = "Ranged"
	statusDesc[i] = "This card doesn't get damaged while attacking"
	statusSymbol[i] = spr_ranged
	i++	

	statusName[i] = "Paralyzed"
	statusDesc[i] = "This card can't attack. End of Turn: Remove Paralyzed from this card"
	statusSymbol[i] = spr_paralzyed
	i++	

	statusName[i] = "Poison"
	statusDesc[i] = "End of Turn: Deal 1 Damage to this card"
	statusSymbol[i] = spr_poison
	i++	

	statusName[i] = "Silenced"
	statusDesc[i] = "This cards effects cannot be activated and they are not applied"
	statusSymbol[i] = spr_silenced
	i++	

	statusName[i] = "This card can't attack directly"
	statusDesc[i] = "This card can't attack your opponent"
	statusSymbol[i] = noone //add later
	i++
	
	statusName[i] = "End of Turn: Destroy This Card"
	statusDesc[i] = "At the End of this Turn: Destroy This Card"
	statusSymbol[i] = noone //add later
	i++	

	status_count = i



}