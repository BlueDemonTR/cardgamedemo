function scr_remove_from_infirmary(infirmaryPos) {
	
	for (var i=infirmaryPos; i < infirmaryCount; i++){
		infirmary[i,0] = infirmary[i+1,0];
		infirmary[i,1] = infirmary[i+1,1];
	}
	infirmaryCount--;
	if(player = obj_player){	
		if(infirmaryPos = infirmary){
			if(infirmaryPos != 0){
				obj_infirmary.cardOnTop = infirmary[infirmaryCount-1,0]
				obj_infirmary.artOnTop = infirmary[infirmaryCount-1,1]
			}else{
				obj_infirmary.cardOnTop = 0;
				obj_infirmary.artOnTop = 0;
			}
		}
		scr_message_infirmary();
	}else{	
		scr_message_opponent_infirmary();
	}	


}
