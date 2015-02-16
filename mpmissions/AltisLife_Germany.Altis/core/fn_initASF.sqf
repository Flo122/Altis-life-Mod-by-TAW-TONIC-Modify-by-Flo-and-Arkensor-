#include <macro.h>
/*
	File: fn_initASF.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

	if((__GETC__(life_ASFlevel) < 1) && (__GETC__(life_adminlevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

player addRating 9999999;
[[getPlayerUID player],"TON_fnc_loadBounties",false,false] spawn life_fnc_MP;