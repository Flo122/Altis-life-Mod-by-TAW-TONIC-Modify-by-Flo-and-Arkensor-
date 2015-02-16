/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > life_atmcash_pirates) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && life_atmcash_pirates > 999999) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

life_cash_pirates = life_cash_pirates + _val;
life_atmcash_pirates = life_atmcash_pirates - _val;
hint format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText];
[[format ["%1 hat %2 von seinem Konto abgehoben",player getVariable["realname",name player],[_val] call life_fnc_numberText]],"Arma3Log",false,false] call life_fnc_MP;
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;