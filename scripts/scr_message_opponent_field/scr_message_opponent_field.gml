function scr_message_opponent_field(position, cardNum, artNum, animationType) {
	if (!instance_exists(obj_client)){return;}
	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_OPPONENT_FIELD);
	buffer_write(obj_client.send_buffer, buffer_u8, position);
	buffer_write(obj_client.send_buffer, buffer_u32, cardNum);
	buffer_write(obj_client.send_buffer, buffer_u8, artNum);
	buffer_write(obj_client.send_buffer, buffer_u8, animationType);

	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));

	/*obj_opponent.field[position] = cardNum;

	return;


/* end scr_message_opponent_field */
}
