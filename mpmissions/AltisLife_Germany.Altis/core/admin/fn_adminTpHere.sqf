#include <macro.h>
/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991
	
	Description:
	Teleport selected player to you.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

_target setPos (getPos player);
hint format["You have teleported %1 to your location",_target getVariable["realname",name _target]];
[0,format["Admin %1 hat %2 zu sich geportet",_target getVariable["realname",name _target]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;