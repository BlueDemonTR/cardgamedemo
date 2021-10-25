player = obj_opponent;
opponent = obj_player;

handCount = 0;
for(i=0;i < 7; i++){
	hand[i,0]=0;
	hand[i,1]=0;
	handCard[i] = noone;
}

deckCount = 0;
for(i = 0; i < 65; i++){
	deck[i, 0] = 0;
	deck[i, 1] = 0;
}
deck_buffer_x = obj_player.deck_buffer_x;
deck_buffer_y = obj_player.deck_buffer_y;
deck_x = 433;
deck_y = 145;

//field stuff
i = 0;
field_card_zone_x[i] = 670;
field_card_zone_y[i++] = 330;
field_card_zone_x[i] = 814;
field_card_zone_y[i++] = 330;
field_card_zone_x[i] = 960;
field_card_zone_y[i++] = 330;
field_card_zone_x[i] = 1105;
field_card_zone_y[i++] = 330;
field_card_zone_x[i] = 890;
field_card_zone_y[i++] = 536;
field_zone_count = i;
for (j=0; j < field_zone_count; j++){
 	field[j,0] = 0;
 	field[j,1] = 0;
	fieldCard[j] = noone;
}

//Infirmary
for (i = 0; i<10; i++){
	infirmary[i,0] = 0;
	infirmary[i,1] = 0;
	infirmary[i,2] = 0;
}
infirmaryCount = 0;
infirmary_x=deck_x;
infirmary_y=deck_y+(card_height+5);

//Momentum deck
momentum_deck_x = 1385;
momentum_deck_y = 320;
momentumDeckCount = 0;
for(i = 0; i < 8; i++){
	momentumDeck[i, 0] = 0;
	momentumDeck[i, 1] = 0;
}

//Player Stats Initialization
playerStat = macros.defaultStatPlayer
getStat = function(stat){
	if(array_length(playerStat) >= stat){
		return playerStat[stat]
	}else{
		return macros.defaultStatPlayer[stat]
	}	
}

//Player Statuses Initialization
playerStatus = macros.defaultStatusPlayer
getStatus = function(status){
	if(array_length(playerStatus) >= status){
		return playerStatus[status]
	}else{
		return macros.defaultStatusPlayer[status]
	}	
}

scr_reset_limitations()