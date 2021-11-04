// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_change_displayed_card(cardNum, artNum, showOrig){
	with(obj_card_info_writer){
		selected_card = [cardNum, artNum];
		
		cardName = macros.name[cardNum]
		cardType = string_upper(macros.typeName[macros.card_type[cardNum]])
		
		cardATK = cardType != "SPELL" ? string(scr_get_stat_orig(cardNum, StatATK)) : "";
		cardMaxHP = cardType != "SPELL" ? string(scr_get_stat_orig(cardNum, StatMaxHP)) : "";
		cardSpirit = macros.spiritName[scr_get_stat_orig(cardNum, StatSpirit)];
		
		archetypeList = json_parse(json_stringify(macros.origArchetype[cardNum]));
		archetypeListSelector = 0;
		archetypeListMax = array_length(archetypeList);

		sharedList = json_parse(json_stringify(macros.origSharedEffects[cardNum]));
		sharedListSelector = 0;
		sharedListMax = array_length(sharedList);

		materialRequirement = variable_array_exists(macros.origText,cardNum,TextMaterials) ? macros.origText[cardNum,TextMaterials] : ""
		
		effectText = ""
		extendedEffectText = ""
		
		statusList = [];
		for(var i = 0; i < macros.status_count; i++){
			if(scr_get_status_orig(cardNum, i) != macros.defaultStatus[i]){
				array_push(statusList, i)
				effectText += macros.statusName[i] + ". "
				extendedEffectText += macros.statusDesc[i] + ". "
			}
		}
		
		effectText += variable_array_exists(macros.origText,cardNum,TextEffect) ? macros.origText[cardNum,TextEffect] + ". " : ""
		extendedEffectText += variable_array_exists(macros.origText,cardNum,TextEffect) ? macros.origText[cardNum,TextEffect] + ". " : ""
		
		statList = [];
		for(var i = 0; i < macros.stat_count; i++){
			if(array_includes([StatLevel, StatATK, StatMaxHP, StatHP, StatSpirit, StatEffectUsesPerTurn], i)){continue;}
			if(scr_get_stat_orig(cardNum, i) != macros.defaultStat[i]){
				array_push(statList, i)
				effectText += macros.statName[i] + "(" + string(scr_get_stat_orig(cardNum, i)) + ")";
				extendedEffectText += macros.statDesc[i] + string(scr_get_stat_orig(cardNum, i)) + ". ";
			}
		}
		
		extendedEffectText += scr_get_recruit_info(cardNum)
	}
}