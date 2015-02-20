/*
	File: fn_ASFLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player forceAddUniform "U_B_CombatUniform_mcam_vest";
player addVest "V_Rangemaster_belt";
player addBackpack "B_Carryall_oli";
player addItem "ToolKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";

player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio"; 

[] call life_fnc_updateClothing;
[] call life_fnc_saveGear;