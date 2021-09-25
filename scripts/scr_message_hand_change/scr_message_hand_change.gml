function scr_message_hand_change() {
	if (!instance_exists(obj_client)){return;}

	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_HAND_CHANGE);
	buffer_write(obj_client.send_buffer, buffer_u8, obj_player.handCount);
	for(var i = 0; i < obj_player.handCount; i++){
		buffer_write(obj_client.send_buffer, buffer_u32, obj_player.hand[i,0]);
		buffer_write(obj_client.send_buffer, buffer_u8, obj_player.hand[i,1]);
	}
	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));

	/*obj_opponent.handCount = obj_player.handCount;
	obj_opponent.deckCount = obj_player.deckCount;

	for (var i=0; i < obj_player.handCount; i++){
		obj_opponent.hand[i] = obj_player.hand[i];
	}

	return;

/* end scr_message_hand_change */
}
