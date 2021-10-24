
draw_set_font(fnt_default);
depth=0;
randomize()

//don't set it to true in online
test_mode = macros.test_mode;

//TODO: Remove
mid_effect = false

//hand location
hand_x = 550;
hand_y = 1000;

if(false){
	hand_x = hand_y //This is here because I am sick of the syntax error pop up
}

handCount = 0;
for(i=0;i < 7; i++){
	hand[i,0]=0;
	hand[i,1]=0;
	handCard[i] = noone;
}

//Player Objects
player = obj_player
opponent = obj_opponent

//Deck Locations
deck_x = 1490;
deck_y = 935;
momentum_deck_x = obj_momentum_deck.momentum_deck_x
momentum_deck_y = obj_momentum_deck.momentum_deck_y

//Activation Area Locations
activation_area_x1= 600;
activation_area_y1= 225;
activation_area_x2 = 1320;
activation_area_y2 = 850;
deck_buffer_x = .2;
deck_buffer_y = .2;


//Deck Initialization
deckCount = 0;
for(i = 0; i < 65; i++){
	deck[i, 0] = 0;
	deck[i, 1] = 0;
}
momentumDeckCount = 0;
for(i = 0; i < 8; i++){
	momentumDeck[i, 0] = 0;
	momentumDeck[i, 1] = 0;
}
selected_wheel = 0;

//Contructing Decks
scr_construct_global_deck();
scr_shuffle_deck(player);

//Stacking the deck for debug purposes here
deck[deckCount++] = [32,0]
deck[deckCount++] = [41,0]
deck[deckCount++] = [41,0]
deck[deckCount++] = [41,0]
deck[deckCount++] = [41,0]

//Field Card Zone Locations and initializations
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
for (j = 0; j < field_zone_count; j++){
 	field[j] = [0, 0];
	fieldCard[j] = noone;
}
//Phases and Turn Related Stuff
own_turn = false;

turn_count = 0;

initialization_done = true;//TODO make this false after the initialization is done

start_turn = true;
startTurnEffectsActivated = false;
main_phase = false;
end_phase = false;
endTurnTimer = 10;
endTurnEffectActivated = false;

//Game State and Response
open_game_state = true;
player_response_left = false
opponent_response_left = false
response_delay = 30


//Effect Resolution Initialization
/*
HOW TO WRITE AN EFFECT

scr_add_resolution_pile(argumentsArray)

0 = cardNum
1 = if the card has multiple effects, which one is trying to resolve
2 = 0 Means Effect Hasn't Resolved Yet, 1-98 Effect Has Started Resolving, 99 Effect Successfully Resolved
3 = if the card that has a relevant position, what is it?
4 = is the effect negated
5 = if the card has a target what is it? (optional)
6+= if it has another target OR other information to remember what are those? (optional)

How the resolution pile works
When effects stop triggering and neither player have responses, the resolutionPile will be copied to the
resolvingPile and it will start resolving from there.
The Effect at the top tries to resolve, it if's, Resolution Step is at 99 resolving pile count goes down
and the next effect starts resolving
*/

resolutionPileCount=0
resolvingPileCount=0

for(i = 0; i < 10 ; i++){
	for(j = 0; j < 6; j++){
		resolutionPile[i,j]=0
		resolvingPile[i,j]=0
	}
}

//Infirmary Initialization
for (i = 0; i < 10; i++){
	infirmary[i,0] = 0;
	infirmary[i,1] = 0;
	infirmary[i,2] = 0;
}
infirmaryCount = 0;
infirmary_x=deck_x;
infirmary_y=deck_y-(card_height+5);
instance_create_layer(infirmary_x,infirmary_y,"Instances",obj_infirmary)

//Player Stats Initialization
mana = 0;
maxMana = 8;
momentum = 0;
maxMomentum = 12;
playerMaxHP = 60;
playerHP = playerMaxHP;
wheel_locked = false;

//Summon Limitations Initialization
scr_reset_limitations()

//Impact Summon Stuff
impactSummoning = false;
materialDisplay[0] = [0,0] 
// [Requirement Name, Requirement Number] = [Requirement(String), Required, Have]

//Game State
//Win 1
//Lose -1
//Game Still Going on 3
victory_state = 0;