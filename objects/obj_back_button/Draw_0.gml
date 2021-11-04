draw_self();
draw_set_font(fnt_upheaval_big);
draw_set_color(c_black);
if(alarm[0] != -1){
	draw_text(x + 50, y - 10, "Are You Sure? \nClick Again to Proceed");
}