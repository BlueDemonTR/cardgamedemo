// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_give_player_stats(player, playerMaxHP, playerHP, mana, momentum){
	with(player){
		self.playerMaxHP = max(self.playerMaxHP + playerMaxHP, 0);
		self.playerHP = limit_between(self.playerHP + playerHP, 0, self.playerMaxHP);
		self.mana = limit_between(self.mana + mana, 0, maxMana);
		self.momentum = limit_between(self.momentum + momentum, 0, maxMomentum);
	}
	scr_decide_stats(player)
}