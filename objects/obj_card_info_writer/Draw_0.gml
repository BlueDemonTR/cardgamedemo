var cardNum = selected_card[0],
artNum = selected_card[1];

if(cardNum >= macros.total_cards){return;}
if (array_includes([0, 45, 46], cardNum)){return;}
var i = 0,
j = 0,
start = 755,
widthCap = 320,
effectlist = "";

//Card Sprite
draw_sprite_stretched(macros.sprite_array[cardNum,artNum],-1,212-big_card_width/2,674-big_card_height/2,big_card_width,big_card_height);

//Info Display Overlay
draw_sprite(sprite_index,-1,0,room_height)


draw_set_font(fnt_big)

//Card ATK
draw_set_color(c_red)
draw_text(120 - string_width(cardATK), 540, cardATK);

//Card Max HP
draw_set_color(cardType == "MONSTER" ? $18742d : $0c3f18)
draw_text(324 - string_width(cardMaxHP), 540, cardMaxHP);

draw_set_font (fnt_default);
draw_set_color(c_black);

if (archetypeListMax > 0){
	if(archetypeListSelector > 0){
		draw_sprite_ext(spr_small_arrow, -1, 35, 518, 1, 1, 0, c_white, 1)
	}
	if(archetypeListSelector < archetypeListMax - 1){
		draw_sprite_ext(spr_small_arrow, -1, 51, 597, 1, 1, 180, c_white, 1)
	}

	draw_sprite(macros.archetype_symbol[archetypeList[archetypeListSelector]], -1, 5, 520)
}

if (sharedListMax > 0){
	if(sharedListSelector > 0){
		draw_sprite_ext(spr_small_arrow, -1, 35, 653, 1, 1, 0, c_white, 1)
	}
	if(sharedListSelector < sharedListMax - 1){
		draw_sprite_ext(spr_small_arrow, -1, 51, 729, 1, 1, 180, c_white, 1)
	}
	draw_sprite(macros.shared_effect_symbol[sharedList[sharedListSelector]], -1, 5, 655)
	
	if(keyboard_check_direct(vk_tab) || mouse_between(5, 655, 77, 727)){
		draw_sprite_ext(spr_shared_effect_box, -1, 5, 712, 1, 1, 0, c_white,.85)
		draw_text_ext(15, 722, macros.shared_effect_name[sharedList[cardNum,sharedListSelector]] + ":", 18, 380)
		draw_text_ext(15, 742, macros.shared_effect[macros.origSharedEffects[cardNum,sharedListSelector]], 18, 380)
	}
}

//Card Name
start += draw_text_return_height(19 ,start, cardName + "-" + string(cardNum), 16, widthCap) - 5;

//Card Type
start += draw_text_return_height(9, start, cardType + " CARD", 16, widthCap) - 5;

if(cardSpirit != "Blank"){
	start += draw_text_return_height(14, start, cardSpirit + " Monster",16,widthCap) - 2;
}
	
start += draw_text_return_height(14,start,materialRequirement,16,widthCap) - 5;

j = 0;
if(keyboard_check_direct(vk_lcontrol) || mouse_between(0, 760, 340, room_height)){	
	start += draw_text_return_height(14,start,extendedEffectText,16,widthCap) - 5;
}else{
	start += draw_text_return_height(14,start,effectText,16,widthCap) - 5;
}