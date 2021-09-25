draw_set_color(c_black)
draw_set_font(fnt_big)
draw_text(10,1000,GM_version)

if(test_mode){
	draw_text(10,950,"Debug Mode Opened, Local Server Only")
	depth = -infinity
	draw_text(200,80,string(mouse_x)+" "+string(mouse_y))
	depth = 0
}
draw_set_font(fnt_default)
draw_text(1900,20,fps)
