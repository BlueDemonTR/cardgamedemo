if(open_game_state && obj_player.own_turn && obj_player.main_phase){
	obj_player.main_phase = false;
	obj_player.end_phase =true;
}
//else if(!obj_player.mid_effect && obj_player.own_turn && obj_player.end_phase){
//	obj_player.turn_count++
//	obj_player.start_turn =true;
//}