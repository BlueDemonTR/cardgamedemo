spiritColorArr[SpiritBlank] = $ae2676
spiritColorArr[SpiritAggressive] = $0000ac
spiritColorArr[SpiritPassive] = $ff8a00
spiritColorArr[SpiritNoble] = $00a4a6
spiritColorArr[SpiritMalicious] = $670068
spiritColorArr[SpiritKind] = $670068
spiritColorArr[SpiritPassionate] = $9e6eff

spr_newcard = noone

cardType = get_integer("Type of card to create?", 1);
cardNum = get_integer("Give CardNum",1)

surface = surface_create(1024, 1024);
surface_set_target(surface);
draw_clear_alpha(c_black, 0);
surface_reset_target();
view_surface_id[0] = surface;

artwork = sprite_add(get_open_filename("*.png", ""), 1, false, false, 0, 0)
size = 1
angle = 0