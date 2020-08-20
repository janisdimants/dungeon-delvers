///scr_round_to_decimal(number_to_round, decimal)

var n = argument[0];
var roundTo = argument[1];

return round(n * (1/roundTo)) / (1/roundTo);
