
//if(obj_player.momentum <= 12 && obj_player.momentum >= 0){
//	if(sprite_index != wheelSprite[obj_player.momentum]){sprite_index= wheelSprite[obj_player.momentum];}
//}
//else if(obj_player.momentum > 12){
//	sprite_index= wheelSprite[12];
//}else{
//	sprite_index= wheelSprite[0];
//}

if(obj_player.end_phase){
	for (i = 1; i <= 4; i++){
		wheel_opt[i] = false;
	}
}
