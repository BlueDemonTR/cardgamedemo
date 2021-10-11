//Tries to end the turn every 30 frames if the game state is open

if(!mid_effect && open_game_state){
	obj_player.turn_count++;
	obj_player.end_phase = false;
	obj_player.own_turn = false;
	endTurnEffectActivated = false
	scr_message_end_turn();
}else{
	alarm[2] = 30
}
