// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_search_reset(){
	with(main){
		scr_filter_words(filterText)
		with(obj_card_selector){
			listPos = listNum
			cardNum = main.filtered_cards[listPos]
			artNum = 0
		}
	}
}