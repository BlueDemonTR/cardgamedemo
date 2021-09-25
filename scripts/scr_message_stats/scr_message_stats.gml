function scr_message_stats() {
	if (!instance_exists(obj_client)){return;}

	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_STATS);
	buffer_write(obj_client.send_buffer, buffer_u8, obj_player.playerHP);
	buffer_write(obj_client.send_buffer, buffer_u8, obj_player.mana);
	buffer_write(obj_client.send_buffer, buffer_u8, obj_player.momentum);
	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));



	/*	if(momentum !=obj_opponent.momentum){obj_opponent.momentum = momentum}
		if(mana !=obj_opponent.mana){obj_opponent.mana = mana}
		if(playerHP !=obj_opponent.playerHP){obj_opponent.playerHP = playerHP}


/* end scr_message_stats */
}
