#include <macro.h>
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater"];
_curTarget = cursorTarget;
if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(life_interrupted) exitWith {life_interrupted = false;};
_isWater = surfaceIsWater (getPosASL player);
if(isNull _curTarget) then {
	if(_isWater) then {
		private["_fish"];
		_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") exitWith {[_fish] call life_fnc_catchFish;};
	} else {
		if(playerSide == civilian) exitWith {[] call life_fnc_gather;};
	};
};

if(playerSide != independent && _curTarget isKindOf "House_F" && {player distance _curTarget < 12} OR ((nearestObject [[16750.6,13640.9,0],"Land_Dome_Small_F"]) == _curTarget OR (nearestObject [[16750.6,13640.9,0],"Land_Research_house_V1_F"]) == _curTarget)) exitWith {
	if(playerSide == west) then
				{
					[_curTarget] call life_fnc_HInteraction_cop;	
				}
				else
				{
					[_curTarget] call life_fnc_HInteraction_civ;	
				};
};

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
life_action_inUse = true;

//Temp fail safe.
[] spawn {
	sleep 60;
	life_action_inUse = false;
};

//Check if it's a dead body.
if(_curTarget isKindOf "Man" && {!alive _curTarget} && {playerSide == independent}) exitWith {
	//Hotfix code by Arkensor
	if(playerSide == independent) then {
		[_curTarget] call life_fnc_revivePlayer;
	};
};


//If target is a player then check if we can use the cop menu.
if(isPlayer _curTarget && _curTarget isKindOf "Man") then {
	if(!(player getVariable["restrained",false]) && (animationState cursorTarget=="amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon" or _curTarget getVariable["restrained",false]) && !dialog && playerSide == west) then {
		[_curTarget] call life_fnc_copInteractionMenu;
	};
	if(!(player getVariable["restrained",false]) && (_curTarget getVariable["restrained",false]) && !dialog && (playerSide == civilian or playerSide == east) ) then {
	[_curTarget] call life_fnc_civInteractionMenu;
	};
}
else 
{
	//OK, it wasn't a player so what is it?
	private["_isVehicle","_miscItems","_money"];
	_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];
	_money = "Land_Money_F";
	
	//It's a vehicle! open the vehicle interaction key!
	if(_isVehicle) then 
	{
		if(!dialog) then {
			if(player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2) then {				
				if(playerSide == west) then
				{
					[_curTarget] call life_fnc_vInteraction_cop;	
				}
				else
				{
					[_curTarget] call life_fnc_vInteraction_civ;
				};
			};
		};
	} 
	else 
	{
		//Is it a animal type?
		if((typeOf _curTarget) in _animalTypes) then 
		{
			if((typeOf _curTarget) == "Turtle_F" && !alive _curTarget) then 
			{
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_catchTurtle;
				waitUntil {scriptDone _handle};
			} else 
			{
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_catchFish;
				waitUntil {scriptDone _handle};
			};
		}
		else 
		{
			//OK, it wasn't a vehicle so let's see what else it could be?
			if((typeOf _curTarget) in _miscItems) then 
			{
				//OK, it was a misc item (food,water,etc).
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_pickupItem;
				waitUntil {scriptDone _handle};
			}
			else 
			{
				//It wasn't a misc item so is it money?
				if((typeOf _curTarget) == _money) then 
				{
					private["_handle"];
					_handle = [_curTarget] spawn life_fnc_pickupMoney;
					waitUntil {scriptDone _handle};
				}
				else
				{
					life_action_inUse = false; //last action: set false
				};
			};
		};
	};
};


life_action_inUse = false; //Hack Prevention