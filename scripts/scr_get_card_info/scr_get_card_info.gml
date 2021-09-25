function scr_get_card_info(argument0) {
	
	var cardNum = argument0[0],
	artNum = argument0[1],
	showOriginal = argument0[2],
	i=1,
	j=0,
	start = 755,
	widthCap = 320,
	archetypelist = noone,
	sharedeffectlist = noone,
	sharedeffectext ="",
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
	
	if (macros.card_type[cardNum] != "2"){
		
		draw_text(305-(string_length(string(macros.origStat[cardNum,0]))*5) ,509,string(macros.origStat[cardNum,0]));
		draw_set_font(fnt_big)
		draw_text(110 - string_length(string(macros.origStat[cardNum,1]))*10,710,string(macros.origStat[cardNum,1]));
		draw_text(314- string_length(string(macros.origStat[cardNum,2]))*10,710,string(macros.origStat[cardNum,2]));
		draw_set_font(fnt_default)
	}
	for(j=0; j < macros.origArchetypeCount[cardNum];j++){
		archetypelist[j++] = string(macros.origArchetype[cardNum,j]);
	}
	//if (archetype1[cardNum] != -1) {archetypelist[j++] = string(archetype1[cardNum]);}
	//if (archetype2[cardNum] != -1) {archetypelist[j++] = string(archetype2[cardNum]);}
	//if (archetype3[cardNum] != -1) {archetypelist[j] = string(archetype3[cardNum]);}


	if (archetypelist !=noone) {
		archetypelist=string(archetypelist);
		var archetypelist=string(archetypelist);
		archetypelist = string_replace_all(archetypelist,"[","");
		archetypelist = string_replace_all(archetypelist,"]","");
		archetypelist = string_replace_all(archetypelist,",",", ");
		draw_text_ext(19,start,string(archetypelist)+" card",16,widthCap);
		start += string_height_ext(string(archetypelist)+"card",16,widthCap)-5
	}

	//j=0;
	for(j=0; j < macros.origSharedEffectsCount[cardNum];j++){
		sharedeffectlist[j] = string(macros.shared_effect_name[macros.origSharedEffects[cardNum,j]]);
		sharedeffectext += " "+macros.shared_effect[macros.origSharedEffects[cardNum,j]]
	}
	//if (shared_effects1[cardNum] != -1) {
	//	sharedeffectlist[j++] = string(shared_effects1[cardNum]);
	//	for(var k = 0; k < shared_effect_count; k++){
	//		if(shared_effects1[cardNum] == shared_effect_name[k]){
	//			sharedeffectext += " "+shared_effect[k]
	//			break;
	//		}
	//	}	
	
	//}
	//if (shared_effects2[cardNum] != -1) {
	//	sharedeffectlist[j++] = string(shared_effects2[cardNum]);
	//	for(var k = 0; k < shared_effect_count; k++){
	//		if(shared_effects2[cardNum] == shared_effect_name[k]){
	//			sharedeffectext += " "+shared_effect[k]
	//			break;
	//		}
	//	}
	//}
	//if (shared_effects3[cardNum] != -1) {
	//	sharedeffectlist[j++] = string(shared_effects3[cardNum]);
	//	for(var k = 0; k < shared_effect_count; k++){
	//		if(shared_effects3[cardNum] == shared_effect_name[k]){
	//			sharedeffectext += " "+shared_effect[k]
	//			break;
	//		}
	//	}
	//}
	if (sharedeffectlist !=noone) {
		var sharedeffectlist=string(sharedeffectlist);
		sharedeffectlist = string_replace_all(sharedeffectlist,"[","");
		sharedeffectlist = string_replace_all(sharedeffectlist,"]","");
		sharedeffectlist = string_replace_all(sharedeffectlist,",",", ");
		sharedeffectlist = string_replace_all(sharedeffectlist,"\"","");
		if(keyboard_check_direct(vk_lcontrol) || (mouse_x > 19 && (mouse_x < 19+string_width(string(sharedeffectext)) || mouse_x < 200+string_width(string(sharedeffectlist))) && mouse_y > start+i*16 && mouse_y < start+(i+1)*18)){
			draw_text_ext(19,start,"Shared Effects: "+string(sharedeffectext),16,widthCap);
			start += string_height_ext("Shared Effects: "+string(sharedeffectext),16,widthCap)-5
		}else{
			draw_text_ext(19,start,"Shared Effects: "+string(sharedeffectlist),16,widthCap);
			start += string_height_ext("Shared Effects: "+string(sharedeffectlist),16,widthCap)-5
		}
	}

	if(variable_array_exists(macros.origText,cardNum,2)){
		draw_text_ext(19,start,string(macros.origText[cardNum,2]),16,widthCap);
		start += string_height_ext(string(macros.origText[cardNum,2]),16,widthCap)-5	
	}

	//if(macros.card_type[cardNum] = 1){
	//	draw_text_ext(19,start,string(macros.origText[cardNum,2]),16,widthCap);
	//	start += string_height_ext(string(macros.origText[cardNum,2]),16,widthCap)-5	
	//}

	j=0;
	if(keyboard_check_direct(vk_lcontrol) || (mouse_x > 19 && mouse_x < 344 && mouse_y > start && mouse_y < 1850)){
		
		for(i = 0; i < macros.status_count; i++){
			if(variable_array_exists(macros.origStatus,cardNum,i)){
				effectlist[j++] = macros.statusDesc[i]
			}
		}
				
		//if(variable_array_exists(macros.origStatus,cardNum,0)) {effectlist[j++]="Your opponent can only attack monsters with TAUNT";}
		//if(variable_array_exists(macros.origStatus,cardNum,1)) {effectlist[j++]="When this card attacks your opponent gets damaged equal to the excess damage";}
		//if(variable_array_exists(macros.origStatus,cardNum,2)) {effectlist[j++]="Can't be silenced";}
		//if(variable_array_exists(macros.origStatus,cardNum,3)) {effectlist[j++]="Can't be affected by other card effects";}
		//if(variable_array_exists(macros.origStatus,cardNum,4)) {effectlist[j++]="Can't be destroyed by card effects";}
		//if(variable_array_exists(macros.origStatus,cardNum,5)) {effectlist[j++]="You recover HP equal to the damage this card does";}
		//if(variable_array_exists(macros.origStatus,cardNum,6)) {effectlist[j++]="Can't be targeted for attacks or effects, a card loses sneaky after it attacks or activates an effect";}
		//if(variable_array_exists(macros.origStatus,cardNum,7)) {effectlist[j++]="This card can't attack";}
		//if(variable_array_exists(macros.origStatus,cardNum,8)) {effectlist[j++]="This card doesn't get damage while attacking";}
		//if(variable_array_exists(macros.origStatus,cardNum,9)) {effectlist[j++]="This card can't attack until the end phase";}
		//if(variable_array_exists(macros.origStatus,cardNum,10)){effectlist[j++]="Gets 1 damage at the End Turn";}
		//if(variable_array_exists(macros.origStatus,cardNum,11)){effectlist[j++]="This card is treated as effectless";}
		//if(variable_array_exists(macros.origStatus,cardNum,12)){effectlist[j++]="This card can't attack directly";}
		
		if(variable_array_exists(macros.origText,cardNum,0)){effectlist[j++]=macros.origText[cardNum,0];}
		
		if(variable_array_exists(macros.origStat,cardNum,4)){effectlist[j++]="Negates "+string(macros.origStat[cardNum,4])+" damage every battle";}
		if(variable_array_exists(macros.origStat,cardNum,5)){effectlist[j++] ="Recovers "+string(macros.origStat[cardNum,5])+" HP at the end of every turn";}
		if(variable_array_exists(macros.origStat,cardNum,6)){effectlist[j++] ="Can evade "+string(macros.origStat[cardNum,6])+" attacks";}
		if(scr_get_recruit_info(cardNum) != false){effectlist[j++] = "\n "+ scr_get_recruit_info(cardNum);}
	}else{
		for(i = 0; i < macros.status_count; i++){
			if(variable_array_exists(macros.origStatus,cardNum,i)){
				effectlist[j++] = macros.statusName[i]
			}
		}
		
		//if(variable_array_exists(macros.origStatus,cardNum,0)) {effectlist[j++]="TAUNT";}
		//if(variable_array_exists(macros.origStatus,cardNum,1)) {effectlist[j++]="PIERCE";}
		//if(variable_array_exists(macros.origStatus,cardNum,2)) {effectlist[j++]="Rebellious.";}
		//if(variable_array_exists(macros.origStatus,cardNum,3)) {effectlist[j++]="Immune";}
		//if(variable_array_exists(macros.origStatus,cardNum,4)) {effectlist[j++]="Indestructable";}
		//if(variable_array_exists(macros.origStatus,cardNum,5)) {effectlist[j++]="Lifesteal";}
		//if(variable_array_exists(macros.origStatus,cardNum,6)) {effectlist[j++]="Sneaky";}
		//if(variable_array_exists(macros.origStatus,cardNum,7)) {effectlist[j++]="Unarmed";}
		//if(variable_array_exists(macros.origStatus,cardNum,8)) {effectlist[j++]="Ranged";}
		//if(variable_array_exists(macros.origStatus,cardNum,9)) {effectlist[j++]="Paralyzed";}
		//if(variable_array_exists(macros.origStatus,cardNum,10)){effectlist[j++]="Poisoned";}
		//if(variable_array_exists(macros.origStatus,cardNum,11)){effectlist[j++]="Silenced";}
		//if(variable_array_exists(macros.origStatus,cardNum,12)){effectlist[j++]="This card can't attack directly";}
		
		if(variable_array_exists(macros.origText,cardNum,0)){effectlist[j++]=macros.origText[cardNum,0];}
		
		if(variable_array_exists(macros.origStat,cardNum,4)){effectlist[j++]="Armor("+string(macros.origStat[cardNum,4])+")";}
		if(variable_array_exists(macros.origStat,cardNum,5)){effectlist[j++] ="Regerenation("+string(macros.origStat[cardNum,5])+")";}
		if(variable_array_exists(macros.origStat,cardNum,6)){effectlist[j++] ="Dodge("+string(macros.origStat[cardNum,6])+")";}
	}
	if(effectlist != ""){
		var effectlist=string(effectlist);
		effectlist = string_replace_all(effectlist,"[","");
		effectlist = string_replace_all(effectlist,"]","");
		effectlist = string_replace_all(effectlist,"\"","");
		effectlist = string_replace_all(effectlist,", ",",");
		effectlist = string_replace_all(effectlist,",",", ");
		
		if(start + string_height_ext(effectlist,16,widthCap) > 1080 && mouse_x > 19 && mouse_x < 344 && mouse_y > start && mouse_y < 1850){
			draw_rectangle_color(19,795,widthCap+19,1000,$818181,$818181,$818181,$818181,false)
			draw_text_ext(19,800,effectlist,16,widthCap);
		}
		else{
			draw_text_ext(19,start,effectlist,16,widthCap);
		}
	}




}
