function variable_array_exists(_array, _x, _y) {
	if (is_array(_array)) return false;
	if (array_length(_array) <= _x) return false;
	if (array_length(_array[_x]) <= _y || array_length(_array[_x]) == undefined) return false;
	if (_array[_x,_y] == 0){return false} 
	return true;
}