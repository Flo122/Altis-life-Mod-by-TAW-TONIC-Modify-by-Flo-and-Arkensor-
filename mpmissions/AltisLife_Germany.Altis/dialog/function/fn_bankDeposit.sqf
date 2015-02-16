/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > life_cash_pirates) exitWith {hint localize "STR_ATM_NotEnoughCash"};

life_cash_pirates = life_cash_pirates - _value;
life_atmcash_pirates = life_atmcash_pirates + _value;

hint format[localize "STR_ATM_DepositMSG",[_value] call life_fnc_numberText];
[[format ["%1 hat %2 auf sein Konto eingezahlt",player getVariable["realname",name player],[_value] call life_fnc_numberText]],"Arma3Log",false,false] call life_fnc_MP;
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;