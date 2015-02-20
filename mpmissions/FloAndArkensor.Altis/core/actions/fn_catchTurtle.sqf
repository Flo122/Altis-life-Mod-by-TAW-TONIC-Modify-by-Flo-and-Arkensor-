/*
	File: fn_catchTurtle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a dead turtle?
*/
private["_obj"];
_obj = cursorTarget;
if(isNull _obj) exitWith {}; //Not valid
if(alive _obj) exitWith {}; //It's alive, don't take it charlie!
if (player distance (getMarkerPos "turtle_1") > 1260) exitWith {hint "Du solltest Schildkröten nur in den dafür vorgesehenen Zonen Fangen."};

if(([true,"turtle",1] call life_fnc_handleInv)) then
{
	deleteVehicle _obj;
	titleText[localize "STR_NOTF_CaughtTurtle","PLAIN"];
};