for(i = 0; i < 50; i++){
	if(match_array[i, 0] == -1 && match_array[i, 0] == -1 && match_array[i, 2]){
		match_array[i,2] = false;
	}

}

match_count= 0;
for(i=0; i < 50; i++){
	if(match_array[i, 0] != -1 || match_array[i, 1] != -1){
		match_count++;
	}
}