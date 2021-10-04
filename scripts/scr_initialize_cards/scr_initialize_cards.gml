// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_initialize_cards(){
	//Naming Numbers
	typeName[TypeMonster] = "Monster"
	typeName[TypeMomentum] = "Momentum"
	typeName[TypeSpell] = "Spell"
	
	spiritName[0] = "Blank"
	spiritName[SpiritAggressive] = "Aggressive"
	spiritName[SpiritPassive] = "Passive"
	spiritName[SpiritNoble] = "Noble"
	spiritName[SpiritMalicious] = "Malicious"
	spiritName[SpiritKind] = "Kind"
	spiritName[SpiritPassionate] = "Passionate"
	
	var i=-1;
	var j=0;
	
	name[++i] ="None";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeInvalid;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,j++] = -1; //Level 0
		origStat[i,j++] = -1; //ATK 1
		origStat[i,j++] = -1; //Max HP 2
		origStat[i,j++] = -1; //HP 3
		origStat[i,j++] = -1; //Armor 4
		origStat[i,j++] = -1; //Regerenation 5
		origStat[i,j++] = -1; //Dodge 6
		origStat[i,j++] = -1; //Spirit 7
		origStat[i,j++] = -1; //Multiple Times Per Turn
		
		stat_count = j;
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is not initialized
		//Motorbiker = 1, Motorbiker Leader = 2, Visclades = 3, Underworld Visclades = 4
		//Sacrifice = 5, Igloo = 6, X-Makine = 7
		origSharedEffectsCount[i] = j;
		j=0
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,j++] = "When this card is summoned, the game fucking explodes idk";
		origText[i,j++] = "If you are reading this, I royally and utterly fucked up";
		origText[i,j++] = "1 Sleep Deprived Poyraz + 2+ Coding Errors";
		origText[i,j++] = "FUCK FUCK FUCK SHIT FUCK FUCK GOD AAAAAAAAAAAAAAAAAAAAAAA"
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can't Attack Directly
		//13 = Destroy During End Phase
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusImmune] = 0; //Immune


	name[++i] ="Motorbiker Showman";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritPassionate//Spirit 
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		//Motorbiker = 1, Motorbiker Leader = 2, Visclades = 3, Underworld Visclades = 4
		//Sacrifice = 5, Igloo = 6, X-Makine = 7
		origSharedEffects[i,j++] = SharedMotorbiker;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcMotorbiker;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements
		//Cards where that feature is invalid don't need to have the status initialized
		origText[i,TextEffect] = "After this card has attacked: gain 1 Momentum.";
		origText[i,TextFlavor] = "The most passionate of the Motorbikers, while he isn't the most skillful because he always stands with the Leaders most people think of him when they think of the Motorbikers";

		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced
		//Cards where that stat is false don't need to be have the status initialized
		
	name[++i] ="Motorbiker Doppelganger";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 1; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedMotorbiker;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcMotorbiker;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements
		origText[i,TextEffect] = "Mana Summoned: Effect Summon a ''Motorbiker Doppelganger'' from your deck.";
		origText[i,TextFlavor] = "The mysterious Motorbiker siblings, no one can differentiate one from the other, some Motorbikers even think there is a third one";

		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced
		//Cards where that stat is empty don't need to be have the stat initialized

	name[++i] ="Motorbiker Wild Rider";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedMotorbiker;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcMotorbiker;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements
		origText[i,TextEffect] = "Destoyed: Deal 2 Damage to your opponent and gain 1 Momentum.";
		origText[i,TextFlavor] = "Absolutely crazy, she has destroyed countless Motorbikes before getting a Momentum powered one";
		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced
		//Cards where that stat is empty don't need to be have the stat initialized

	name[++i] ="Motorbiker V-Rider";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedMotorbiker;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcMotorbiker;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements
		origText[i,TextEffect] = "Summoned: all ally ''Motorbikers'' gain +1 ATK.";
		origText[i,TextFlavor] = "He gets riled up way too easily. If we weren't generally riding on barren places we would have a lot of problems with other people on the road.";

		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced
		//Cards where that stat is empty don't need to be have the stat initialized

	name[++i] ="Motorbiker D-Rider";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedMotorbiker;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcMotorbiker;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements
		origText[i,TextEffect] = "Summoned: all ally ''Motorbikers'' gain +1 Max HP";
		origText[i,TextFlavor] = "The only person able to endure V-Rider, his anger can't go through their skin.";

		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Motorbiker Violent Wheeler";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 5; //Level
		origStat[i,StatATK] = 5; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcMotorbiker;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements
		origText[i,TextEffect] = "Pierced Damage: It can attack on another monster.";
		origText[i,TextFlavor] = "He has anger issues and can't calm down easily. After the discovery of Momentum Monsters he left the Motorbikers.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusPierce] = true;//Pierce
		
	name[++i] ="Motorbiker Protector";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 5; //Max HP
		origStat[i,StatSpirit] = SpiritKind//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcMotorbiker;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements
		origText[i,TextEffect] = "Summoned: All ''Motorbiker'' monsters you control gain +1 Armor";
		origText[i,TextFlavor] = "The technician Motorbiker; while he doesn't battle much, even his precence makes Motorbikes work better.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
		
	name[++i] ="Rev Up the Engines";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements
		origText[i,TextEffect] = "If you control no monsters; Search a ''Motorbiker'' and get 3 Momentum. Lock your wheel.";
		origText[i,TextFlavor] = "''I still remember it. The sound the electric engine made when we first got it to work. We were standing there dumbfounded by the horsepower it was creating without tiring the engines''";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized		
	
	name[++i] ="Leader Takeover";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements
		origText[i,TextEffect] = "Voidfy a ''Motorbiker Leader'' from your Infirmary that was destroyed by injuries, Sudden Impact Summon a ''Motorbiker Leader'' with the same level.";
		origText[i,TextFlavor] = "When one leader has to go another rises. Motorbikers gain their power from their ability to adapt to new Leaders"
		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="The Hunt is on Boys!";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements
		origText[i,TextEffect] = "If you control at least 3 ''Motorbiker'' monster including a ''Motorbiker Leader''; deal 3 damage to all enemy monsters and to your opponent.";
		origText[i,TextFlavor] = "When a leader and their team are together they can create a lot of havoc real fast."
		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Khan, Motorbiker Leader of the Wolf";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 4; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedMotorbiker;
		origSharedEffects[i,j++] = SharedMotorbikerLeader;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcMotorbiker;
		origArchetype[i,j++] = ArcMotorbikerLeader;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "After this card has attacked directly: Effect Summon a Level 2 or lower ''Motorbiker'' monster from your deck";
		origText[i,TextFlavor] = "First and the Main Motorbiker Leader. He came to be after Wild Rider and Showman discovered Impact Summoning and was quickly accepted as a Leader after showcasing his skills.";
		origText[i,TextMaterials] = "2+ ''Motorbiker'' Monsters";
		origText[i,TextChant] = "Rise first of the Leaders! Leader of the pack, the Silver fang! Impact Summon, Khan, Motorbiker Leader of the Wolf!";		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Luther, Motorbiker Leader of the Eagle";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 3; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritKind//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedMotorbiker;
		origSharedEffects[i,j++] = SharedMotorbikerLeader
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcMotorbiker;
		origArchetype[i,j++] = ArcMotorbikerLeader;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "After this card has attacked directly: Deal damage to an opponent's monster equal to this card's ATK";
		origText[i,TextFlavor] = "The Friendliest Motorbiker Leader, he raises everyones spirit with enthusiasm. He is also really good at giving speeches and interested in flying.";
		origText[i,TextMaterials] = "2+ ''Motorbiker'' Monsters";
		origText[i,TextChant] = "Fly high the Heroic Leader! Drive the darkness out with your righteous justice! Impact Summon, Luther, Motorbiker Leader of the Eagle!";		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Toku, Motorbiker Leader of the Dragon";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 7; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedMotorbiker;
		origSharedEffects[i,j++] = SharedMotorbikerLeader
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcMotorbiker;
		origArchetype[i,j++] = ArcMotorbikerLeader;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "When this card attacks: Halve this card's HP and give it +4 ATK";
		origText[i,TextFlavor] = "The Steadfast Motorbiker Leader, he has a protective and soothing aura. He isn't the most social, yet lets his actions speak for him.";
		origText[i,TextMaterials] = "2+ ''Motorbiker'' Monsters";
		origText[i,TextChant] = "Emerge the toughest of Leaders! Protect your treasure and bring us together! Impact Summon, Toku, Motorbiker Leader of the Eagle!";		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusTAUNT] = true; //TAUNT
		
	name[++i] ="Cleo, Motorbiker Leader of the Cat";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 4; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritPassionate//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedMotorbiker;
		origSharedEffects[i,j++] = SharedMotorbikerLeader;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcMotorbiker;
		origArchetype[i,j++] = ArcMotorbikerLeader;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Once Per Turn: Give an Enemy Monster -2 ATK";
		origText[i,TextFlavor] = "The Caring Motorbiker Leader. She tries to protect her team while keeping her wellbeing. She is warm and makes the Motorbikers talk about their problems.";
		origText[i,TextMaterials] = "2+ ''Motorbiker'' Monsters";
		origText[i,TextChant] = "Leader of Swiftness! Wake up and slay your enemies elegantly! Impact Summon, Cleo, Motorbiker Leader of the Cat!";		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusRanged] = true; //Ranged

	name[++i] ="Ceasar, Motorbiker Leader of the Horse";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 7; //Max HP
		origStat[i,StatSpirit] = SpiritNoble//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedMotorbiker;
		origSharedEffects[i,j++] = SharedMotorbikerLeader
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcMotorbiker;
		origArchetype[i,j++] = ArcMotorbikerLeader;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "After a non-Momentum ''Motorbiker'' monster has attacked: Deal 2 damage to the opponent";
		origText[i,TextFlavor] = "The Last Motorbiker Leader. He spends most of his time in his lab or outside learning about Momentum.";
		origText[i,TextMaterials] = "2+ ''Motorbiker'' Monsters";
		origText[i,TextChant] = "...";		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized

	name[++i] ="Embodiment of Speed";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 5; //Level
		origStat[i,StatATK] = 0; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffectsCount[i] = j;
		j=0
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Impact Summoned: Target an enemy monster, Reduce that targets' stats to 1/1 then this card gain ATK equal to the stats lost by this effect. End of Turn: Send this card to your Infirmary and Sudden Impact Summon a Level 4 ''Motorbiker Leader''";
		origText[i,TextFlavor] = "''It felt extraordinary, my mind became one with my body and I had full control over everything. It wasn't me in the driver seat, it was purely my instincts''";
		origText[i,TextMaterials] = "1 ''Motorbiker Leader'' + 1+ ''Motorbiker'' Monsters";
		origText[i,TextChant] = "Speed, Matter, Radiance, Purity. Dethrone the Beast and Abolish Destiny. Evolution Access! Embodiment of Speed!";		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Wrathful Visclades, Lentus Vio";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 6; //Level
		origStat[i,StatATK] = 5; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedVisclades;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcVisclades;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Pierced Damage: This card gets +1/-1 and card can attack again.";
		origText[i,TextFlavor] = "Leader of the Visclades, he is thirsty for justice. With his trusty axe and new powers, he is even more feared than before";
		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can't Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusPierce] = 1;
		origStatus[i,StatusCantAttackDirect] = 1;
		
		
		name[++i] ="Greedy Visclades, Riti Ava";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 5; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 6; //Max HP
		origStat[i,StatSpirit] = SpiritPassionate//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedVisclades;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcVisclades;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "When this card destroys a monster by battle: Draw a card.";
		origText[i,TextFlavor] = "After rising from the ashes of her execution, she can turn rocks into gems with the every hit of her golden hammer ";
		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized

	name[++i] ="Lustful Visclades, Idine Lib";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 6; //Level
		origStat[i,StatATK] = 4; //ATK
		origStat[i,StatMaxHP] = 4; //Max HP
		origStat[i,StatSpirit] = SpiritPassionate//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedVisclades;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcVisclades;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "When this card destroys a monster by battle: Effect Summon that card to your field with Paralyzed and Silenced";
		origText[i,TextFlavor] = "She uses her abities as an ex-Assassin and her power to brainwash to create an Army for herself";
		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Slothful Visclades, Satio Ces";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 6; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 9; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedVisclades;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcVisclades;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "When you draw a card, send this card back into your deck";
		origText[i,TextFlavor] = "While they may look tough. They can't even stand 5-Minutes on the battlefield without a break";
		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusTAUNT] = true;//TAUNT
	
	name[++i] ="Gluttonous Visclades, Luvies Ing";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 1; //Level
		origStat[i,StatATK] = 0; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcVisclades;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Mana Summoned: Gain 4 Mana and make this card Sacrificable, for the rest of this turn you can't mana summon non-''Visclades'' Monsters. You can Voidfy this card in the Infirmary, give 0/+2 to a Visclades on the field";
		origText[i,TextFlavor] = "The inventor of Visclades, while he himself is weak, his spells are what created this team. Sadly all of his spells requir hurt himself";
		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized		
		
	name[++i] ="Envious Visclades, Tia Invaden";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 6; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedVisclades;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcVisclades;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Target a non-Momentum monster, this card copies it's ATK and DEF.";
		origText[i,TextFlavor] = "Because of her past, she doesn't like her body very much. She finds more happiness in copying what other people look like";
		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized		
		
	name[++i] ="Prideful Visclades, Gloria Fastus";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 6; //Level
		origStat[i,StatATK] = 5; //ATK
		origStat[i,StatMaxHP] = 5; //Max HP
		origStat[i,StatSpirit] = SpiritNoble//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedVisclades;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcVisclades;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "After this card attacks: Deal 1 damage to all Enemy Monsters, then deal 4 damage to this card and yourself.";
		origText[i,TextFlavor] = "A war veteran with a fallen country, she cannot admit defeat without a proper battle and all she knows is to serve";
		
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized				
		origStatus[i,StatusRebellious] = true; //Rebellious
		
	name[++i] ="Cries of the Underworld";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If there are 4 or more ''Visclades'' monsters in your Infirmary, Sudden Impact Summon a ''Visclades''. End of This Turn: Destroy that Monster. Lock your wheel.";
		origText[i,TextFlavor] = "All mighty lord of the fallen. The one that forgives but is never forgiven. Absurd, deserved, justice will be served. Hear our plea, Cries of the Underworld"
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
	
	name[++i] ="Second Coming";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffectsCount[i] = j;
		j=0
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Effect Summon a non-Momentum ''Visclades'' monster from your Infirmary.";
		origText[i,TextFlavor] = "Fall, fall rise again. Balance of the universe, the rule of Zen. For every good that rises, another bad lies ahead."
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="The Bloody Sacrifice";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffectsCount[i] = j;
		j=0
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Mill a ''Visclades'' Monste then, if possible, an ally monster gains +2 ATK";
		origText[i,TextFlavor] = "Evolution requires sacrifice";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Visclades of Denial";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 10; //Level
		origStat[i,StatATK] = 7; //ATK
		origStat[i,StatMaxHP] = 8; //Max HP
		origStat[i,StatSpirit] = SpiritMalicious//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedUnderworldVisclades;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcVisclades;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Silence an enemy monster";
		origText[i,TextFlavor] = "The firstborn of the Underworld, it doesn't accept its eternal torture.";
		origText[i,TextMaterials] = "2+ Visclades";
		origText[i,TextChant] = "What happened haven't happened."
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized	
		
	name[++i] ="Visclades of Anger";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 10; //Level
		origStat[i,StatATK] = 7; //ATK
		origStat[i,StatMaxHP] = 4; //Max HP
		origStat[i,StatSpirit] = SpiritMalicious//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedUnderworldVisclades;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcVisclades;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Deal 2 Damage to all targets";
		origText[i,TextFlavor] = "After coming with the facts of what happened, it knew nothing but to destroy.";
		origText[i,TextMaterials] = "2+ Visclades";
		origText[i,TextChant] = "WHY, WHY HAD IT HAVE TO HAPPEN."
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
	
	name[++i] ="Visclades of Bargaining";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 10; //Level
		origStat[i,StatATK] = 5; //ATK
		origStat[i,StatMaxHP] = 8; //Max HP
		origStat[i,StatSpirit] = SpiritMalicious//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedUnderworldVisclades;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcVisclades;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "You can pay all your mana, recover 3 HP for each mana spent";
		origText[i,TextFlavor] = "It wanted to go back, it wanted another chance.";
		origText[i,TextMaterials] = "2+ Visclades";
		origText[i,TextChant] = "I should have done everything differently."
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Visclades of Depression";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 10; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 8; //Max HP
		origStat[i,StatSpirit] = SpiritMalicious//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedUnderworldVisclades;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcVisclades;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: All enemy cards gain Unarmed";
		origText[i,TextFlavor] = "Yet, it couldn't. Its life came to a full stop. And so did everything around it."
		origText[i,TextMaterials] = "2+ Visclades";
		origText[i,TextChant] = "Why even bother..."
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Visclades of Acceptance";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 10; //Level
		origStat[i,StatATK] = 4; //ATK
		origStat[i,StatMaxHP] = 4; //Max HP
		origStat[i,StatSpirit] = SpiritMalicious//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedUnderworldVisclades;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcVisclades;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Gain +1/+1 for each ''Visclades'' in the Infirmary. Start of Turn: Lose Indestructable";
		origText[i,TextFlavor] = "But when it lost it shackles, nobody and no one could stop it anymore. As it was the new king of its Underworld"
		origText[i,TextMaterials] = "2+ Visclades";
		origText[i,TextChant] = "And now, not even I can bring myself down."
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusIndestructable] = true; //Indestructable
		
	name[++i] ="Igloo";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 0; //ATK
		origStat[i,StatMaxHP] = 5; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedSacrifice;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcIgloo;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = ""
		origText[i,TextFlavor] = "The good old reliable, while sometimes it isn't enough, its always good to have it behind your back.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized

	name[++i] ="Pole Clan Builder";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 3; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcPoleClan;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Effect Summon an ''Igloo'' from your deck"
		origText[i,TextFlavor] = "Mastery in Basic Magic, Middle-Level in Creation Magic, Prior Experience serving 3rd parties inside Pole Clan Island";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Pole Clan Archer";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcPoleClan;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "End of Turn: Deal 3 damage to your opponent"
		origText[i,TextFlavor] = "Intermediate in Basic Magic, High-Level in Offensive Magic";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized	
		
	name[++i] ="Pole Clan Mage";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcPoleClan;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If you control an ''Igloo'' monster; search a ''Blizzard'' Spell. This effect can only be activated once per turn."
		origText[i,TextFlavor] = "Beyond-Mastery in Basic Magic, Max-Level in All Disciples of Magic, 2+ Years in Magic Related Research";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized	
		
	name[++i] ="Pole Clan Defender";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 3; //Level
		origStat[i,StatATK] = 3; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcPoleClan;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Ally ''Igloo'' Monsters gain +1 Dodge. End of Turn: Heal ally ''Igloo'' monsters by 1"
		origText[i,TextFlavor] = "Mastery in Basic Magic, High-Level in Defensive Magic, Low-Level in Offensive Magic";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Pole Clan Beast";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcPoleClan;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If you control an ''Igloo'' monster; Summoned: Gains +3/+2"
		origText[i,TextFlavor] = "Mastery in Basic Magic, Middle-Level in Offensive Magic, Consent for Biomagical Modifications";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Pole Clan Torch";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcPoleClan;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "''Pole Clan'' monsters' effects deal 1 extra damage. End of Turn: Deal 1 Damage to your opponent."
		origText[i,TextFlavor] = "Novice in Basic Magic, High-Level in Support Magic";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Blizzard - Icewall";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized

		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcBlizzard;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Pay 1 momentum, an ''Igloo'' monster gains 0/+5";
		origText[i,TextFlavor] = "A spell casted with the combination of support and creation magic, can be used to make existing walls thicker.";

		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Blizzard - Icicle Storm";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized

		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcBlizzard;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Pay 3 momentum, Deal damage to your opponent equal to the Max HP (Max 10) of an ''Igloo'' monster";
		origText[i,TextFlavor] = "A spell casted with the combination of creation and offensive magic, Uses the magic inside walls as a source for attack.";

		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Blizzard - Recruitment";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized

		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcBlizzard;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Search a ''Pole Clan'' monster";
		origText[i,TextFlavor] = "New military magic users are needed. If you meet the requirements contact your local recruiter. Long Live the Pole Clan";

		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Blizzard - Hibernation";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized

		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcBlizzard;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If you have 3 or more momentum; Paralyze an enemy monster";
		origText[i,TextFlavor] = "A spell casted with the combination of meteorology and offensive magic, Slows down the movement of enemy soldiers.";

		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized		
		
	name[++i] ="Blizzard - Lockdown";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized

		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcBlizzard;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Discard a card, Silence a card with a lower level than the discarded monster";
		origText[i,TextFlavor] = "The only public unholy spell, Can only be used by Pole Clan Mages or above. Blocks the unique abilities of a target.";

		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized	
		
	name[++i] ="Blizzard - Frost Beam";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized

		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcBlizzard;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If you control ''Pole Clan Mage''; pay 3 Momentum, Either deal 4 damage to a Monster or 3 damage to your opponent";
		origText[i,TextFlavor] = "A spell casted with the combination of sacred and offensive magic, Deals a powerful blast of concentrated magic.";

		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized	

	name[++i] ="Forbidden Blizzard - Frostbite";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized

		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcBlizzard;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "The next ''Blizzard'' card that does burn damage this turn decreases Max HP instead. This card Voidfies itself instead of going to the Infirmary.";
		origText[i,TextFlavor] = "The Left half of the Cursed Duo. Secret to anyone but Royal Scientists and the Royal Family. Can turn any magic attack into an attack that can cause irreversible damage on whatever the spell hits.";

		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized		
		
	name[++i] ="Forbidden Blizzard - Avalance";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized

		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcBlizzard;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "You can't deal damage this turn by other card effects. All the damage you would have dealt is dealt as one attack during the end of this turn.";
		origText[i,TextFlavor] = "The Right half of the Cursed Duo. Secret to anyone but Royal Scientists and the Royal Family. Able to concentrate all magic cast into one giant attack, causes too much collateral damage.";

		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized		
		
	name[++i] ="Igloo Castle";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 0; //ATK
		origStat[i,StatMaxHP] = 10; //Max HP
		origStat[i,6] = 1; //Dodge
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedSacrifice;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcIgloo;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Once per Turn: Effect Summon a ''Pole Clan'' Monster from the Infirmary";
		origText[i,TextFlavor] = "The Next Evolution to an Igloo, able to cast creation magic and support magic together to support troops";
		origText[i,TextMaterials] = "1 ''Igloo'' + 1 + ''Pole Clan'' Monsters";
		origText[i,TextChant] = "Momentum Engines, Working. Refrigeration, Level 4. Evolution, Positive. Expand!"
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusTAUNT] = true; //TAUNT

	name[++i] ="Igloo Citadel";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 8; //Level
		origStat[i,StatATK] = 0; //ATK
		origStat[i,StatMaxHP] = 20; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedSacrifice;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcIgloo;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Ally ''Pole Clan'' are fully healed";
		origText[i,TextFlavor] = "The perfect place for magic to prosper, walls made with magic infused ice protects the Citadel and the soldiers from all magic based attacks";
		origText[i,TextMaterials] = "1 ''Igloo Castle'' + 1 + ''Pole Clan'' Monsters";
		origText[i,TextChant] = "Momentum Engines, Working. Refrigeration, Level 8. Evolution, Positive. Expand Beyond!"
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusTAUNT] = true; //TAUNT
		origStatus[i,StatusIndestructable] = true; //Indestructable
		
	name[++i] ="Igloo Kingdom";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 12; //Level
		origStat[i,StatATK] = 0; //ATK
		origStat[i,StatMaxHP] = 30; //Max HP
		origStat[i,4] = 3; //Armor
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedSacrifice;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcIgloo;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Once Per Turn: Recruit 2 ''Pole Clan Archer''s";
		origText[i,TextFlavor] = "The perfect military Igloo, the magic inside the walls has settled down to make walls harder than steel.";
		origText[i,TextMaterials] = "1 ''Igloo'' + 1 + ''Pole Clan'' Monsters";
		origText[i,TextChant] = "Momentum Engines, Working. Refrigeration, Level 12. Evolution, Positive. Expand To the MAX!"
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusTAUNT] = true; //TAUNT

	name[++i] ="Shelter Wall";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 3; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 4; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "";
		origText[i,TextFlavor] = "The walls created by people in fear. Putting everything they have into it. For what it is, fairly stable";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusTAUNT] =true;
		
	name[++i] ="At long last...";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Discard your entire hand, draw cards and gain momentum equal to the number of cards discarded.";
		origText[i,TextFlavor] = "And there he was, with the power of future in his back, here to finish the suffering.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Centrifugal Rebirth";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Target one monster in your Infirmary and pay Momentum equal to its level, Effect Summon it";
		origText[i,TextFlavor] = "It was observed that Momentum also has healing abilities by boosting the biological power the body has. Some people started to think this was the power talked about in religion";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Healing Lullaby";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Pay all your Momentum, recover 2 HP for each Momentum spent.";
		origText[i,TextFlavor] = "With the new expansions on the healing powers of Momentum self healing units were invented that could heal people before they were decommisioned.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Battle Medic";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 3; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritNoble//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Mana Summoned, Add a LV 2 or lower monster in your Infirmary to your hand";
		origText[i,TextFlavor] = "A Doctor that works on the battlefield, feeling incredible with everyone they save, but 10 times worse with any lives that is lost.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Garbage Collector";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 4; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "When a monster is sent to your Infirmary: Gain +1 ATK";
		origText[i,TextFlavor] = "He wanders around in the battlefield getting any weapons that the fallen have to use for his cannon.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Earthquake";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If you control more monsters than your opponent does; send all monsters on the fields to their owners' hands, then each player gains 3 momentum for each monster affected by this effect";
		origText[i,TextFlavor] = "Seismic waves in cities were observed to increase the generation of Momentum. But how would an earthquake on the other side of the world would affect a perpetual motion machine?.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized

	name[++i] ="Power Discharge";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Discard a card, Destroy a LV 4 or lower monster. If you have 5 or less HP; destroy all monsters on the field instead.";
		origText[i,TextFlavor] = "On the battle of the mirror, the pure one should give into its reflection.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized

	name[++i] ="Man with a Shield";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 3; //Level
		origStat[i,StatATK] = 0; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritPassionate//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Destoyed: Recruit a Defenseless Man";
		origText[i,TextFlavor] = "The Man with everything to defend and too much to lose.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusTAUNT] = true; //TAUNT
		
	name[++i] ="Defenseless Man";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 1; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritNoble//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "";
		origText[i,TextFlavor] = "The Man that cannot defend that has too much to lose.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusTAUNT] = true; //TAUNT
		
	name[++i] ="The Great Leader";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritMalicious//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "You can discard a card, recruit a Body Guard";
		origText[i,TextFlavor] = "A leader so great that he can't do anything but hide behind his henchman.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusUnarmed] = true; //Unarmed

	name[++i] ="Body Guard";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 1; //Level
		origStat[i,StatATK] = 0; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Ally ''The Great Leader''s get Indestructable. Destoyed: If you don't control another Ally ''Body Guard''; Ally ''The Great Leader''s lose Indestructable";
		origText[i,TextFlavor] = "The Great Leaders' henchman. Disposeable.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusTAUNT] = true; //TAUNT
		
	name[++i] ="Awoken Civilian";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 3; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritPassionate//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Once per Turn: Recruit a Rebellion Ally";
		origText[i,TextFlavor] = "It can be anywhere, It can be anyone. The only thing that matters is someone chose to be.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusRebellious] = true; //Rebellious

	name[++i] ="Rebellion Ally";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 1; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Ally ''Awoken Civilian'' get +2 HP. Destoyed: Ally ''Awoken Civilian'' get +2 ATK";
		origText[i,TextFlavor] = "Their inclusion fuels their power, their leave fuels their rage. All of them matter as they are together strong.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized

	name[++i] ="Lunar Tank";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 8; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 6; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Start of Turn: Deal 6 Damage to your opponent";
		origText[i,TextFlavor] = "Uses radiative sky cooling to shoot energy beams. Takes too long set up, wasn't fired once.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Homesick Soldier";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 3; //Level
		origStat[i,StatATK] = 4; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If this card has 1 HP: Shuffle this card into the deck.";
		origText[i,TextFlavor] = "Misses home, wants to return.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Bloodthirst";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Pay 3 Momentum, an Aggressive or Malicious monster on the field gains +4 ATK.";
		origText[i,TextFlavor] = "Some people learnt that you can unleash you high amounts of Momentum in a certain part of the brain to make someone go crazy.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Pan Fighter";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 3; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritKind//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Destoyed: You recover 3 HP";
		origText[i,TextFlavor] = "A Local Hero that fights with reflective metals shaped as pans";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized	
		
	name[++i] ="Machine Gun Soldiers";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 3; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Deal 1 Damage to all enemy monsters";
		origText[i,TextFlavor] = "A group of soldiers that only have the task of eradication in their mind.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized

	name[++i] ="Speed Soldier";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Draw a card";
		origText[i,TextFlavor] = "His only quest is to be get out of any situation as possible to support his comrades.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized

	name[++i] ="Vengeful Cyborg";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 8; //Level
		origStat[i,StatATK] = 6; //ATK
		origStat[i,StatMaxHP] = 6; //Max HP
		origStat[i,StatSpirit] = SpiritMalicious//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Paralyze this card. When this card deals damage: Gain Momentum equal to the damage done";
		origText[i,TextFlavor] = "An Unfinished Cyborg that wants to take revenge on people who led her on that path. Sadly the government that put her on that path has already fallen";
		origText[i,TextMaterials] = "2+ Monsters"
		origText[i,TextChant] = "Take revenge from the ones that put you through the pain. Don't let your blood dry on the ground."
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Armed Civilian";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Deal 1 Damage to a monster";
		origText[i,TextFlavor] = "Although they are not a soldier, they are still skilled with their pistol.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
	
	name[++i] ="Torch Carrier";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritNoble//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "End of Turn: Mill top 3 cards of your deck, this gains +3 ATK, you lose 3 HP";
		origText[i,TextFlavor] = "After the war started he was suddenly was alone. He made a flamethrower out of the stuff in his house. He seemed confident but he is still a child.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Baby Phoenix";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "You can pay 2 mana, Effect Summon this card from your Infirmary";
		origText[i,TextFlavor] = "A legendary creature only heard of in stories. With help maybe it can grow into something else.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized

	name[++i] ="Useless Sacrifice";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 1; //Level
		origStat[i,StatATK] = 0; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcSacrifice;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Make this card sacrificable.";
		origText[i,TextFlavor] = "The Lamb with nothing but its blood to offer";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//13 = Sacrificable
		//Cards where that stat is empty don't need to be have the stat initialized
		origStat[i,StatSpirit] = true;//Unarmed
		origStat[i,13] = true;//Sacrificable

	name[++i] ="Wealthy Sacrifice";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 0; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritNoble//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedIgloo;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcSacrifice;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Sacrificed: Draw a card";
		origText[i,TextFlavor] = "The richest lamb of them all. It is the one that buys the snacks.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//13 = Sacrificable
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Ruthless Sacrifice";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedIgloo;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcSacrifice;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Sacrificed: Destroy a level 4 or lower enemy monster";
		origText[i,TextFlavor] = "This lamb is hates everything around him. He is surprisingly good at writing fight scenes";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//13 = Sacrificable
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Cursed Sacrifice";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritMalicious//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedIgloo;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcSacrifice;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Sacrificed: Effect Summon a LV 5 or higher monster from your Infirmary";
		origText[i,TextFlavor] = "The other lambs really don't want to know what she is into. They refuse to acknowledge her browser history.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//13 = Sacrificable
		//Cards where that stat is empty don't need to be have the stat initialized

	name[++i] ="Genesis Notebook";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		j=0
		
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffectsCount[i] = j;
		j=0
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If you control a ''Sacrifice'' Monster, Search a LV 5 or Higher Monster";
		origText[i,TextFlavor] = "";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//13 = Sacrificable
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Gathering of the Accursed";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffectsCount[i] = j;
		j=0
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If you control 2+ ''Sacrifice'' Monsters, Gain Mana equal to the one with the lowest LV";
		origText[i,TextFlavor] = "";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Silent Courage";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Give a ''Sacrifice'' Monster TAUNT";
		origText[i,TextFlavor] = "";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized

	name[++i] ="Nightmare Beast - Crystal Echo";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 6; //Level
		origStat[i,StatATK] = 5; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcNightmareBeast;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Mana Summoned: Unarm an enemy monster, recruit a Reflection with that monsters' ATK and HP";
		origText[i,TextFlavor] = "The Shiny Centipede, it is said that its body is made out of mirrors, it turns anything it touches into crystals.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Nightmare Beast - Conductrons";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 6; //Level
		origStat[i,StatATK] = 3; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcNightmareBeast;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Give all enemy monsters -1/-1, then this monster gains +2/+2 for each monster affected by this effect";
		origText[i,TextFlavor] = "";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Fisherman Rookie";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritPassionate//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcFisherman;
		origArchetype[i,j++] =ArcFish;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Once per turn: Recruit a ''Fish''";
		origText[i,TextFlavor] = "He is new but he is skilled. He has never not catched a fish but he doesn't know how to catch the bigger ones.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Fish";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 1; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] =ArcFish;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "";
		origText[i,TextFlavor] = "Everybody likes its taste. This fish is what almost everyone eats, buys and sells in this land.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Wise Fisherman";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 3; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritPassionate//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcFisherman;
		origArchetype[i,j++] =ArcFish;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Once per turn: 10% Do Nothing, 80% Recruit a ''Fish'', 8% Recruit two ''Fish'', 2% Recruit ''Goldfish''";
		origText[i,TextFlavor] = "He has been fishing for his entire life with his net technique, yet he has only catched the Goldfish a few times in his life";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Goldfish";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritNoble//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] =ArcFish;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: All ''Fisherman'' monsters gain +2/+2"
		origText[i,TextFlavor] = "A Legendary fish that is always heavy and said to have abilities that makes anyone who catches it to become blessed.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Lucky Fisherman";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 3; //Level
		origStat[i,StatATK] = 3; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritPassionate//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcFisherman;
		origArchetype[i,j++] =ArcFish;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Once per turn: 40% Destroy this card, 20% Recruit a ''Fish'', 35% Recruit 2 ''Fish'', 5% Recruit a ''Goldfish''";
		origText[i,TextFlavor] = "He is incredibly lucky at fishing but cannot put his heart into it, he catches Goldfishes more than anyone else but also his boats break frequently.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Strong Fisherman";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 3; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritPassionate//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcFisherman;
		origArchetype[i,j++] =ArcFish;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Gains +1 ATK everytime you summon a fish monster. Once per turn: %10 Do Nothing, %80 Recruit a ''Fish'', %10 Destroy an enemy monster then Recruit a ''Fish''";
		origText[i,TextFlavor] = "She came into the village from outside and started fishing with a spear while swimming. She cannot catch the Goldfish but no one can tell her anything because of her muscles.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized

	name[++i] ="Naive Fisherman";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 0; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritPassionate//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcFisherman;
		origArchetype[i,j++] =ArcFish;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Once per turn, %10 All ''Fish'' monsters you control gain Unarmed, %20 Recruit a ''Fish'', %60 Recruit two ''Fish'' with Unarmed, %10 Recruit a ''Goldfish'' with Unarmed";
		origText[i,TextFlavor] = "He is skilless and it shows. He once tangled everyones fishing rods together while trying to reel a rock in. Somehow, he is the luckiest person with goldfishes.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized		

	name[++i] ="Fisherman of the Oceans";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 7; //Level
		origStat[i,StatATK] = 5; //ATK
		origStat[i,StatMaxHP] = 5; //Max HP
		origStat[i,StatSpirit] = SpiritKind//Spirit
		origStat[i,StatMtPt] = 3;
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] = ArcFisherman;
		origArchetype[i,j++] =ArcFish;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "When a non''Fisherman'' ''Fish'' monster is summoned this card gains stats equal to its stats. Thrice per turn, 30% Recruit a ''Fish'', %50 Recruit a ''Fish'' then effect summon a ''Fisherman'' from your GY. %15 Recruit 3 ''Fish'', %5 Recruit a ''Goldfish''";
		origText[i,TextFlavor] = "The god of all fisherman, its said that he can feel the minds of all fish in one pond as once.";
		origText[i,TextMaterials] = "1 ''Fisherman'' + 1+ ''Fish'' Monsters"
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized		


	name[++i] ="Lucky Reel";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "10% Do Nothing, 80% Recruit a ''Fish'', 8% Recruit two ''Fish'', 2% Recruit ''Goldfish''";
		origText[i,TextFlavor] = "This rod appears once every year. It has a fair chance to catch a fish for free";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized		
		
	name[++i] ="Cursed Reel";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Pay all your momentum, trigger this effect once for each momentum spent, %80 Do Nothing, %15 Recruit a ''Fish'', %5 Recruit a ''Goldfish''";
		origText[i,TextFlavor] = "This rod is always available. It has a low chance to catch a fish for a high, high price";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized	

	name[++i] ="Marketplace of Seas";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Voidfy 5 ''Fish'' or 1 ''Goldfish'' from your GY, Gain 3 mana and draw a card";
		origText[i,TextFlavor] = "The marketplace of the fisherman is the part of the town where everyone loves to be around. It's always full of life.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized			

	name[++i] ="Highest Bidder";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Voidfy a ''Goldfish'' from your GY, Draw 2 cards and Search a ''Fisherman''";
		origText[i,TextFlavor] = "The lucky person that gets to bring the Goldfish to their family. They may lose a lot of money but its always, always worth is for the Goldfish.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized	
		
	name[++i] ="Town's Heroine";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 3; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritNoble//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "";
		origText[i,TextFlavor] = "After the government fell, her courageous heart was the only thing protecting her people";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Medical General";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 5; //Level
		origStat[i,StatATK] = 5; //ATK
		origStat[i,StatMaxHP] = 5; //Max HP
		origStat[i,StatSpirit] = SpiritKind//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: You recover 6 HP";
		origText[i,TextFlavor] = "Nobody thought that a medic could be a general but here we are.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Frightened People";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 1; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "";
		origText[i,TextFlavor] = "The foolish people that don't know what to do. They are in fear and can't cooperate.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Lost Father";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 0; //ATK
		origStat[i,StatMaxHP] = 5; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "";
		origText[i,TextFlavor] = "The man with nothing.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Single Shot Master";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 5; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 5; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Destroy a monster on the field";
		origText[i,TextFlavor] = "A masterful sniper that always takes someone down.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Desperate Power Measures";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Discard a monster, gain 3 Momentum";
		origText[i,TextFlavor] = "For most this is something they rather forget about. For the others this is when humanity ended.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Rogue Soldier";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 5; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritMalicious//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Summoned: Discard a card.";
		origText[i,TextFlavor] = "A soldier that worked used to work in the military before the governments fell, now he protects citizens, for a hefty price";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Reliable Sheriff";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 3; //Level
		origStat[i,StatATK] = 3; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritNoble//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "";
		origText[i,TextFlavor] = "A sheriff doesn't need a government of his back to protect his town.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Guard Hound";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritKind//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "";
		origText[i,TextFlavor] = "A dog that doesn't let anyone enter its house";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Foolish Mayor";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 3; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 5; //Max HP
		origStat[i,StatSpirit] = SpiritKind//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "";
		origText[i,TextFlavor] = "Without his status he didn't know what to do. The people believing him scares him.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Sworn Soldier";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 3; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritNoble//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "";
		origText[i,TextFlavor] = "This soldier swore an protecting his people and his promise outlived everything.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Stray Cat";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 0; //ATK
		origStat[i,StatMaxHP] = 5; //Max HP
		origStat[i,StatSpirit] = SpiritMalicious//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "";
		origText[i,TextFlavor] = "It's owner never came back one day. It has been ruling the house ever since";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Casey, X-Makine Cannons";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedXMakine;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] =ArcXMakine;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If you have 3 Momentum or less; Once per turn: All other ''X-Makine'' monsters you control gain +1 ATK, then gain 4 Momentum.";
		origText[i,TextFlavor] = "The head of X-Makines. His cannons can shoot bullets of fire.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Theo, X-Makine Shields";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritPassive//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedXMakine;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] =ArcXMakine;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If you have 3 Momentum or less; Once per turn: All other ''X-Makine'' monsters you control gain +1 Max HP, then gain 4 Momentum.";
		origText[i,TextFlavor] = "The brain of X-Makines. His Shields can protect all their members at once.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Lily, X-Makine Carrier";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritKind//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedXMakine;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] =ArcXMakine;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If you have 0 Momentum; Once per turn: Search a ''X-Makine'' monsters, then gain 4 Momentum.";
		origText[i,TextFlavor] = "The heart of X-Makines. She can use her mech to bring any of her friends to the battlefield.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Robert, X-Makine Wheels";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 3; //ATK
		origStat[i,StatMaxHP] = 2; //Max HP
		origStat[i,StatSpirit] = SpiritKind//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedXMakine;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] =ArcXMakine;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If you have 3 Momentum or less; Once per turn: Add ''X-Makine'' monsters from your Infirmary to your hand, then gain 4 Momentum.";
		origText[i,TextFlavor] = "The legs of X-Makines. Once someone falls he is always there to save them.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Dom, X-Makine Airforce";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 2; //Level
		origStat[i,StatATK] = 2; //ATK
		origStat[i,StatMaxHP] = 3; //Max HP
		origStat[i,StatSpirit] = SpiritNoble//Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedXMakine;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] =ArcXMakine;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If you have 3 Momentum or less; Once per turn: Draw a card and increase an ''X-Makine'' monsters' Level by 1, then gain 4 Momentum.";
		origText[i,TextFlavor] = "The eyes of X-Makines, He is the one that always alerts everyone else and takes them high.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Jason, DX-Makine Thundermech";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMomentum;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 6; //Level
		origStat[i,StatATK] = 4; //ATK
		origStat[i,StatMaxHP] = 4; //Max HP
		origStat[i,StatSpirit] = SpiritAggressive; //Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1
		origSharedEffects[i,j++] = SharedXMakine;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] =ArcXMakine;
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Once per Turn: If you have 6 Momentum or less; Silence an enemy monster, then gain 6 Momentum. If you have more than 6 Momentum; Deal 8 damage to any enemy monster, then lose 6 Momentum.";
		origText[i,TextFlavor] = "All the X-Makines have combined to create a powerful mech! It can use its excess heat to shoot out of its cannons.";
		origText[i,TextMaterials] = "2+ ''X-Makine'' Monsters"
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		
	name[++i] ="Emergency Call";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If you control at least exactly one ''X-Makine'' monster and your opponent controls at least one monster; Effect Summon a ''X-Makine'' monster from your deck then gain 5 Momentum.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized	
		
	name[++i] ="Mighty Changing Fire Blades";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Pay all your Momentum, an ''X-Makine'' monster gains ATK equal to the Momentum spent. If you paid 0 Momentum; Give that card TAUNT instead.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized	

	name[++i] ="X-Makines Form Together!";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeSpell;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is -1

		origSharedEffectsCount[i] = j;
		j=0

		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "If you control at least 2 ''X-Makine'' monsters and your opponent controls a Momentum Monster; Send all cards you control the Infirmary and Sudden Impact Summon a ''X-Makine'' monster.";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized	
		
	name[++i] ="Reflection";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] = TypeMonster;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,StatLevel] = 4; //Level
		origStat[i,StatATK] = 1; //ATK
		origStat[i,StatMaxHP] = 1; //Max HP
		origStat[i,StatSpirit] = SpiritPassive; //Spirit
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is not initialized
		//Motorbiker = 1, Motorbiker Leader = 2, Visclades = 3, Underworld Visclades = 4
		//Sacrifice = 5, Igloo = 6, X-Makine = 7
		origSharedEffectsCount[i] = j;
		j=0
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,TextEffect] = "Destroyed: Deal 3 Damage to both players";
		origText[i,TextFlavor] = "";
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized

	total_cards=++i
		
	name[++i] ="Void 2, Poyraz Messes Up Once Again";
		//write -1 = invalid, 0 = monster, 1 = momentum or 2 = spell
		card_type[i] =TypeInvalid;


		j=0;
		//Card Stats
		//0 = Level, 1 = ATK, 2 = Max HP, 3 = HP, 4 = Armor, 5 = Regerenation, 6 = Dodge
		//Cards where that stat is default/invalid don't need have the status initialized
		origStat[i,j++] = -1; //Level
		origStat[i,j++] = -1; //ATK
		origStat[i,j++] = -1; //Max HP
		origStat[i,j++] = -1; //HP
		origStat[i,j++] = -1; //Armor
		origStat[i,j++] = -1; //Regerenation
		origStat[i,j++] = -1; //Dodge
		
		j=0
		//Card Groups
		//In the case that a card doesn't have that feature the value is not initialized
		//Motorbiker = 1, Motorbiker Leader = 2, Visclades = 3, Underworld Visclades = 4
		//Sacrifice = 5, Igloo = 6, X-Makine = 7
		origSharedEffects[i,j++] =-1;
		origSharedEffectsCount[i] = j;
		j=0
		origArchetype[i,j++] ="YEP Coding Pepega";
		origArchetypeCount[i] = j;
		
		j=0
		//Card Text
		//0 = Effect Text, 1 = Flavour Text, 2 = Summoning Requirements, 3 = Summoning Chant
		origText[i,j++] = "Destroyed: Poyraz sits down and cries";
		origText[i,j++] = "If you are reading this, I royally and utterly fucked up in a completely different way this time";
		origText[i,j++] = "1 Really Smart Troll OR 1 Really Dumb Player + No future thinking";
		origText[i,j++] = "WHYYYY *distant sobbing noises* AAAAAAAAAA *flips table*"
		j=0
		//Card Status'
		//0 = Taunt, 1 = Pierce, 2 = Rebellious, 3 = Immune, 4 = Indestructable, 5 = Lifesteal, 6 = Sneaky
		//7 = Unarmed, 8 = Ranged, 9 = Paralyzed, 10 = Poisoned, 11 = Silenced, 12 = Can Attack Directly
		//Cards where that stat is empty don't need to be have the stat initialized
		origStatus[i,StatusImmune] = 1; //Immune
}