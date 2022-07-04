function getCardFunction(originalCardObject){
	var str = "array_push(\n	cardDatabase,\n	new OriginalCard(\n		" 
	+ "\"" + originalCardObject.cardName + "\", \n		" 
	+ (originalCardObject.cardType == cardMainType.Spell ? "cardMainType.Spell" : "cardMainType.Monster") + ", \n		"
	+ (originalCardObject.cardType == cardSuperType.MomentumMonster ? "cardSuperType.MomentumMonster" : (originalCardObject.cardType = cardMainType.Monster ? "cardSuperType.NormalMonster" : "cardSuperType.NormalSpell")) + ", \n		"
	+ string(originalCardObject.Stats) + ", \n		"
	+ "["
		if(array_includes(originalCardObject.Statuses, Status.Taunt)) str += "Status.Taunt, "
		if(array_includes(originalCardObject.Statuses, Status.CantAttackDirect)) str += "Status.CantAttackDirect, "
		if(array_includes(originalCardObject.Statuses, Status.Immune)) str += "Status.Immune,"
		if(array_includes(originalCardObject.Statuses, Status.Indestructable)) str += "Status.Indestructable, "
		if(array_includes(originalCardObject.Statuses, Status.Paralyzed)) str += "Status.Paralyzed, "
		if(array_includes(originalCardObject.Statuses, Status.Pierce)) str += "Status.Pierce, "
		if(array_includes(originalCardObject.Statuses, Status.Poison)) str += "Status.Poison, "
		if(array_includes(originalCardObject.Statuses, Status.Ranged)) str += "Status.Ranged, "
		if(array_includes(originalCardObject.Statuses, Status.Rebellious)) str += "Status.Rebellious, "
		if(array_includes(originalCardObject.Statuses, Status.SelfDestruct)) str += "Status.SelfDestruct,"
		if(array_includes(originalCardObject.Statuses, Status.Silenced)) str += "Status.Silenced,"
		if(array_includes(originalCardObject.Statuses, Status.Sneaky)) str += "Status.Sneaky,"
		if(array_includes(originalCardObject.Statuses, Status.Unarmed)) str += "Status.Unarmed,"
		if(string_char_at(str, string_length(str)) != "[") str = string_delete(str, string_length(str)-1, 2)
	str += "],\n		"
	
	if(array_length(originalCardObject.Spirits) > 0){
		str+="[Spirit." + macros.SpiritNames[macros.origStat[originalCardObject.Spirits[0], StatSpirit]] + "], \n		"
	}	
	
	
	str += "["
		if(array_includes(originalCardObject.Archetypes, Archetype.Blizzard)) str += "Archetype.Blizzard, "
		if(array_includes(originalCardObject.Archetypes, Archetype.Fish)) str += "Archetype.Fish, "
		if(array_includes(originalCardObject.Archetypes, Archetype.Fisherman)) str += "Archetype.Fisherman, "
		if(array_includes(originalCardObject.Archetypes, Archetype.Igloo)) str += "Archetype.Igloo, "
		if(array_includes(originalCardObject.Archetypes, Archetype.Motorbiker)) str += "Archetype.Motorbiker, "
		if(array_includes(originalCardObject.Archetypes, Archetype.MotorbikerLeader)) str += "Archetype.MotorbikerLeader, "
		if(array_includes(originalCardObject.Archetypes, Archetype.NightmareBeast)) str += "Archetype.NightmareBeast, "
		if(array_includes(originalCardObject.Archetypes, Archetype.PoleClan)) str += "Archetype.PoleClan, "
		if(array_includes(originalCardObject.Archetypes, Archetype.Sacrifice)) str += "Archetype.Sacrifice, "
		if(array_includes(originalCardObject.Archetypes, Archetype.Visclades)) str += "Archetype.Visclades, "
		if(array_includes(originalCardObject.Archetypes, Archetype.XMakine)) str += "Archetype.XMakine, "
		if(string_char_at(str, string_length(str)) != "[") str = string_delete(str, string_length(str)-1, 2)
	str += "],  \n		["
		if(array_includes(originalCardObject.SharedEffects, SharedEffect.UnderworldVisclades)) str += "SharedEffect.UnderworldVisclades, "
		if(array_includes(originalCardObject.SharedEffects, SharedEffect.Igloo)) str += "SharedEffect.Igloo, "
		if(array_includes(originalCardObject.SharedEffects, SharedEffect.Motorbiker)) str += "SharedEffect.Motorbiker, "
		if(array_includes(originalCardObject.SharedEffects, SharedEffect.MotorbikerLeader)) str += "SharedEffect.MotorbikerLeader, "
		if(array_includes(originalCardObject.SharedEffects, SharedEffect.Sacrifice)) str += "SharedEffect.Sacrifice, "
		if(array_includes(originalCardObject.SharedEffects, SharedEffect.Visclades)) str += "SharedEffect.Visclades, "
		if(array_includes(originalCardObject.SharedEffects, SharedEffect.XMakine)) str += "SharedEffect.XMakine, "
		if(string_char_at(str, string_length(str)) != "[") str = string_delete(str, string_length(str)-1, 2)
	str += "], \n		"
	+ (originalCardObject.Rarity == RarityList.Common ? "RarityList.Common" : (originalCardObject.Rarity == RarityList.Rare ? "RarityList.Rare" : "RarityList.Legendary")) + ", \n		"
	+ "[\"Add these by hand sorry\"], \n		"
	
	var tempSpritesArray = json_parse(json_stringify(originalCardObject.Sprites))
	for(var i = 0; i < array_length(tempSpritesArray); i++){
		tempSpritesArray[i] = sprite_get_name(tempSpritesArray[i])
	}
	
	str += string(tempSpritesArray) + ", \n		"
	+ string(originalCardObject.Texts)
	+ "\n	)\n)"
	
	return str;
	
}

