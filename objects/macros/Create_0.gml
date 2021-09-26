#macro card_width 140
#macro card_height 205
#macro small_card_width 110
#macro small_card_height 160
#macro big_card_width 250
#macro big_card_height 364
#macro sprite_to_small .25625
#macro sprite_to_big .455
#macro handSizeLimit 7
persistent = true;
scr_initialize_cards();
scr_init_sprite_array()
scr_initialize_momentum_wheel();
scr_illegal_cards();
scr_initialize_statuses()
scr_initialize_shared_effects();
scr_initialize_archetypes();
scr_initialize_momentum_wheel();
randomize()
show_debug_message(GM_version)
//don't set it to true in online
test_mode=true;
global.drawing_card = false;
global.selectedTextBox = ""