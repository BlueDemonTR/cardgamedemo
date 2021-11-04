function draw_text_return_height(textX, textY, text, sep, width){
	draw_text_ext(textX, textY, text, sep, width);
	return string_height_ext(text, sep, width);
}