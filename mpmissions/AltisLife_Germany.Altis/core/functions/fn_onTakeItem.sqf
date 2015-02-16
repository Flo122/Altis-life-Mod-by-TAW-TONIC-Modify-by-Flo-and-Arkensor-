/*
	File: fn_onTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blocks the unit from taking something they should not have.
*/
private["_unit","_item"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?

[] call life_fnc_updateClothing;

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		// medic
		if (backpack player == "B_Kitbag_sgg ") then { _load = 40; };
		// civs
		if (backpack player == "B_AssaultPack_cbr") then { _load = 25; };		
		if (backpack player == "B_TacticalPack_oli") then { _load = 30; };
		if (backpack player == "B_FieldPack_ocamo") then { _load = 35; };
		if (backpack player == "B_Bergen_sgg") then { _load = 40; };
		if (backpack player == "B_Kitbag_cbr") then { _load = 45; };
		if (backpack player == "B_Kitbag_mcamo") then { _load = 45; };
		if (backpack player == "B_Carryall_oli") then { _load = 60; };
		if (backpack player == "B_Carryall_khk") then { _load = 60; };
		// cops	
		if (backpack player == "B_Carryall_mcamo") then { _load = 50; };
		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};

[] spawn
{
	while {true} do
	{
		sleep 1.5;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint localize "STR_NOTF_MaxWeight";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};