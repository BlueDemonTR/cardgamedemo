draw_sprite(spr_base, -1, 0, 0)
draw_sprite(spr_artwork_bg, -1, 0, 0)
draw_sprite_stretched(artwork, -1, 0, 0, 400, 400)
draw_sprite(spr_effect_box, -1, 0, 0)

draw_sprite_ext(spr_effect_band_base, -1, 0, 0, 1, 1, 0, spiritColorArr[scr_get_stat_orig(cardNum, StatSpirit)], 1)
draw_sprite(spr_shared_effects_box, -1, 0, 0)
for(var i = 0; i < macros.origSharedEffectsCount[cardNum]; i++){
	draw_sprite_stretched(macros.shared_effect_symbol[macros.origSharedEffects[cardNum, i]], -1, 402 + 40*i, 545, 36, 36)
}
draw_sprite(spr_effect_band_bottom, -1, 0, 0)
draw_sprite(spr_effect_band_top, -1, 0, 0)

draw_set_font(fnt_lato_s20)
draw_set_color($ffff00)
draw_text_ext(20, 600, macros.origText[cardNum, TextEffect], string_height("a"), 490)

draw_sprite(spr_hp, -1, 0, 0)
draw_sprite(spr_atk, -1, 0, 0)
draw_sprite(spr_name_box, -1, 0, 0)


var cardLevel = scr_get_stat_orig(cardNum, StatLevel)
if(cardLevel >= 1){
	draw_sprite(spr_level_1, -1, 0, 0)	
}
if(cardLevel >= 2){
	draw_sprite(spr_level_2, -1, 0, 0)	
}
if(cardLevel >= 3){
	draw_sprite(spr_level_3, -1, 0, 0)	
}
if(cardLevel >= 4){
	draw_sprite(spr_level_4, -1, 0, 0)	
}
if(cardLevel >= 5){
	draw_sprite(spr_level_5, -1, 0, 0)	
}
if(cardLevel >= 6){
	draw_sprite(spr_level_6, -1, 0, 0)	
}
if(cardLevel >= 7){
	draw_sprite(spr_level_7, -1, 0, 0)	
}
if(cardLevel >= 8){
	draw_sprite(spr_level_8, -1, 0, 0)	
}
if(cardLevel >= 9){
	draw_sprite(spr_level_9, -1, 0, 0)	
}
if(cardLevel >= 10){
	draw_sprite(spr_level_10, -1, 0, 0)	
}
if(cardLevel >= 11){
	draw_sprite(spr_level_11, -1, 0, 0)	
}
if(cardLevel >= 12){
	draw_sprite(spr_level_12, -1, 0, 0)	
}

draw_sprite(spr_border, -1, 0, 0)