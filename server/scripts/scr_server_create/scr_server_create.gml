function scr_server_create(argument0) {
	var
	port = argument0,
	server = 0;

	server = network_create_server_raw(network_socket_tcp, port, 100);

	send_buffer = buffer_create(16384, buffer_fixed, 1);

	return server;


}
