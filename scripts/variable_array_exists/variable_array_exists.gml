// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function variable_array_exists(_array, _x, _y) {
  if (array_length(_array) <= _x) return false;
  if (array_length(_array[_x]) <= _y || array_length(_array[_x]) == undefined) return false;
  return true;
}