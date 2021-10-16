if(!connected){
	server = scr_server_create(9001);
}

if(server >= 0 && !connected){connected=true;}
if(connected){
	ini_open("options.ini")
		legal_version = ini_read_string("Version","Recent","0.0.0.1")
	ini_close();
}