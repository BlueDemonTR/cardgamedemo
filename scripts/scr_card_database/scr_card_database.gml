function OriginalCard(
	cardName = "Void", 
	cardType = cardMainType.Monster,
	superType = cardSuperType.NormalMonster,
	Stats = {},
	Statuses = [],
	Spirits = [],
	Archetypes = [],
	SharedEffects = [],
	Rarity = RarityList.Common,
	Effects = [],
	Sprites = [spr_monster_default],
	Texts = {
		EffectText: ""
	}
) constructor {
	self.cardName = cardName;
	self.cardType = cardType;
	self.superType = superType;
	self.Stats = Stats;
	self.Statuses = Statuses;
	self.Archetypes = Archetypes;
	self.SharedEffects = SharedEffects;
	self.Rarity = Rarity;
	self.Spirits = Spirits;
	self.Effects = Effects;
	self.Texts = Texts;
	
	for(var i = 0; i < 0; i++){
		self.Sprites[i] = asset_get_index(Sprites[i])
	}
	
	function getStat(stat) {
		if(variable_struct_exists(Stats, stat)) {
			return variable_struct_get(Stats, stat);
		} else {
			return //Make an object for default stats
		}
			
	}
}

function scr_card_database(){
	cardDatabase = [];
	
	array_push(
		cardDatabase,
		new OriginalCard(
			"Reflection", 
			cardMainType.Monster, 
			cardSuperType.NormalMonster, 
			{ MaxHP : 1, Level : 4, ATK : 1 }, 
			[],
			[SpiritList.Passive], 
			[],  
			[], 
			RarityList.Common, 
			["Add these by hand sorry"], 
			[ "spr_reflection" ], 
			{ CardLore : "", EffectText : "Destroyed: Deal 3 Damage to both players" }
		)
	)
}


