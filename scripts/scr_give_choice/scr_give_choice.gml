function scr_give_choice(arrayPos, choicesArray){
	//Choice Array Must Be 2D
	//[choiceNum, choiceText]

	for(var i = 0; i < array_length(choicesArray); i++){
		choiceObject[i] = instance_create_layer(room_width/2,room_height/2+(40*i),"UpperInstances",obj_activation_box);
		with(choiceObject[i]){
			depth = -1000
			activation_mode = FunctionChoices;
			choiceNum = choicesArray[i,0];
			choiceText = choicesArray[i,1];
			self.arrayPos = arrayPos;
			bar_number = i;
		}
	}
}
