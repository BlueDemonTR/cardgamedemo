// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_update_infirmary(){
	obj_infirmary.infirmaryShown = json_parse(json_stringify(obj_player.infirmary))
	obj_infirmary.infirmaryShownCount = obj_player.infirmaryCount
}