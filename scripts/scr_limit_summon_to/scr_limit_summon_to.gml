function scr_limit_summon_to(argument0, argument1) {
	var
	archetype1 = argument0,
	archetype2 =argument1;
	with(player){
		limitationExists = true;

		limitSummonsTo[limitSummonsToCount, 0] = archetype1;
		limitSummonsTo[limitSummonsToCount, 1] = archetype2;

		limitSummonsToCount++;
	}


}
