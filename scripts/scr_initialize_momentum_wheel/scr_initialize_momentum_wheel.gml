function scr_initialize_momentum_wheel() {
	i = 0;
	wheelSprite[i++] = spr_wheel_empty;
	wheelSprite[i++] = spr_wheel_1;
	wheelSprite[i++] = spr_wheel_2;
	wheelSprite[i++] = spr_wheel_3;
	wheelSprite[i++] = spr_wheel_4;
	wheelSprite[i++] = spr_wheel_5;
	wheelSprite[i++] = spr_wheel_6;
	wheelSprite[i++] = spr_wheel_7;
	wheelSprite[i++] = spr_wheel_8;
	wheelSprite[i++] = spr_wheel_9;
	wheelSprite[i++] = spr_wheel_10;
	wheelSprite[i++] = spr_wheel_11;
	wheelSprite[i++] = spr_wheel_12;

	var i = 1;
	/*
	wheel_name[i] = "";
	momentum_gain[i] = "";
	wheel_ability[i, 0] = "";
	wheel_cost[i, 0] = 3;
	wheel_ability[i, 1] = "";
	wheel_cost[i, 1] = 6;
	wheel_ability[i, 2] = "";
	wheel_cost[i, 2] = 9;
	wheel_ability[i, 3] = "";
	wheel_cost[i, 3] = 12;
	i++;
	*/

	//Motorbiker wheel 1

	wheel_name[i] = "Motorbiker Wheel v1.0";
	momentum_gain[i] = "Everytime you deal damage by direct attacking with a ''Motorbiker'' monster, gain momentum equal to the damage";
	wheel_ability[i, 0] = "Once per turn, search a ''Motorbiker'' monster";
	wheel_cost[i, 0] = 3;
	wheel_ability[i, 1] = "IMPACT SUMMON (Impact summon a monster from the momentum deck using monsters you control as materials)";
	wheel_cost[i, 1] = 6;
	wheel_ability[i, 2] = "Once per turn, search ''Leader Takeover''";
	wheel_cost[i, 2] = 9;
	wheel_ability[i, 3] = "All monsters you control can attack again, also lock your wheel";
	wheel_cost[i, 3] = 12;
	i++;

	//Genocider Wheel



	wheel_name[i] = "Lentus' leftover wheel";
	momentum_gain[i] = "When you mana summon a ''Genocider'' monster, gain momentum equal to its level";
	wheel_ability[i, 0] = "Gain 2 mana";	
	wheel_cost[i, 0] = 3;
	wheel_ability[i, 1] = "Search ''Cries of the Underworld''";
	wheel_cost[i, 1] = 6;
	wheel_ability[i, 2] = "IMPACT SUMMON (Impact summon a monster from the momentum deck using monsters you control as materials)";
	wheel_cost[i, 2] = 9;
	wheel_ability[i, 3] = "Effect Summon a Visclades Monster from your infirmary";
	wheel_cost[i, 3] = 12;
	i++;

	//Pole Clan Wheel


	wheel_name[i] = "Pole Clan's Wheel of Advanced Magic";
	momentum_gain[i] = "Everytime you burn your opponent, gain momentum equal to the damage done.";
	wheel_ability[i, 0] = "An igloo monster recovers 3 HP, if there is none, effect summon an ''Igloo'' from your deck";
	wheel_cost[i, 0] = 3;
	wheel_ability[i, 1] = "Effect summon an ''Pole Clan Mage'' from your deck";
	wheel_cost[i, 1] = 6;
	wheel_ability[i, 2] = "IMPACT SUMMON (Impact summon a monster from the momentum deck using monsters you control as materials)";
	wheel_cost[i, 2] = 9;
	wheel_ability[i, 3] = "Once per game, Fully heal an ''Igloo'' monster then give it +6 HP";
	wheel_cost[i, 3] = 12;
	i++;

	//Sacrifice Wheel


	wheel_name[i] = "Wheel of the Beast Summoners";
	momentum_gain[i] = "Everytime you gain mana by sacrificing a monster, gain momentum equal to the mana gained";
	wheel_ability[i, 0] = "Make a ''Sacrifice'' monster sacrificable";
	wheel_cost[i, 0] = 3;
	wheel_ability[i, 1] = "Search a ''Nightmare Beast'' card";
	wheel_cost[i, 1] = 6;
	wheel_ability[i, 2] = "IMPACT SUMMON (Impact summon a monster from the momentum deck using monsters you control as materials)";
	wheel_cost[i, 2] = 9;
	wheel_ability[i, 3] = "Set your mana to 8";
	wheel_cost[i, 3] = 12;
	i++;

	//Fisherman Wheel

	wheel_name[i] = "Fishing Boat Wheel";
	momentum_gain[i] = "Everytime a non''Fisherman'' ''Fish'' monster is summoned gain momentum equal to its level";
	wheel_ability[i, 0] = "Search a ''Fisherman'' monster";
	wheel_cost[i, 0] = 3;
	wheel_ability[i, 1] = "If you have less than 5 cards in your hand, add a ''Lucky Reel'' to your hand";
	wheel_cost[i, 1] = 6;
	wheel_ability[i, 2] = "IMPACT SUMMON (Impact summon a monster from the momentum deck using monsters you control as materials)";
	wheel_cost[i, 2] = 9;
	wheel_ability[i, 3] = "Recruit a ''Goldfish'' and draw a card";
	wheel_cost[i, 3] = 12;
	i++;

	wheel_name[i] = "Classic Wheel v1.0";
	momentum_gain[i] = "At the start of your turn gain 3 momentum";
	wheel_ability[i, 0] = "A card you control gains +2 ATK";
	wheel_cost[i, 0] = 3;
	wheel_ability[i, 1] = "Once per turn, draw a card";
	wheel_cost[i, 1] = 6;
	wheel_ability[i, 2] = "IMPACT SUMMON";
	wheel_cost[i, 2] = 9;
	wheel_ability[i, 3] = "Search a spell card";
	wheel_cost[i, 3] = 12;
	i++;


	wheel_name[i] = "X-Makine Heat Meter";
	momentum_gain[i] = "End of Turn: Lose 2 Momentum";
	wheel_ability[i, 0] = "If you have exactly 3 Momentum, all X-Makine monsters you control gain +1/+1";
	wheel_cost[i, 0] = 3;
	wheel_ability[i, 1] = "Once per turn, Recover 6 HP";
	wheel_cost[i, 1] = 6;
	wheel_ability[i, 2] = "IMPACT SUMMON";
	wheel_cost[i, 2] = 9;
	wheel_ability[i, 3] = "Destroy a monster";
	wheel_cost[i, 3] = 12;
	i++;
	
	total_wheels = i;


}
