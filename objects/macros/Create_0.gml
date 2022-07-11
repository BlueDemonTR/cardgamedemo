//Game Properties
randomize();
persistent = true;
test_mode = debug_mode || false;
show_debug_message(GM_version)

//Card Types
#macro TypeInvalid -1
#macro TypeMonster 0
#macro TypeMomentum 1
#macro TypeSpell 2
enum cardMainType {Monster, Spell, Invalid}
enum cardSuperType {NormalMonster, NormalSpell, MomentumMonster, Invalid}

//Player Stats
enum playerStat {
	Mana,
	MaxMana,
	Momentum,
	MaxMomentum,
	MaxHP,
	HP
}
#macro PlayerMana 0
#macro PlayerMaxMana 1
#macro PlayerMomentum 2
#macro PlayerMaxMomentum 3
#macro PlayerMaxHP 4
#macro PlayerHP 5
scr_default_stats_player()

//Player Statuses
enum playerStatus {
	LockWheel
}
#macro PlayerLockWheel 0
scr_default_statuses_player()

//Infirmary Send Types
enum sendType {
	Injury,
	Effect,
	Sacrifice,
	Material,
	Discard,
	Mill,
	Invalid = 99
}
#macro SendInjuries 0
#macro SendEffect 1
#macro SendSacrifice 2
#macro SendMaterial 3
#macro SendDiscard 4
#macro SendMill 5
#macro SendInvalid 99
scr_initialize_send_types()

//Sprite Properties
#macro card_width 140
#macro card_height 205
#macro small_card_width 110
#macro small_card_height 160
#macro big_card_width 250
#macro big_card_height 364
#macro sprite_to_small .25625
#macro sprite_to_big .455
scr_init_sprite_array();

//Duel Properties
#macro handSizeLimit 7

//Card Database
scr_initialize_cards();
scr_initialize_momentum_wheel();
scr_illegal_cards();
scr_initialize_card_database();

//Stat Properties
scr_default_stats()
scr_initialize_stats()

//Archetype Properties
#macro ArcMotorbiker 1
#macro ArcMotorbikerLeader 2
#macro ArcVisclades 3
#macro ArcPoleClan 4
#macro ArcIgloo 5
#macro ArcBlizzard 6
#macro ArcSacrifice 7
#macro ArcNightmareBeast 8
#macro ArcFisherman 9
#macro ArcFish 10
#macro ArcXMakine 11
enum Archetype {
	Motorbiker = ArcMotorbiker,
	MotorbikerLeader = ArcMotorbikerLeader,
	Visclades = ArcVisclades,
	PoleClan = ArcPoleClan,
	Igloo = ArcIgloo,
	Blizzard = ArcBlizzard,
	Sacrifice = ArcSacrifice,
	NightmareBeast = ArcNightmareBeast,
	Fisherman = ArcFisherman,
	Fish = ArcFish,
	XMakine = ArcXMakine
}

scr_initialize_archetypes();

//Shared Effect Properties
#macro SharedMotorbiker 1
#macro SharedMotorbikerLeader 2
#macro SharedVisclades 3
#macro SharedUnderworldVisclades 4
#macro SharedIgloo 5
#macro SharedSacrifice 6
#macro SharedXMakine 7
enum SharedEffect {
	Motorbiker = SharedMotorbiker,
	MotorbikerLeader = SharedMotorbikerLeader,
	Visclades = SharedVisclades,
	UnderworldVisclades = SharedUnderworldVisclades,
	Igloo = SharedIgloo,
	Sacrifice = SharedSacrifice,
	XMakine = SharedXMakine
}
scr_initialize_shared_effects();

//Rarity
enum RarityList {
	Common = 10,
	Rare = 50,
	Legendary = 98
}

//Activation Triggers
enum ActivationTriggerList {
	AfterAttack,
	AfterDirectAttack
}

