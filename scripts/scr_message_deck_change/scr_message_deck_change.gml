function scr_message_deck_change() {
	if (!instance_exists(obj_client)){return;}

	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_DECK_CHANGE);
	buffer_write(obj_client.send_buffer, buffer_u8, obj_player.deckCount);
	for(var i = 0; i < obj_player.deckCount; i++){
		buffer_write(obj_client.send_buffer, buffer_u32, obj_player.deck[i,0]);
		buffer_write(obj_client.send_buffer, buffer_u8, obj_player.deck[i,1]);
	}
	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));

	//obj_opponent.deckCount = obj_player.deckCount;


}
