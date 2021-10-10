if(selected_card[0] >= macros.total_cards){return;}
if (selected_card[0] != 0 && !(selected_card[0] ==45 || selected_card[0] == 46)){
	
	var cardNum = selected_card[0],
	artNum = selected_card[1],
	//showOriginal = selected_card[2],
	i=1,
	j=0,
	start = 755,
	widthCap = 320,
	effectlist = "";
	draw_set_color(c_dkgray);
	draw_set_font (fnt_default);
	draw_sprite_stretched(macros.sprite_array[cardNum,artNum],-1,212-big_card_width/2,674-big_card_height/2,big_card_width,big_card_height);
	draw_sprite(sprite_index,-1,0,room_height)
	i=0;
	draw_set_color(c_black)
	draw_text_ext(19,start,macros.name[cardNum]+"-"+string(cardNum),16,widthCap);
	start += string_height_ext(macros.name[cardNum]+"-"+string(cardNum),16,widthCap)-5;
	draw_set_color(c_black)
	draw_text(9,start,string_upper(macros.typeName[macros.card_type[cardNum]])+" CARD");
	start += string_height_ext(string_upper(macros.typeName[macros.card_type[cardNum]])+" CARD",16,widthCap)-5
	
	if (macros.card_type[cardNum] != TypeSpell){
		
		draw_text(305-(string_length(string(macros.origStat[cardNum,StatLevel]))*5) ,509,string(macros.origStat[cardNum,StatLevel]));
		draw_set_font(fnt_big)
		draw_text(110 - string_length(string(macros.origStat[cardNum,StatATK]))*10,710,string(macros.origStat[cardNum,StatATK]));
		draw_text(314- string_length(string(macros.origStat[cardNum,StatMaxHP]))*10,710,string(macros.origStat[cardNum,StatMaxHP]));
		draw_set_font(fnt_default)
	}
	if (macros.origArchetypeCount[cardNum] > 0){
		if(archetypeListSelector > 0){draw_sprite_ext(spr_small_arrow,-1,35,518,1,1,0,c_white,1)}
		if(archetypeListSelector < archetypeListMax-1 ){draw_sprite_ext(spr_small_arrow,-1,51,597,1,1,180,c_white,1)}

		draw_sprite(macros.archetype_symbol[macros.origArchetype[cardNum,archetypeListSelector]],-1,5,520)
	
	}	
	
	if(variable_array_exists(macros.origStat,cardNum,StatSpirit)){
		draw_text_ext(14,start,string(macros.spiritName[macros.origStat[cardNum,StatSpirit]])+" Monster",16,widthCap);
		start += string_height_ext(string(macros.spiritName[macros.origStat[cardNum,StatSpirit]])+" Monster",16,widthCap)-5	
	}	
	
	if(variable_array_exists(macros.origText,cardNum,TextMaterials)){
		draw_text_ext(14,start,string(macros.origText[cardNum,TextMaterials]),16,widthCap);
		start += string_height_ext(string(macros.origText[cardNum,TextMaterials]),16,widthCap)-5	
	}

	j=0;
	if(keyboard_check_direct(vk_lcontrol) || mouse_between(19, 344, start, 1850)){
		
		for(i = 0; i < macros.status_count; i++){
			if(variable_array_exists(macros.origStatus,cardNum,i)){
				effectlist[j++] = macros.statusDesc[i]
			}
		}
				
		if(variable_array_exists(macros.origText,cardNum,TextEffect)){effectlist[j++]=macros.origText[cardNum,TextEffect];}
		
		if(variable_array_exists(macros.origStat,cardNum,StatArmor)){effectlist[j++]="Negates "+string(macros.origStat[cardNum,StatArmor])+" damage every battle";}
		if(variable_array_exists(macros.origStat,cardNum,StatRegeneration)){effectlist[j++] ="Recovers "+string(macros.origStat[cardNum,StatRegeneration])+" HP at the end of every turn";}
		if(variable_array_exists(macros.origStat,cardNum,StatDodge)){effectlist[j++] ="Can evade "+string(macros.origStat[cardNum,StatDodge])+" attacks";}
		if(scr_get_recruit_info(cardNum) != false){effectlist[j++] = "\n "+ scr_get_recruit_info(cardNum);}
	}else{
		for(i = 0; i < macros.status_count; i++){
			if(variable_array_exists(macros.origStatus,cardNum,i)){
				effectlist[j++] = macros.statusName[i]
			}
		}
		
		if(variable_array_exists(macros.origText,cardNum,TextEffect)){effectlist[j++]=macros.origText[cardNum,TextEffect];}
		
		if(variable_array_exists(macros.origStat,cardNum,StatArmor)){effectlist[j++]="Armor("+string(macros.origStat[cardNum,StatArmor])+")";}
		if(variable_array_exists(macros.origStat,cardNum,StatRegeneration)){effectlist[j++] ="Regerenation("+string(macros.origStat[cardNum,StatArmor])+")";}
		if(variable_array_exists(macros.origStat,cardNum,StatDodge)){effectlist[j++] ="Dodge("+string(macros.origStat[cardNum,StatDodge])+")";}
	}
	if(effectlist != ""){
		var effectlist=string(effectlist);
		effectlist = string_replace_all(effectlist,"[","");
		effectlist = string_replace_all(effectlist,"]","");
		effectlist = string_replace_all(effectlist,"\"","");
		effectlist = string_replace_all(effectlist,", ",",");
		effectlist = string_replace_all(effectlist,",",", ");
		
		if(start + string_height_ext(effectlist,16,widthCap) > 1080 && mouse_between(19, 344, start, 1850)){
			draw_text_ext(14,800,effectlist,16,widthCap);
		}
		else{
			draw_text_ext(14,start,effectlist,16,widthCap);
		}
	}
}
if (macros.origSharedEffectsCount[cardNum] > 0){
	draw_sprite(macros.shared_effect_symbol[macros.origSharedEffects[cardNum,sharedListSelector]],-1,5,655)
	if(sharedListSelector > 0){draw_sprite_ext(spr_small_arrow,-1,35,653,1,1,0,c_white,1)}
	if(sharedListSelector < sharedListMax-1 ){draw_sprite_ext(spr_small_arrow,-1,51,729,1,1,180,c_white,1)}
	if(keyboard_check_direct(vk_lcontrol) || mouse_between(5, 77, 655, 727)){
		draw_sprite_ext(spr_shared_effect_box,-1,5,712,1,1,0,c_white,.85)
		draw_text_ext(15,722,macros.shared_effect_name[macros.origSharedEffects[cardNum,sharedListSelector]]+":",18,380)
		draw_text_ext(15,742,macros.shared_effect[macros.origSharedEffects[cardNum,sharedListSelector]],18,380)
	}
}	

