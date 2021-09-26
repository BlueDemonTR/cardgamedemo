// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_give_player_stats(player, playerMaxHP, playerHP, mana, momentum){
	with(player){
		self.playerMaxHP += playerMaxHP;
		self.playerHP = min(self.playerHP + playerHP, 60);
		self.mana += mana;
		self.momentum += momentum;
	}
	if(player = obj_player){
		scr_message_stats();
	}else if(player = obj_opponent){
		scr_message_opponent_stats();
	}
}