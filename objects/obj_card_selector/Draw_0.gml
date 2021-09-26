if(listPos >= main.filtered_card_count){return;}
draw_sprite_ext(macros.sprite_array[cardNum,artNum],-1,x,y,small_card_width/550,small_card_height/800,0,c_white,1)
if(macros.sprite_count[cardNum] != 1) draw_sprite_ext(spr_altwork,-1,x,y,small_card_width/550,small_card_height/800,0,c_white,1)
draw_set_font(fnt_default)
draw_set_color(c_black)
start = y-small_card_height/2+10
widthCap = 100
draw_text_ext(x+small_card_width/2+10,start,macros.name[cardNum],16,widthCap);
start += string_height_ext(macros.name[cardNum],16,widthCap);
draw_set_font(fnt_upheaval)
draw_text(x+small_card_width/2+10,start,string_upper(macros.typeName[macros.card_type[cardNum]])+" CARD");
start += string_height_ext(string_upper(macros.typeName[macros.card_type[cardNum]])+" CARD",16,widthCap)