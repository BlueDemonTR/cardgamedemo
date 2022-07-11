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
			({ 
				MaxHP : 1,
				Level : 2,
				ATK : 2
			}),
			[],
			[SpiritList.Passionate], 
			[Archetype.Motorbiker],  
			[SharedEffect.Motorbiker], 
			RarityList.Common, 
			([
				{
					EffectTrigger: ["DIRECT_ATTACK"],
					ActivationCondition: function(cardObject){
						if(cardObject.getStat("Silenced")) return false
						
						return true
					},
					Effect: [
						[
							["INCREASE_PLAYER_STAT", { target: "OWNER", stat: "MOMENTUM", amount: 1 }],
							["RESOLVE"]
						]
					]
				}
			]), 
			["spr_motorshowman"], 
			({ 
				CardLore: "The most passionate of the Motorbikers, while he isn't the most skillful because he always stands with the Leaders most people think of him when they think of the Motorbikers", 
				EffectText: [{ text: "After this card has attacked directly: gain 1 " }, { text: "Momentum", hoverText: "$momentum" }]
			})
		),
		new OriginalCard(
			"Motorbiker V-Rider",
			cardMainType.Monster,
			cardSuperType.NormalMonster,
			({
				MaxHP: 1,
				Level: 2,
				ATK: 2
			}),
			[],
			[SpiritList.Aggressive],
			[Archetype.Motorbiker],
			[SharedEffect.Motorbiker],
			RarityList.Common,
			([
				{
					EffectTrigger: ["SUMMON"],
					ActivationCondition: function(cardObject){
						if(cardObject.getStat("Silenced")) return false
						
						return true
					},
					Effect: [
						[
							[
								"FOR_EACH_ALLY_MONSTER", 
								{	
									condition: function(cardObject){
										if(cardObject.checkArchetype(Archetype.Motorbiker)) return true
										
										return false
									},
									effect: [
										["INCREASE_STAT_CARD", { target: "$TARGET_CARD", stat: "ATK", amount: 1 }]
									]
								}
							],
							["RESOLVE"]
						]
					]
				}
			]),
			["spr_motorvrider"],
			[{
				EffectText: [{ text: "Summoned: ", hoverText: "$summon" }, { text: "all ally" }, { text: "Motorbiker monsters", hoverLink: "MOTORBIKER_ARCHETYPE" }, { text: " you control gain +1 ATK." }]
			}]
		),
		new OriginalCard(
			"Motorbiker Protector",
			cardMainType.Monster,
			cardSuperType.NormalMonster,
			{
				Level: 4,
				ATK: 1,
				MaxHP: 3
			},
			[Archetype.Motorbiker],
			[],
			RarityList.Rare,
			([
				{
					EffectTrigger: ["IGNITION"],
					ActivationCondition: function(cardObject){
						if (!scr_count_field_filter(cardObject, function(cardObject){ 
							if(cardObject.controller != obj_player) return false
							if(!cardObject.checkArchetype(Archetype.Motorbiker)) return false
							
							return true
						})) return false
						
						return true
					},
					Effect: [
						[
							["FILTER_TARGETS", {
									saveTo: "target"
									filterFunction: function(cardObject){
										if(cardObject.controller != obj_player) return false
										if(!cardObject.checkArchetype(Archetype.Motorbiker)) return false
							
										return true
									},
									ignore: ["$self"]
								}
							],
							["NEXTSTEP"]
						],
						["Waiting"],
						[
							["GIVE_CHOICE", {
								saveTo: "choice",
								choices: ["Give +1 ATK", "Give +1 Max HP", "Heal by 3", "Give +1 Armor"]
							}],
							["NEXTSTEP"]
						],
						["Waiting"],
						[
							["SWITCH", {
								expression: ["GET_VALUE", "choice"]
								cases: [
									{
										switchCase: "Give +1 ATK",
										effect: [
											["INCREASE_STAT_CARD", { target: "target", stat: "ATK", amount: 1 }]
										]
									},
									{
										switchCase: "Give +1 Max HP",
										effect: [
											["INCREASE_STAT_CARD", { target: "target", stat: "MaxHP", amount: 1 }]
										]
									},
									{
										switchCase: "Heal by 3",
										effect: [
											["HEAL_CARD", { target: "target", amount: 3 }]
										]
									},
									{
										switchCase: "Give +1 Armor",
										effect: [
											["INCREASE_STAT_CARD", { target: "target", stat: "Armor", amount: 1 }]
										]
									}
								]
							}],
							["RESOLVE"]
						]
					]
				}
			])
		)
	)
	
	totalCardCount = cardDatabase.length
}