//Status Properties
enum cardStatus {
	Taunt = StatusTAUNT,
	Pierce = StatusPierce,
	Rebellious = StatusRebellious,
	Immune = StatusImmune,
	Indestructable = StatusIndestructable,
	Lifesteal = StatusLifesteal,
	Sneaky = StatusSneaky,
	Unarmed = StatusUnarmed,
	Ranged = StatusRanged,
	Paralyzed = StatusParalyzed,
	Poison = StatusPoison,
	Silenced = StatusSilenced,
	CantAttackDirect = StatusCantAttackDirect,
	SelfDestruct  = StatusSelfDestruct
}
#macro StatusTAUNT 0
#macro StatusPierce 1
#macro StatusRebellious 2
#macro StatusImmune 3
#macro StatusIndestructable 4
#macro StatusLifesteal 5
#macro StatusSneaky 6
#macro StatusUnarmed 7
#macro StatusRanged 8
#macro StatusParalyzed 9
#macro StatusPoison 10
#macro StatusSilenced 11
#macro StatusCantAttackDirect 12
#macro StatusSelfDestruct 13
scr_initialize_statuses();
scr_default_statuses()

//Spirit Properties
enum SpiritList {
	Blank = 0,
	Aggressive = 1,
	Passive = 2,
	Noble= 3,
	Malicious = 4,
	Kind = 5,
	Passionate = 6
}
#macro SpiritBlank 0
#macro SpiritAggressive 1
#macro SpiritPassive 2
#macro SpiritNoble 3
#macro SpiritMalicious 4
#macro SpiritKind 5
#macro SpiritPassionate 6
SpiritNames = ["Blank","Aggressive", "Passive", "Noble", "Malicious","Kind","Passionate"]

//Text Properties
#macro TextEffect 0
#macro TextFlavor 1
#macro TextMaterials 2
#macro TextChant 3
text_count = 4

//Summon Types
#macro SummonMana 0
#macro SummonEffect 1
#macro SummonImpact 2
#macro SummonInvalid 99

//Card Object Selection
#macro TargetMonster 0
#macro TargetZone 1
#macro TargetAttack 2
#macro TargetDirect 3
#macro TargetImpact 4
#macro TargetDiscard 5

//Card Data Selection
#macro SelectDeck 0
#macro SelectInfirmary 1
#macro SelectMomentum 2

//Activation Box Functions
#macro FunctionAttack 0
#macro FunctionSacrifice 1
#macro FunctionFieldEffect 2
#macro FunctionHandEffect 3
#macro FunctionInfirmaryEffect 4
#macro FunctionChoices 5
scr_initialize_activation_box_functions()

//Material Info
#macro InfoLevel "infoLevel"
#macro InfoMainMonsterCount "infoMainMonsterCount" 
#macro InfoKeyMonster "infoKeyMonster"

//Surface Types
#macro SurfaceLegal 0
#macro SurfaceInfirmary 1

//Shortcuts
#macro NextStep resolvingPile[positionInOrder,2]++
#macro FinishResolving resolvingPile[positionInOrder,2] = 98
#macro NextEffect resolvingPile[positionInOrder,2] = 99
#macro color draw_get_color()

str = ""
for(var i = 1; i < total_cards; i++){
	str += getCardFunction(new convertOldCardToNewCard(i)) + "\n\n"
}

clipboard_set_text(str)

//Depth = 1000 {
//	Board Itself, 
//	Background objects
//}
//Depth = 999 - 800 {
//	Deck, 
//	Infirmary, 
//	Momentum Deck
//}
//Depth = 799 - 600 {
//	Momentum Wheel
//}
//Depth = 599 - 400 {
//	Field Card
//}
//Depth = 399 - 200 {
//	Hand Card (In hand)
//}
//Depth = 199 - 100 {
//	Hand Card (Picked Up)
//}
//Depth = 99 - 1 {
//	Shown Lists
//}
//Depth = 0 - -99{
//	Animations
//}


if(false){
	bepis = sprite_to_big//This is here because I am sick of the syntax error pop up
	bepis = SendInvalid
}




