function scr_give_choice(/*arrayNum, choice1, choice2, choice3...*/) {
	var choice,
	arrayNum = argument[0]
	for(var i = 0; i < argument_count-1; i++){
		choice[i] = argument[i+1];
		choiceObject[i] = instance_create_layer(room_width/2,room_height/2+(40*i),"UpperInstances",obj_activation_box);
		with(choiceObject[i]){
			depth = -1000
			self.effectBelongsTo = effectBelongsTo;
			activation_mode = "Multiple Choices";
			self.choice = choice[i,0];
			self.arrayNum = arrayNum;
			bar_number = i;
		}
	}
}
