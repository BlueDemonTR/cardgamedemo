function OriginalCard(cardNum) constructor{
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

	Statuses = {
	};
}

function OriginalCard(name, SuperType) constructor{
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
		
			Statuses: {},
		
			Archetypes: [
				ArchetypesList.Motorbiker
			],
		
			SharedEffects: [
				SharedEffectsList.Motorbiker
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
				FlavorText: macros.origText[cardNum,  TextFlavor]
			},
		}
	]
}