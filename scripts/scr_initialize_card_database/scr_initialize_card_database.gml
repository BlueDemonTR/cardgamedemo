function DatabaseCard(pullObject) constructor{
	cardName = pullObject.cardName
	cardType = pullObject.cardType
	cardSuperType = pullObject.cardSuperType
	
}

function scr_initialize_card_database(){
	//Placeholder code, it will take it from the server in the release version
	{
		pulledCardDatabase = [
		
		]	
	}
	totalCardCount = 0;
	cardDatabase = [];
	
	array_push(
		cardDatabase,
		new OriginalCard(
			"Motorbiker Showman", 
			cardMainType.Monster, 
			cardSuperType.NormalMonster, 
			{ MaxHP : 1, Level : 2, ATK : 2 }, 
			[],
			[SpiritList.Aggressive], 
			[Archetype.Motorbiker],  
			[SharedEffect.Motorbiker], 
			RarityList.Common, 
			["Add these by hand sorry"], 
			[ "spr_motorshowman" ], 
			{ CardLore : "The most passionate of the Motorbikers, while he isn't the most skillful because he always stands with the Leaders most people think of him when they think of the Motorbikers", EffectText : "After this card has attacked: gain 1 Momentum." }
		)
	)
}
