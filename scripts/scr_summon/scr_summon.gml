// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_summon(cardNum, artNum, player, summonType, animationType, summonZone){
	if(scr_limited_summon(cardNum)){return;}
	with(player){
		if(field[summonZone,0] == 0){
			fieldCard[summonZone] = instance_create_depth(field_card_zone_x[summonZone],field_card_zone_y[summonZone], 1, obj_field_card);
			var
			sprite = macros.sprite_array[cardNum,artNum];
			with(fieldCard[j]){
				summoning_method = summonType
				player = obj_player;
				opponent = obj_opponent
				self.cardNum = cardNum;
				self.artNum = artNum;
				self.position = summonZone;
				scr_info_to_instance(cardNum);
				field_x = player.field_card_zone_x[self.position];
				field_y = player.field_card_zone_y[self.position];
				sprite_index = sprite;				
			}
			scr_message_field(summonZone, cardNum, artNum,"none");
			field[summonZone,0]= cardNum;
			field[summonZone,1]= artNum;
			return fieldCard[summonZone];
		}
	}
	return false;
}