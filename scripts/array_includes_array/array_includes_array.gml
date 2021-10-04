// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_includes_array(array1, array2){
	if(!is_array(array2)){return false}
	
	for(var i = 0; i < array_length(array2); i++){
		if(array_includes(array1, array2[i])){return true}
	}
	return false
}