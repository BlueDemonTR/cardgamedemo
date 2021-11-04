draw_self();
draw_set_font(fnt_upheaval_giant);
draw_set_color(c_red);

if(
	timer != 180
	&& mouse_check_button(mb_left) 
	&& point_distance(x,y,mouse_x,mouse_y) < 66.6
){
	draw_text(x + 75,y - 90, int64(timer/60) + 1);
}