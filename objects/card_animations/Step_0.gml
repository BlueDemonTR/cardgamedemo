if (!speedSetupDone){
	x_difference = targetX - x
	y_difference = targetY - y
	diagonal_difference = sqrt(sqr(x_difference) + sqr(y_difference))
	cardSpeed = diagonal_difference/(room_speed*.50)
	speedSetupDone = true
}

if(point_distance(x,y,targetX,targetY)<cardSpeed*1.5){
	switch(activation_mode){
		case "fieldToPlayerInfirmary":
		break;
		case "playerInfirmaryToField":
		case "playerDeckToField":
		case "playerMomentumDeckToField":
			obj_player.fieldCard[position].visible = true
		break;
	}
	instance_destroy();
	return;
	
}
if (point_distance(x,y,targetX,targetY) > cardSpeed){
	switch(activation_mode){
		case "playerInfirmaryToField":
		case "playerDeckToField":
		case "playerMomentumDeckToField":
			obj_player.fieldCard[position].visible = false
		break;
	}
	move_towards_point(targetX,targetY,cardSpeed)
}
else{
	x = targetX;
	y = targetY;
}
