#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

switch(__GETC__(life_coplevel)) do
		{
			case 1: {life_paycheck = 10000;};
			case 2: {life_paycheck = 12500;};
			case 3: {life_paycheck = 15000;};
			case 4: {life_paycheck = 17500;};
			case 5: {life_paycheck = 20000;};
			case 6: {life_paycheck = 22500;};
			case 7: {life_paycheck = 25000;};
			default { life_paycheck = 10000; };
		};

if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};

player setVariable["rank",(__GETC__(life_coplevel)),true];

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

player addRating 9999999;
[[getPlayerUID player],"TON_fnc_loadBounties",false,false] spawn life_fnc_MP;