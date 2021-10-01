
if(!player.mid_effect && player.main_phase){
	var infirmaryPos = self.infirmaryPos,
	i=0;
	if(!cardStatus[StatusSilenced] && !opt_used && scr_legal_activation(cardNum) && scr_card_hopt(cardNum)){
		activation[i] = instance_create_depth(x,y,depth-1,obj_activation_box);
		with(activation[i]){
			activation_mode="Infirmary Effect";
			origin_card_location=infirmaryPos;
			bar_number=i
			y -= (40*bar_number);
		}
		i++
	}

}