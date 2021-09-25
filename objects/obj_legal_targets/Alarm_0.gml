obj_player.legal_targets_open=false;
if (effectBelongsTo == 26){
	if(obj_player.alarm[1] == -1){obj_player.alarm[1]=5;}
	obj_player.multiple_effects = effectBelongsTo;
	}
instance_destroy();