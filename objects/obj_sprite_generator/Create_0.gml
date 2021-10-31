spiritColorArr[SpiritBlank] = $ae2676
spiritColorArr[SpiritAggressive] = $0000ac
spiritColorArr[SpiritPassive] = $ff8a00
spiritColorArr[SpiritNoble] = $00a4a6
spiritColorArr[SpiritMalicious] = $670068
spiritColorArr[SpiritKind] = $670068
spiritColorArr[SpiritPassionate] = $9e6eff

cardType = get_integer("Type of card to create?", 1);
cardNum = get_integer("Give CardNum",1)
//surface = surface_create(550, 800)
//surface_set_target(surface)
artwork = sprite_add(get_open_filename("*.png", ""), 1, true, false, 0, 0)
