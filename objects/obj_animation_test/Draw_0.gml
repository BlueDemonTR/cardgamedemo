if(!runAnimation){return}
switch(animationInfo[0]){
	case 1:
		draw_sprite_ext(macros.sprite_array[cardNum,artNum],-1,x,y,card_width/550,card_height/800,cardAngle,c_white,1)
		draw_sprite_ext(spr_test_x,-1,locationInfo[1,0],locationInfo[1,1],1,1,0,c_white,1)
		if (timer < 5){
			move_towards_point(locationInfo[1,0],locationInfo[1,1],-10/timer^2)
		}else if (timer < 8){
			move_towards_point(locationInfo[1,0],locationInfo[1,1],distance_to_point(locationInfo[1,0],locationInfo[1,1])/7)
		}else if (timer > 15 && timer < 34){
			move_towards_point(locationInfo[0,0],locationInfo[0,1],(distance_to_point(locationInfo[0,0],locationInfo[0,1])/9)+3)
		}else if (timer > 35) {
			instance_destroy()
		}
		timer++
	break;
	case 2:
		if(timer > 40 && timer < 45){
			for(var i = 0; i < materialCount; i++){
				if(materialInfo[i,3] != 0){
					materialInfo[i,3]--
					summonedCardLevel++
				}
			}
			if(summonedCardLevel != macros.origStat[summonedCardNum,0]){
				timer = 0
			}
		}if(timer > 45){
			summonedCardAlpha += 0.2
		}
		
		draw_set_font(fnt_upheaval_giant)
		draw_set_color(c_black)
		draw_sprite(spr_impact_level_display,-1,0,0)
		draw_text(908,110,summonedCardLevel)
		for (var i = 0; i < materialCount; i++){
			if(materialInfo[i,4] < 0){
				materialInfo[i,4] /= 1.1
			}else{
				materialInfo[i,4] /= 1.1
			}
			draw_sprite_ext(macros.sprite_array[materialInfo[i,1],materialInfo[i,2]],-1,room_width/2 +materialInfo[i,4],room_height/2,big_card_width/550,big_card_height/800,0,c_white,1)
			draw_text(room_width/2 +materialInfo[i,5] - string_width(materialInfo[i,3])/2,110,materialInfo[i,3])
		}
		draw_sprite_ext(macros.sprite_array[summonedCardNum,summonedArtNum],-1,room_width/2,room_height/2,big_card_width/550,big_card_height/800,0,c_white,summonedCardAlpha)
		timer++
	break;
}

