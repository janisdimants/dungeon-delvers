/// @description chance(percentage)
/// @param percentage
function chance() {
	// rolls random chance and returns bool result

	var _chance = argument[0];

	var _rolled = random(1);

	return (_rolled <= _chance);



}
