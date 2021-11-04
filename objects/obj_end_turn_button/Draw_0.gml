draw_set_font(fnt_default)
draw_self();
if(obj_player.own_turn){
	draw_text(x - 100, y - 70, "Your Turn");
}else{
	draw_text(x - 80, y - 70, "Opponent Turn");
}

if(obj_player.end_phase){
	draw_text(x - 100, y + 5, "End Phase");
}

draw_text(x - 100, y - 20, obj_player.turn_count);