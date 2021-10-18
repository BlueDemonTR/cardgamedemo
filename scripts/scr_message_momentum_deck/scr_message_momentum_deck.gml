function scr_message_momentum_deck() {
	if (!instance_exists(obj_client)){return;}

	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_MOMENTUM_DECK);
	buffer_write(obj_client.send_buffer, buffer_u8, obj_player.momentumDeckCount);
	for(var i = 0; i < obj_player.momentumDeckCount; i++){
		buffer_write(obj_client.send_buffer, buffer_u32, obj_player.momentumDeck[i, 0]);
		buffer_write(obj_client.send_buffer, buffer_u8, obj_player.momentumDeck[i, 1]);
	}
	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));



	//obj_opponent.momentumDeckCount = obj_player.momentumDeckCount;


}
