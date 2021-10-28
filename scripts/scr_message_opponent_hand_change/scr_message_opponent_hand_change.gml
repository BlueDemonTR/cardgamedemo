function scr_message_opponent_hand_change() {
	if (!instance_exists(obj_client)){return;}

	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_OPPONENT_HAND_CHANGE);
	buffer_write(obj_client.send_buffer, buffer_u8, obj_opponent.handCount);
	for(var i = 0; i < obj_opponent.handCount; i++){
		buffer_write(obj_client.send_buffer, buffer_u32, obj_opponent.hand[i,0]);
		buffer_write(obj_client.send_buffer, buffer_u8, obj_opponent.hand[i,1]);
	}
	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));

/* end scr_message_opponent_hand_change */
}
