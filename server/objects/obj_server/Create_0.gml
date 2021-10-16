#macro MESSAGE_JOIN 1
#macro MESSAGE_HAND_CHANGE 2
#macro MESSAGE_FIELD 3
#macro MESSAGE_INFIRMARY 4
#macro MESSAGE_MOMENTUM_DECK 5
#macro MESSAGE_STATS 6
#macro MESSAGE_FIELD_CARD_STATS 7
#macro MESSAGE_DECK_CHANGE 8
#macro MESSAGE_OPPONENT_STATS 9
#macro MESSAGE_OPPONENT_FIELD_CARD_STATS 10
#macro MESSAGE_OPPONENT_DECK_CHANGE 11
#macro MESSAGE_OPPONENT_INFIRMARY 12
#macro MESSAGE_OPPONENT_MOMENTUM_DECK 13
#macro MESSAGE_OPPONENT_FIELD 14
#macro MESSAGE_OPPONENT_HAND_CHANGE 15
#macro MESSAGE_TURN 16
#macro MESSAGE_LAST_ACTION 17
#macro MESSAGE_END_TURN 18
#macro MESSAGE_WIN 19
#macro MESSAGE_LEAVE 20
#macro MESSAGE_OUTDATED 99

ini_open("options.ini")
	if(ini_section_exists("Version")){
		legal_version = ini_read_string("Version","Recent","0.0.0.1")
	}else{
		ini_write_string("Version","Recent","Version Here")
		ini_close()
		chooseYourLegalVersionAtOptionsDotini++
	}
ini_close()
randomize();
connected = false;

x= room_width/2;
y= room_height/2;

for(i = 0; i<50; i++){
	match_array [i, 0] = -1; //player 1 id
	match_array [i, 1] = -1; //player 2 id
	match_array [i, 2] = false; //game finished
}
match_count = 0; //room counter
start_date = scr_get_full_date()
fileName = start_date+".log"
ini_open(fileName);
ini_close();
/*
if(!connected){
	server = scr_server_create(9001);
}

if(server >= 0 && !connected){connected=true;}