draw_sprite_stretched(macros.sprite_array[cardNum,artNum],-1,x-card_width/2,y-card_height/2,card_width,card_height);

draw_set_color(c_black)
if(cardStat[StatHP] < cardStat[StatMaxHP]){
	draw_text_color(x+50,y+14,string(cardStat[StatHP]),c_yellow,c_yellow,c_yellow,c_yellow,1);
}else{
	draw_text_color(x+50,y+14,string(cardStat[StatHP]),c_green,c_green,c_green,c_green,1);
}
draw_text_color(x-60,y+14,string(cardStat[StatATK]),c_red,c_red,c_red,c_red,1);
draw_text(x+45,y-100,string(cardStat[StatLevel]));
if(cardStatus[StatusSilenced]){
	draw_sprite_stretched(spr_silenced,-1,x-card_width/2,y-card_height/2,card_width,card_height);
}

if(cardcan_attack && !cardStatus[StatusUnarmed] && !cardStatus[StatusParalyzed] && player.turn_count != 1){
	draw_sprite_stretched(spr_attack,-1,x-card_width/2,y-card_height/2,card_width,card_height);
}
i=0
if(cardStatus[StatusTAUNT]){
	stateList[i++] = spr_taunt;
}
if(cardStatus[StatusPierce]){
	stateList[i++] = spr_pierce;
}
if(cardStatus[StatusRebellious]){
	stateList[i++] = spr_rebellious;
}
if(cardStatus[StatusImmune]){
	stateList[i++] = spr_unaffected;
}
if(cardStatus[StatusIndestructable]){
	stateList[i++] = spr_indestructable;
}
if(cardStatus[StatusLifesteal]){
	stateList[i++] = spr_lifesteal;
}
if(cardStatus[StatusSneaky]){
	stateList[i++] = spr_sneaky;
}
if(cardStatus[StatusUnarmed]){
	stateList[i++] = spr_unarmed;
}
if(cardStatus[StatusRanged]){
	stateList[i++] = spr_ranged;
}
if(cardStatus[StatusParalyzed]){
	stateList[i++] = spr_paralzyed;
}
if(cardStatus[StatusPoison]){
	stateList[i++] = spr_poison;
}

for(j=0;j < i; j++){
	temp1 = int64(j/3)
	temp2 = j mod 3
	draw_sprite_ext(stateList[j],-1,x-65+(30*temp2),(y-70)+(temp1*30),sprite_to_small,sprite_to_small,0,c_white,1);
}
stateList = noone
i=0
if(cardStat[StatDodge] > 0){
	stateList[i,0] = spr_dodge
	stateList[i++,1] = cardStat[StatDodge]
}
if(cardStat[StatRegeneration] > 0){
	stateList[i,0] = spr_regerenation
	stateList[i++,1] = cardStat[StatRegeneration]
	
}
if(cardStat[StatArmor] > 0){
	stateList[i,0] = spr_armor
	stateList[i++,1] = cardStat[StatArmor]
}
draw_set_color(c_blue)
for(j=0; j < i; j++){
	draw_sprite_ext(stateList[j,0],-1,(x-36)+(j*30),y+20,sprite_to_small,sprite_to_small,0,c_white,1)
	draw_text((x-46)+(j*30),y+20,stateList[j,1])
}
draw_set_color(c_gray)
draw_text(x,y,cardStat)
