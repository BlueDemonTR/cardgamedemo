if(connected){sprite_index=spr_server_on}
else if(!connected){sprite_index=spr_server_off}
draw_self();

draw_set_color(c_blue);
for(i = 0; i<50;i++){
	if(match_array[i,0] >-1 ||match_array[i,1] >-1 ||match_array[i,2]){
		draw_text(5,5+(i*13),string(match_array[i,0]) + " " + string(match_array[i,1]) + " "+ string(match_array[i,2]));
	}
}
draw_text (room_width/2, 5, string(match_count));
draw_text(room_width/2+40,20,string(legal_version))