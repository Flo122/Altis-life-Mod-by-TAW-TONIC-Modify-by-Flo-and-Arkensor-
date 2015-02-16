/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "No one was selected!";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "Du hast vor kurzem eine Bank ausgeraubt und musst deshalb warten bis du Geld weitergeben kannst.";ctrlShow[2001,true];};
if(!life_use_atm_2) exitWith {hint "Du hast vor kurzem einen Laden ausgeraubt und musst deshalb warten bis du Geld weitergeben kannst.";ctrlShow[2001,true];};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "Bitte nur Zahlen.";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "Du musst eine Summe eingeben.";ctrlShow[2001,true];};
if(parseNumber(_amount) > life_cash_pirates) exitWith {hint "Du hast nicht so viel geld!";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Der Spieler ist nicht in Reichweite";};
hint format["You gave $%1 to %2",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]];
life_cash_pirates = life_cash_pirates - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;
[[_unit,_amount,player],"life_fnc_receiveMoney",_unit,false] spawn life_fnc_MP;
[] call life_fnc_p_updateMenu;

ctrlShow[2001,true];