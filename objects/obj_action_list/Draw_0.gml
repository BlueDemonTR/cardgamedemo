//TODO: Redo Action List
return

draw_set_font(fnt_default)
draw_sprite(sprite_index,-1,x,originY)
if(!open_list){
	image_angle=0
	draw_text(x,originY,string(last_action)+" "+string(action_list[last_action]));
	
}
else{
	widthCap = 1500 - y;
	start = y-55;
	draw_rectangle_color(x,originY,1500,startlast,c_ltgray,c_ltgray,c_gray,c_gray,false)
	for(i=last_action; i > 0; i--){
		
		if(y+(start)>originY){draw_text_ext(x,y+(start),string(i)+" "+string(action_list[i]),16,widthCap);}
		start += string_height_ext(string(i)+" "+string(action_list[i]),16,widthCap) + 1
	}
	startlast = start + y
	if(startlast <= originY){startlast = originY + 17}
}
