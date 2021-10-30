// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_run_animation(animationNum){
	with(instance_create_depth(x,y,depth-1,
	  room_get_name(room) == "room_animation_test" 
	  ? obj_animation_test 
	  : animations )){
		for(var i = 0; i < argument_count; i++){
			animationInfo[i] = argument[i]
		}
		animationCount = i;
	}
}