// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function indexify(input){
	if(is_array(input)){
		var indexifiedArray = [];
		for(var i = 0; i < array_length(input); i++){
			array_push(indexifiedArray, instance_exists(input[i]) ? input[i].object_index : input[i])
		}
		return indexifiedArray;
	}
	return instance_exists(input) ? input.object_index : input
}