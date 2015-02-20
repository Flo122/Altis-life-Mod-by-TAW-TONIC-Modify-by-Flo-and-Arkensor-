#include <macro.h>
/*
	File: fn_actionPickup.sqf
	Author: Arkensor
	
	Description:
	handles requests for picking up various items
*/
private["_curTarget"];
_curTarget = cursorTarget;
if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(life_interrupted) exitWith {life_interrupted = false;};

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
life_action_inUse = true;


	//OK, it wasn't a player so what is it?
	private["_miscItems","_money"];
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_money = "Land_Money_F";

			//OK, it wasn't a vehicle so let's see what else it could be?
			if(!(player getVariable["restrained",false]) && (typeOf _curTarget) in _miscItems) then {
				//OK, it was a misc item (food,water,etc).
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_pickupItem;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			} else {
				//It wasn't a misc item so is it money?
				if(!(player getVariable["restrained",false]) && (typeOf _curTarget) == _money && {!(_curTarget getVariable["inUse",false])}) then {
					private["_handle"];
					_curTarget setVariable["inUse",TRUE,TRUE];
					_handle = [_curTarget] spawn life_fnc_pickupMoney;
					waitUntil {scriptDone _handle};
					life_action_inUse = false;
				};
			};