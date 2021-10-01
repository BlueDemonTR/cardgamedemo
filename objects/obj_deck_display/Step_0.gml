if(deckPos == main.deckCount-1 || linePos == main.maxLineSize-1 || main.deckCount <= 40 || macros.card_type[cardNum] == TypeMomentum){
	mask_index=spr_small_collision_box
}else{
	mask_index=spr_small_collision_box_half
}