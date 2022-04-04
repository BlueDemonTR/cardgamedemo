// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_database_to_json(cardNum){
	tempCardObject = {
		cardName: macros.name[cardNum],
		cardType: (cardMainType.Monster),
		superType: (cardSuperType.NormalMonster),
	
		Stats:{
			Level: macros.origStat[cardNum, StatLevel],
			ATK: macros.origStat[cardNum, StatATK],
			MaxHP: macros.origStat[cardNum, StatMaxHP]
		},
		
		Statuses: {},
		
		Archetypes: [
			ArchetypesList.Motorbiker
		],
		
		SharedEffects: [
			SharedEffectsList.Motorbiker
		],
		
		Rarity: RarityList.Common,
		
		Effects: [
			{
				ActivationTrigger: ActivationTriggerList.AfterAttack,
				ActivationCondition: function(fieldCard){
					if(instance_exists(fieldCard) && fieldCard[position].getStatus(StatusSilenced)){return false;}
					return true;
				},
				Effect: function(resolutionObject){
					switch(resolutionObject.effectNum){
						case 0:
							if(!(instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced)) && !resolutionObject.effectSilenced){
								scr_increase_stat_player(player, PlayerMomentum, 1);
							}
							NextEffect
						break;
					}					
				}
			}
		],
		
		Sprites: [
			sprite_get_name(spr_motorshowman) //asset_get_index()
		],
		
		Texts: {
			EffectText: macros.origText[cardNum,  TextEffect],
			FlavorText: macros.origText[cardNum,  TextFlavor]
		},
	}
	var file = file_text_open_write("newDatabase");
	file_text_write_string(file, json_stringify(tempCardObject.Effects[0].Effect));
	file_text_close(file);
}