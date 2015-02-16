/*
	File: fn_robAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the robbing process?
*/
private["_target"];
_target = cursorTarget;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

if("ItemRadio" in assignedItems cursorTarget) then {
cursorTarget removeweapon "ItemRadio";
hint "Ein Smartphone ist auf den Boden gefallen";
_defenceplace1 = "Item_ItemRadio" createVehicle (player modelToWorld[0,0,0]);
} else { hint "Die Person hat kein Smartphone!"};