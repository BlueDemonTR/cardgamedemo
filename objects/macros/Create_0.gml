//Game Properties
randomize();
persistent = true;
test_mode=true;
show_debug_message(GM_version)

//Card Data Macros

//Infirmary Send Types
#macro SendInjuries 0
#macro SendDestroy 1
#macro SendSacrifice 2
#macro SendMaterial 3
#macro SendDiscard 4
#macro SendMill 5
#macro SendInvalid 99

temp1 = bool(array_length([0]))

if(temp1){

}

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

//Type Properties
#macro TypeInvalid -1
#macro TypeMonster 0
#macro TypeMomentum 1
#macro TypeSpell 2

//Stat Properties
#macro StatLevel 0
#macro StatATK 1
#macro StatMaxHP 2
#macro StatHP 3
#macro StatArmor 4
#macro StatRegeneration 5
#macro StatDodge 6
#macro StatSpirit 7
#macro StatXPerTurn 8

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
scr_initialize_archetypes();

//Shared Effect Properties
#macro SharedMotorbiker 1
#macro SharedMotorbikerLeader 2
#macro SharedVisclades 3
#macro SharedUnderworldVisclades 4
#macro SharedIgloo 5
#macro SharedSacrifice 6
#macro SharedXMakine 7
scr_initialize_shared_effects();

//Status Properties
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

//Spirit Properties
#macro SpiritAggressive 1
#macro SpiritPassive 2
#macro SpiritNoble 3
#macro SpiritMalicious 4
#macro SpiritKind 5
#macro SpiritPassionate 6

//Text Properties
#macro TextEffect 0
#macro TextFlavor 1
#macro TextMaterials 2
#macro TextChant 3

//Shortcuts
#macro NextStep resolvingPile[positionInOrder,2]++
#macro FinishResolving resolvingPile[positionInOrder,2] = 98