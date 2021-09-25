draw_set_font(fnt_big)
draw_sprite(menu_button[0],-1,785,360)
draw_text(805,305,"Start Game")
draw_sprite(menu_button[1],-1,785,450)
draw_text(805,395,"Deck Builder")
draw_sprite(menu_button[2],-1,785,540)
draw_text(805,485,"Options")
draw_sprite(menu_button[3],-1,785,630)
draw_text(805,575,"Exit Game")

if (menuselect != 0){draw_self();}
if (alarm[0] != -1){draw_text(room_width/2-300,200,"PLEASE USE A LEGAL DECK")}
