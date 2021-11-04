var ownerObject = self;

with(obj_activation_box){
	if(self.ownerObject != ownerObject){
		instance_destroy();
	}
}

selected = false;