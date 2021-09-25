function scr_limit_summon_of(argument0, argument1) {
	var
	archetype1 =argument0,
	archetype2 =argument1;
	with(player){
		limitationExists = true;

		limitSummonsOf[limitSummonsOfCount, 0] = archetype1;
		limitSummonsOf[limitSummonsOfCount, 1] = archetype2;

		limitSummonsOfCount++;
	}


}
