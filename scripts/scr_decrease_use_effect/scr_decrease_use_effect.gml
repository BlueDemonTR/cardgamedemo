// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_decrease_use_effect(player, position){
	if(!instance_exists(player.fieldCard[position])){return}
	player.fieldCard[position].effectUsesLeft--
}