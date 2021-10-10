
draw_set_font(fnt_default);
depth=0;
randomize()
//don't set it to true in online
test_mode = macros.test_mode;
face_up = 0;
//hand location
hand_x = 550;
hand_y = 1000;

handCount = 0;
for(i=0;i < 7; i++){
	hand[i,0]=0;
	hand[i,1]=0;
	handCard[i] = noone;
}


i = 0;


handCount = i;

//
player = obj_player
opponent = obj_opponent
//deck coordinates
deck_x = 1490;
deck_y = 935;
momentum_deck_x = obj_momentum_deck.momentum_deck_x
momentum_deck_y = obj_momentum_deck.momentum_deck_y
activation_area_x1= 600;
activation_area_y1= 225;
activation_area_x2 = 1320;
activation_area_y2 = 850;
deck_buffer_x = .2;
deck_buffer_y = .2;



deckCount = 0;
for(i = 0; i < 65; i++){
	deck[i, CardNumber] = 0;
	deck[i, ArtNumber] = 0;
}
momentumDeckCount = 0;
for(i = 0; i < 8; i++){
	momentum_deck[i, CardNumber] = 0;
	momentum_deck[i, ArtNumber] = 0;
}
i = 0;
selected_wheel = 0;
scr_construct_global_deck();
scr_message_deck_change();
scr_message_momentum_deck();
scr_shuffle_deck(player);

obj_momentum_wheel.chosen_wheel = selected_wheel;

//stack the deck here


//field stuff
i = 0;

field_card_zone_x[i] = 815;
field_card_zone_y[i++] = 747;
field_card_zone_x[i] = 962;
field_card_zone_y[i++] = 747;
field_card_zone_x[i] = 1104;
field_card_zone_y[i++] = 747;
field_card_zone_x[i] = 1248;
field_card_zone_y[i++] = 747;
field_card_zone_x[i] = 1033;
field_card_zone_y[i++] = 540;
field_zone_count = i;
for (j=0; j < field_zone_count; j++){
 	field[j,0] = 0;
 	field[j,1] = 0;
	fieldCard[j] = noone;
}

//expanded deck coords

expandx = 0;
expandy = deck_y;
deck_x_2 = deck_x;


//phases and turn counts
own_turn = false;
turn_count = 0;
initialization_done = false
start_turn = true;
main_phase = false;
end_phase = false;

endPhaseChainCount=0
for(i=0;i<10;i++){
	for(j=0;j<5;j++){
		endPhaseChains[i,j]=0
	}
}

//Effect Resolution Stuff

mid_effect = false;
open_game_state = true;
player_response_left = false
opponent_response_left = false

resolutionPileCount=0
for(i=0;i<10;i++){
	for(j=0;j<6;j++){
		resolutionPile[i,j]=0
	}
}

resolvingPileCount=0
for(i=0;i<10;i++){
	for(j=0;j<6;j++){
		resolvingPile[i,j]=0
	}
}

/*
HOW TO WRITE AN EFFECT
for j values
0 = cardNum
1 = if the card has multiple effects, which one is trying to resolve
2 = 0 Means Effect Hasn't Resolved Yet, 1-98 Effect Has Started Resolving, 99 Effect Successfully Resolved
3 = if the card that has a relevant position, what is it?
4 = is the effect negated
5 = if the card has a target what is it? (optional)
6+= if it has another target OR other information to remember what are those? (optional)

How the resolution pile works

*/


//Infirmary
for (i = 0; i<999; i++){
	infirmary[i,0] = 0;
	infirmary[i,1] = 0;
	infirmary[i,2] = 0;
}
infirmaryCount = 0;
infirmary_x=deck_x;
infirmary_y=deck_y-(card_height+5);
instance_create_layer(infirmary_x,infirmary_y,"Instances",obj_infirmary);


//player stats
mana = 0;
maxmana = 8;
momentum = 0;
maxmomentum =12;
playerMaxHP = 60;
playerHP = 60;

legal_targets_open=false;
multiple_effects = 0;
wheel_locked=false;
player = obj_player;
opponent = obj_opponent;


//limit summons
scr_reset_limitations()

//impact
obj_player.currentLevel = 0;
obj_player.leader = false;
obj_player.visclades = 0;
obj_player.impactSummoning = false;
obj_player.cardToSummon = 0;

//game loss(-1)-win(1)
victory_state = 0;