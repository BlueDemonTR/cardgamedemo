
if(!player.mid_effect && player.main_phase){
	var position = self.position,
	i=0;
	if(cardcan_attack && !cardStatus[StatusUnarmed] && !cardStatus[StatusParalyzed] && player.turn_count != 1){
		activation[i] = instance_create_depth(x,y,depth-1,obj_activation_box);
		with(activation[i]){
			activation_mode="Attack";
			origin_card_location=position;
			bar_number=i;
			y -= (bar_number*40)
		}
		i++
	}
	if(!cardStatus[StatusSilenced] && !opt_used && scr_legal_activation(cardNum) && scr_card_hopt(cardNum)){
		activation[i] = instance_create_depth(x,y,depth-1,obj_activation_box);
		with(activation[i]){
			activation_mode="Effect";
			origin_card_location=position;
			bar_number=i
			y -= (40*bar_number);
		}
		i++
	}
	if(cardis_sacrificable){
		activation[i] = instance_create_depth(x,y,depth-1,obj_activation_box);
		with(activation[i]){
			activation_mode="Sacrifice";
			origin_card_location=position;
			bar_number=i;
			y += 40
		}
		i++
	}
}