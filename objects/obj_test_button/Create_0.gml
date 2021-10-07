test_mode = ""

instance_create_depth(x,y,-1,obj_dummy_opponent)

var i=0;
field_card_zone_x[i] = 815;
field_card_zone_y[i++] = 747;
field_card_zone_x[i] = 962;
field_card_zone_y[i++] = 747;
field_card_zone_x[i] = 1104;
field_card_zone_y[i++] = 747;
field_card_zone_x[i] = 1248;
field_card_zone_y[i++] = 747;
field_card_zone_x[i] = 1033;
field_card_zone_y[i++] = 540;
field_zone_count = i;

i=0
field[i, CardNumber] = 1;
field[i++,1] = 0;
field[i, CardNumber] = 2;
field[i++,1] = 0;
field[i, CardNumber] = 2;
field[i++,1] = 0;
field[i, CardNumber] = 1;
field[i++,1] = 0;