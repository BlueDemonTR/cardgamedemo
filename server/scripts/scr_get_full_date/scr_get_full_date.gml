// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_full_date(){
	return string(current_day)+"-"+string(current_month)+"-"+string(current_year)+"_"+string(current_hour)+"."+string(current_minute)+"."+string(current_second); 
}