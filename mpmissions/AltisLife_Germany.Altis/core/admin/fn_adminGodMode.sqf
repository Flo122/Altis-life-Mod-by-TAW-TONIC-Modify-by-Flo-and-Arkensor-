#include <macro.h>
/*
	File: fn_adminGodMode.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
 
	Description: Enables God mode for Admin
*/

if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};
 
if(life_god) then {
	life_god = false;
	titleText ["God mode disabled","PLAIN"]; titleFadeOut 2;
	[[0,format["Admin %1 hat Godmode ausgemacht",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
	player allowDamage true;
} else {
	life_god = true;
	titleText ["God mode enabled","PLAIN"]; titleFadeOut 2;
	[[0,format["Admin %1 hat Godmode angemacht",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
	player allowDamage false;
}; 