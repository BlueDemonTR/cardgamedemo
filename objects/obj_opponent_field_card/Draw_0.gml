draw_set_color(c_black)
draw_sprite_ext(macros.sprite_array[cardNum,artNum],-1,x,y,sprite_to_small,card_height/800,180,c_white,1);

if(cardStat[3] < cardStat[2]){
	draw_text_color(x-60,y-44,string(cardStat[3]),c_yellow,c_yellow,c_yellow,c_yellow,1);
}else{
	draw_text_color(x-60,y-44,string(cardStat[3]),c_green,c_green,c_green,c_green,1);
}
draw_text_color(x+50,y-44,string(cardStat[1]),c_red,c_red,c_red,c_red,1);
draw_text(x-60,y+75,string(cardStat[0]));

if(cardStatus[11]){
	draw_sprite_stretched(spr_silenced,-1,x-card_width/2,y-card_height/2,card_width,card_height);
}

if(cardcan_attack && !cardStatus[7] && !cardStatus[9] && obj_player.turn_count != 1){
	draw_sprite_ext(spr_attack,-1,x+card_width/2,y+card_height/2,sprite_to_small,sprite_to_small,180,c_white,1);
}

var i = 0
if(cardStatus[0]){
	stateList[i++] = spr_taunt;
}
if(cardStatus[1]){
	stateList[i++] = spr_pierce;
}
if(cardStatus[2]){
	stateList[i++] = spr_rebellious;
}
if(cardStatus[3]){
	stateList[i++] = spr_unaffected;
}
if(cardStatus[4]){
	stateList[i++] = spr_indestructable;
}
if(cardStatus[5]){
	stateList[i++] = spr_lifesteal;
}
if(cardStatus[6]){
	stateList[i++] = spr_sneaky;
}
if(cardStatus[7]){
	stateList[i++] = spr_unarmed;
}
if(cardStatus[8]){
	stateList[i++] = spr_ranged;
}
if(cardStatus[9]){
	stateList[i++] = spr_paralzyed;
}
if(cardStatus[10]){
	stateList[i++] = spr_poison;
}

for(var j=0;j < i; j++){
	temp1 = int64(j/3)
	temp2 = j mod 3
	draw_sprite_ext(stateList[j],-1,x-65+(30*temp2),(y-70)+(temp1*30),sprite_to_small,sprite_to_small,180,c_white,1);
}
stateList = noone
i=0
if(cardStat[6] > 0){
	stateList[i,0] = spr_dodge
	stateList[i++,1] = cardStat[6]
}
if(cardStat[5] > 0){
	stateList[i,0] = spr_regerenation
	stateList[i++,1] = cardStat[5]
	
}
if(cardStat[4] > 0){
	stateList[i,0] = spr_armor
	stateList[i++,1] = cardStat[4]
}
draw_set_color(c_blue)
for(j=0; j < i; j++){
	draw_sprite_ext(stateList[j,0],-1,(x-36)+(j*30),y+20,sprite_to_small,sprite_to_small,180,c_white,1)
	draw_text((x-46)+(j*30),y+20,stateList[j,1])
}
draw_set_color(c_gray)
draw_text(x,y,cardStat)