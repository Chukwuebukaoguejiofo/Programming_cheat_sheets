<?php

function makeSandwhich($breadType, $meatHandler)
	{
		$meat = 'beef';
		$meatHandler($meat);

		echo $breadType;
		echo $meat;
		echo $breadType;
	}

	$howToCook = 'well Done!';
	makeSandwhich("flat bread\n", function(&$meat)  // in this function I want to work on the variable by reference!
	use($howToCook)
	{
		$meat = "$meat $howToCook\n";
	});
	
	// // result:
    // flat bread
    // beef well Done!
    // flat bread

?>