function convertOldCardToNewCard(cardNum) constructor{
	cardName = macros.name[cardNum];
	cardType = macros.card_type == TypeSpell ? cardMainType.Spell : cardMainType.Monster;
	superType = macros.card_type == TypeMomentum ? cardSuperType.MomentumMonster : (cardType = cardMainType.Monster ? cardSuperType.NormalMonster : cardSuperType.NormalSpell);
	
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
	
	for(var i = 0; i < macros.status_count; i++){
		if(scr_get_status_orig(cardNum, i)){
			array_push(Statuses,i)
		}
	}
	
	Rarity = RarityList.Common//get_integer("Enter the rarity Common: " + string(RarityList.Common) + " Rare:" + string(RarityList.Rare) + " Legendary:" + string(RarityList.Legendary), RarityList.Common)

	Archetypes = json_parse(json_stringify(macros.origArchetype[cardNum]))
	
	SharedEffects = json_parse(json_stringify(macros.origSharedEffects[cardNum]))
	
	Sprites = json_parse(json_stringify(macros.sprite_array[cardNum]))
	
	Effects = [
		"This part can't be automated"
	]
	
	Texts = {
	}
	
	Spirits = [
			
	]
	
	if(variable_array_exists(macros.origStat, cardNum, StatSpirit)){
		array_push(Spirits, macros.origStat[cardNum, StatSpirit])
	}
	
	if(variable_array_exists(macros.origText, cardNum, TextEffect)){
		Texts.EffectText = macros.origText[cardNum, TextEffect];
	}
	if(variable_array_exists(macros.origText, cardNum, TextFlavor)){
		Texts.CardLore = macros.origText[cardNum, TextFlavor];
	}
	if(variable_array_exists(macros.origText, cardNum, TextMaterials)){
		Texts.Materials = macros.origText[cardNum, TextMaterials];
	}
	if(variable_array_exists(macros.origText, cardNum, TextChant)){
		Texts.Chant = macros.origText[cardNum, TextChant];
	}
}

