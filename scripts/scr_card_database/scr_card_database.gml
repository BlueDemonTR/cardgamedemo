function convertOldCardToNewCard(cardNum) constructor{
	cardName = macros.name[cardNum];
	cardType = macros.cardType == TypeSpell ? cardMainType.Spell : cardMainType.Monster;
	superType = macros.cardType == TypeMomentum ? cardSuperType.MomentumMonster : (cardType = cardMainType.Monster ? cardSuperType.NormalMonster : cardSuperType.NormalSpell);
	
	Stats = {
	};
	
	if(scr_get_stat_orig(cardNum, StatLevel) != macros.defaultStat[StatLevel]){
		Stats.Level = scr_get_stat_orig(cardNum, StatLevel);
	}
	
	if(scr_get_stat_orig(cardNum, StatATK) != macros.defaultStat[StatATK]){
		Stats.ATK = scr_get_stat_orig(cardNum, StatATK);
	}
	
	if(scr_get_stat_orig(cardNum, StatMaxHP) != macros.defaultStat[StatMaxHP]){
		Stats.MaxHP = scr_get_stat_orig(cardNum, StatMaxHP);
	}
	
	if(scr_get_stat_orig(cardNum, StatRegeneration) != macros.defaultStat[StatRegeneration]){
		Stats.Regeneration = scr_get_stat_orig(cardNum, StatRegeneration);
	}
	
	if(scr_get_stat_orig(cardNum, StatArmor) != macros.defaultStat[StatArmor]){
		Stats.Armor = scr_get_stat_orig(cardNum, StatArmor);
	}
	
	if(scr_get_stat_orig(cardNum, StatDodge) != macros.defaultStat[StatDodge]){
		Stats.Dodge = scr_get_stat_orig(cardNum, StatDodge);
	}

	Statuses = [
	];
	
	for(var i = 0; i < status_count; i++){
		if(scr_get_status_orig(cardNum, i)){
			array_push(Statuses,i)
		}
	}
	
	Rarity = get_integer("Enter the rarity Common: " + RarityList.Common + " Rare:" + RarityList.Rare + " Legendary:" + RarityList.Legendary, RarityList.Common)

	Archetypes = json_parse(json_stringify(macros.origArchetype[cardNum]));
	
	SharedEffects = json_parse(json_stringify(macros.origSharedEffects[cardNum]))
	
	Effects = [
		"This part can't be automated"
	]
	
	Texts = {
	}
	
	Spirits = [
		macros.origStat[cardNum, StatSpirit]
	]
	
	Texts.EffectText = macros.origText[cardNum, TextEffect];
	Texts.CardLore = macros.origText[cardNum, TextFlavor];
	if(variable_array_exists(macros.origText, cardNum, TextMaterials)){
		Texts.Materials = macros.origText[cardNum, TextMaterials];
	}
	if(variable_array_exists(macros.origText, cardNum, TextChant)){
		Texts.Chant = macros.origText[cardNum, TextChant];
	}
}

function getCardFunction(originalCardObject){
	var str = "array_push(cardDatabase, new OriginalCard(" 
	+ originalCardObject.cardName + ", " 
	+ (originalCardObject.cardType == cardMainType.Spell ? "cardMainType.Spell" : "cardMainType.Monster") + ", "
	+ (originalCardObject.cardType == cardSuperType.MomentumMonster ? "cardSuperType.MomentumMonster" : (originalCardObject.cardType = cardMainType.Monster ? "cardSuperType.NormalMonster" : "cardSuperType.NormalSpell")) + ", "
	
	
	clipboard_set_text(str)
}

/*
	Up next, make a function to turn a card object into the parameters for the function below



*/

function OriginalCard(
	name = "Void", 
	cardType = cardMainType.Monster,
	superType = cardSuperType.NormalMonster,
	stats = {},
	statuses = [],
	archetypes = [],
	sharedEffects = [],
	rarity = RarityList.Common,
	effects = [],
	sprites = [spr_monster_default],
	texts = {
		EffectText: ""
	}
) constructor {
	cardName = name;
	
}

function scr_card_database(){
	cardDatabase = [
		{
			cardName: macros.name[cardNum],
			cardType: (cardMainType.Monster),
			superType: (cardSuperType.NormalMonster),
	
			Stats:{
				Level: macros.origStat[cardNum, StatLevel],
				ATK: macros.origStat[cardNum, StatATK],
				MaxHP: macros.origStat[cardNum, StatMaxHP]
			},
		
			Statuses: [],
		
			Spirits = [
				Spirit.Passionate
			],
			
			Archetypes: [
				Archetype.Motorbiker
			],
		
			SharedEffects: [
				SharedEffect.Motorbiker
			],
		
			Rarity: RarityList.Common,
		
			Effects: [
				{
					ActivationTrigger: ActivationTriggerList.AfterAttack,
					ActivationCondition: function(fieldCard){
						if(instance_exists(fieldCard) && fieldCard[position].getStatus(StatusSilenced)){return false;}
						return true;
					},
					Effect: function(resolutionObject){
						switch(resolutionObject.effectNum){
							case 0:
								if(!(instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced)) && !resolutionObject.effectSilenced){
									scr_increase_stat_player(player, PlayerMomentum, 1);
								}
								NextEffect
							break;
						}					
					}
				}
			],
		
			Sprites: [
				sprite_get_name(spr_motorshowman) //asset_get_index()
			],
		
			Texts: {
				EffectText: macros.origText[cardNum,  TextEffect],
				CardLore: macros.origText[cardNum,  TextFlavor]
			},
		}
	]
}