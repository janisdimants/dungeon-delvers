/// @description scr_round_to_decimal(number_to_round, decimal)
/// @param number_to_round
/// @param  decimal
function scr_round_to_decimal() {

	var n = argument[0];
	var roundTo = argument[1];

	return round(n * (1/roundTo)) / (1/roundTo);



}
