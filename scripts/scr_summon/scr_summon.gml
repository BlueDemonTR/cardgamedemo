// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_summon(cardArray, player, summonType, animationType, summonZone){
	var cardNum = cardArray[CardNumber],
	artNum = cardArray[ArtNumber]
	
	if(scr_limited_summon(cardNum)){return;}
	
	with(player){
		if(!field[summonZone,0]){
			fieldCard[summonZone] = instance_create_depth(field_card_zone_x[summonZone],field_card_zone_y[summonZone], 1, obj_field_card);
			with(fieldCard[summonZone]){
				summoning_method = summonType
				self.player = player;
				self.opponent = player.opponent
				
				self.cardNum = cardNum;
				self.artNum = artNum;
				self.position = summonZone;
				field_x = player.field_card_zone_x[self.position];
				field_y = player.field_card_zone_y[self.position];
				
				scr_info_to_instance(cardNum);
				attacksLeft = 1
				effectUsesLeft = cardStat[StatXPerTurn];
				
				recruit=false;				
			}
			scr_decide_field(player, summonZone, cardNum, artNum,"none");
			field[summonZone]= [cardNum, artNum];
			return fieldCard[summonZone];
		}
	}
	return false;
}