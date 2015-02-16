#include <macro.h>
/*
	File: fn_adminTeleport.sqf
	Author: ColinM9991
	Credits: To original script author(s)
	Description:
	Teleport to chosen position.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};

tele={
	_pos = [_this select 0, _this select 1, _this select 2];
	(vehicle player) setpos [_pos select 0, _pos select 1, 0];
	onMapSingleClick "";
	openMap [false, false];
	hint "You have teleported to your selected position";
	[[0,format["Admin %1 hat sich Teleportet",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
};
openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call tele";