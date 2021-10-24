function scr_initialize_shared_effects() {
	i=0;

	//


	shared_effect_name[i] ="Void";
	shared_effect[i]="If you see this, I fucked up lol";
	shared_effect_symbol[i] = noone;
	i++;

	shared_effect_name[i] ="Motorbiker";
	shared_effect[i]="Can attack directly.";
	shared_effect_symbol[i] = spr_motorbiker_symbol;
	i++;

	shared_effect_name[i] ="Motorbiker Leader";
	shared_effect[i]="This card can only be summoned once per turn (Unsilenceable).";
	shared_effect_symbol[i] = spr_motorbiker_leader_symbol;
	i++;

	shared_effect_name[i] ="Visclades";
	shared_effect[i]="You can discard this card to gain 1 mana, lock your wheel.";
	shared_effect_symbol[i] = spr_visclades_symbol;
	i++;

	shared_effect_name[i] ="Underworld Visclades";
	shared_effect[i]="Destroyed: Effect Summon a non-Momentum ''Visclades'' monster from your Infirmary";
	shared_effect_symbol[i] = spr_underground_visclades_symbol;
	i++;

	shared_effect_name[i] ="Igloo";
	shared_effect[i]="Summoned: Bounce all other igloo monsters";
	shared_effect_symbol[i] = spr_igloo_symbol;
	i++;
	
	shared_effect_name[i] ="Sacrifice";
	shared_effect[i]="Destroyed: Recruit 3 ''Useless Sacrifice''s";
	shared_effect_symbol[i] = spr_sacrifice_symbol;
	i++;

	shared_effect_name[i] ="X-Makine";
	shared_effect[i]="End of turn: Lose 3 Momentum";
	shared_effect_symbol[i] = spr_xmakine_symbol;
	i++;	
	shared_effect_count = i;

	if(false){
		return shared_effect_count//This is here because I am sick of the syntax error pop up
	}

}
