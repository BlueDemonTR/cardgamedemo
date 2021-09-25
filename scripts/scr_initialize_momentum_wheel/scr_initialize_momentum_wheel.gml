function scr_initialize_momentum_wheel() {
	i=0;
	wheelSprite[i++]=spr_wheel_empty;
	wheelSprite[i++]=spr_wheel_1;
	wheelSprite[i++]=spr_wheel_2;
	wheelSprite[i++]=spr_wheel_3;
	wheelSprite[i++]=spr_wheel_4;
	wheelSprite[i++]=spr_wheel_5;
	wheelSprite[i++]=spr_wheel_6;
	wheelSprite[i++]=spr_wheel_7;
	wheelSprite[i++]=spr_wheel_8;
	wheelSprite[i++]=spr_wheel_9;
	wheelSprite[i++]=spr_wheel_10;
	wheelSprite[i++]=spr_wheel_11;
	wheelSprite[i++]=spr_wheel_12;

	var i=1;
	/*


	wheel_name[i] ="";
	momentum_gain[i] ="";
	wheel_ability_1[i] ="";
	wheel_ability_1_cost[i] =3;
	wheel_ability_2[i] ="";
	wheel_ability_2_cost[i] =6;
	wheel_ability_3[i] ="";
	wheel_ability_3_cost[i] =9;
	wheel_ability_4[i] ="";
	wheel_ability_4_cost[i] =12;
	i++;
	*/
	//Motorbiker wheel 1


	wheel_name[i] ="Motorbiker Wheel v1.0";
	wheel_ability_1[i] ="Once per turn, search a ''Motorbiker'' monster";
	momentum_gain[i] ="Everytime you deal damage by direct attacking with a ''Motorbiker'' monster, gain momentum equal to the damage";
	wheel_ability_1_cost[i] =3;
	wheel_ability_2[i] ="IMPACT SUMMON (Impact summon a monster from the momentum deck using monsters you control as materials)";
	wheel_ability_2_cost[i] =6;
	wheel_ability_3[i] ="Once per turn, search ''Leader Takeover''";
	wheel_ability_3_cost[i] =9;
	wheel_ability_4[i] ="All monsters you control can attack again, also lock your wheel";
	wheel_ability_4_cost[i] =12;
	i++;

	//Genocider Wheel



	wheel_name[i] ="Lentus' leftover wheel";
	wheel_ability_1[i] ="Gain 2 mana";
	momentum_gain[i] ="When you mana summon a ''Genocider'' monster, gain momentum equal to its level";
	wheel_ability_1_cost[i] =3;
	wheel_ability_2[i] ="Search ''Cries of the Underworld''";
	wheel_ability_2_cost[i] =6;
	wheel_ability_3[i] ="IMPACT SUMMON (Impact summon a monster from the momentum deck using monsters you control as materials)";
	wheel_ability_3_cost[i] =9;
	wheel_ability_4[i] ="Destroy all level 4 or lower monsters your opponent controls";
	wheel_ability_4_cost[i] =12;
	i++;

	//Pole Clan Wheel


	wheel_name[i] ="Pole Clan's Wheel of Advanced Magic";
	momentum_gain[i] ="Everytime you burn your opponent, gain momentum equal to the damage done.";
	wheel_ability_1[i] ="An igloo monster recovers 3 HP, if there is none, effect summon an ''Igloo'' from your deck";
	wheel_ability_1_cost[i] =3;
	wheel_ability_2[i] ="Effect summon an ''Pole Clan Mage'' from your deck";
	wheel_ability_2_cost[i] =6;
	wheel_ability_3[i] ="IMPACT SUMMON (Impact summon a monster from the momentum deck using monsters you control as materials)";
	wheel_ability_3_cost[i] =9;
	wheel_ability_4[i] ="Once per game, Fully heal an ''Igloo'' monster then give it +6 HP";
	wheel_ability_4_cost[i] =12;
	i++;

	//Sacrifice Wheel


	wheel_name[i] ="Wheel of the Beast Summoners";
	momentum_gain[i] ="Everytime you gain mana by sacrificing a monster, gain momentum equal to the mana gained";
	wheel_ability_1[i] ="Make a ''Sacrifice'' monster sacrificable";
	wheel_ability_1_cost[i] =3;
	wheel_ability_2[i] ="Search a ''Nightmare Beast'' card";
	wheel_ability_2_cost[i] =6;
	wheel_ability_3[i] ="IMPACT SUMMON (Impact summon a monster from the momentum deck using monsters you control as materials)";
	wheel_ability_3_cost[i] =9;
	wheel_ability_4[i] ="Set your mana to 8";
	wheel_ability_4_cost[i] =12;
	i++;

	//Fisherman Wheel

	wheel_name[i] ="Fishing Boat Wheel";
	momentum_gain[i] ="Everytime a non''Fisherman'' ''Fish'' monster is summoned gain momentum equal to its level";
	wheel_ability_1[i] ="Search a ''Fisherman'' monster";
	wheel_ability_1_cost[i] =3;
	wheel_ability_2[i] ="Cast ''Lucky Reel''s Effect";
	wheel_ability_2_cost[i] =6;
	wheel_ability_3[i] ="IMPACT SUMMON (Impact summon a monster from the momentum deck using monsters you control as materials)";
	wheel_ability_3_cost[i] =9;
	wheel_ability_4[i] ="Recruit a ''Goldfish'' and draw a card";
	wheel_ability_4_cost[i] =12;
	i++;

	wheel_name[i] ="Classic Wheel v1.0";
	momentum_gain[i] ="At the start of your turn gain 3 momentum";
	wheel_ability_1[i] ="A card you control gains +2 ATK";
	wheel_ability_1_cost[i] =3;
	wheel_ability_2[i] ="Once per turn, draw a card";
	wheel_ability_2_cost[i] =6;
	wheel_ability_3[i] ="IMPACT SUMMON";
	wheel_ability_3_cost[i] =9;
	wheel_ability_4[i] ="Search a spell card";
	wheel_ability_4_cost[i] =12;
	i++;


	wheel_name[i] ="X-Makine Heat Meter";
	momentum_gain[i] ="End of Turn: Lose 2 Momentum";
	wheel_ability_1[i] ="If you have exactly 3 Momentum, all X-Makine monsters you control gain +1/+1";
	wheel_ability_1_cost[i] =3;
	wheel_ability_2[i] ="Once per turn, Recover 6 HP";
	wheel_ability_2_cost[i] =6;
	wheel_ability_3[i] ="IMPACT SUMMON";
	wheel_ability_3_cost[i] =9;
	wheel_ability_4[i] ="Destroy a monster";
	wheel_ability_4_cost[i] =12;
	i++;
	
	total_wheels = i;


}
