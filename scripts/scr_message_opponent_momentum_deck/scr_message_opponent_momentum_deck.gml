function scr_message_opponent_momentum_deck() {
	if (!instance_exists(obj_client)){return;}

	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_OPPONENT_MOMENTUM_DECK);
	buffer_write(obj_client.send_buffer, buffer_u8, obj_opponent.momentumDeckCount);
	for(var i = 0; i < obj_opponent.momentumDeckCount; i++){
		buffer_write(obj_client.send_buffer, buffer_u32, obj_opponent.momentum_deck[i, 0]);
		buffer_write(obj_client.send_buffer, buffer_u32, obj_opponent.momentum_deck[i, 1]);
	}
	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));



	//obj_opponent.momentumDeckCount = obj_player.momentumDeckCount;


}
