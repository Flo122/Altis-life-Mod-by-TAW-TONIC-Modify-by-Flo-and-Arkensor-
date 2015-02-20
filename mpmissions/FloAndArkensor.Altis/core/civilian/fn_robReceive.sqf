/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cash"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
if(_cash == 0) exitWith {titleText[localize "STR_Civ_RobFail","PLAIN"]};

life_cash_pirates = life_cash_pirates + _cash;
titleText[format[localize "STR_Civ_Robbed",[_cash] call life_fnc_numberText],"PLAIN"];
// Sync life_cash_pirates to DB:
[[getPlayerUID player,playerSide,life_cash_pirates,0],"DB_fnc_updatePartial",false,false] spawn life_fnc_MP;

// Sync life_atmcash_pirates to DB:
[[getPlayerUID player,playerSide,life_atmcash_pirates,1],"DB_fnc_updatePartial",false,false] spawn life_fnc_MP