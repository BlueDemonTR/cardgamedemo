draw_self()
draw_set_font(fnt_default)
draw_text(x+5,y-23,string_delete(macros.selectedDeck,string_length(macros.selectedDeck)-4,5))
if(list_open){
	draw_rectangle_color(x,y,x+sprite_width,y+(selectorCap*22),c_white,c_white,c_white,c_white,false)
	for(var i = 0; i < selectorCap; i++){
		draw_text(x+5,y+(i*22),string_delete(fileList[i],string_length(fileList[i])-4,5))
	}
}