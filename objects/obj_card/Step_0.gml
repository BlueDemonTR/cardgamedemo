if(card_drawn== true){
	if(alarm[0] == -1){alarm[0] =1;}
}
if (card_in_hand==true) {
	card_x =room_width/2 -player.handCount/2*(card_width+3) + card_width/2+hand_position*(card_width+3);
	if (point_distance(x,y,card_x,card_y)> 10){
	move_towards_point(card_x, card_y,10);
	}
	else {
		global.drawing_card = false;
		x = card_x;
		y = card_y;
		speed = 0;	
	}
}
if(mouse_check_button_released(mb_left)){
	selected = false;	
}
if (selected){
	obj_card_info_writer.selected_card[0] = self.cardNum;
	obj_card_info_writer.selected_card[1] = self.artNum;
}

if(alarm[0] > -1){
	if(point_distance(x,y,player.infirmary_x,player.infirmary_y) > 10){
		move_towards_point(player.infirmary_x,player.infirmary_y,10);
	}else{
		x = player.infirmary_x;
		y = player.infirmary_y;
		speed = 0;
		}
}