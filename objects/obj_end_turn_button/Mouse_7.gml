if(obj_player.open_game_state && obj_player.own_turn && obj_player.main_phase){
	obj_player.main_phase = false;
	obj_player.end_phase = true;
}