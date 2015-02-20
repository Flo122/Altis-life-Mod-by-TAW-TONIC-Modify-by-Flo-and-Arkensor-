/*
	File: fn_tracker.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Attaches a tracking device to a vehicle.
*/
private["_unit","_markers","_vehicleName"];
_unit = cursorTarget;

if((!(_unit isKindOf "LandVehicle"))&&(!(_unit getVariable ["restrained",false]))) exitWith {hint "Du kannst keine Wanze anbringen."};
if(player distance _unit > 7) exitWith {hint "Du musst unter 7m sein!"};
if(_unit in life_tracked) exitWith {hint "Du verfolgst dieses Fahrzeug schon!"};
if(!([false,"tracker",1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;

life_action_inUse = true;

player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 4.5;
waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};

life_action_inUse = false;
if(player distance _unit > 7) exitWith {titleText["Du bist nicht in Reichweite!","PLAIN"];};

life_tracked set [count life_tracked, _unit];
titleText["Du hast eine Wanze an dem Fahrzeug angebracht.","PLAIN"];

while {true} do
{
	waitUntil {visibleMap};
	_markers = [];

	{
		if(!isNil "_x") then
		{
			if(!isNull _x) then
			{
				_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
				_marker = createMarkerLocal [format["%1_marker",_x],getPos _x];
				_marker setMarkerColorLocal "ColorGreen";
				_marker setMarkerTypeLocal "Mil_destroy";
				_marker setMarkerTextLocal format["%1", _vehicleName];
				_markers set[count _markers,[_marker,_x]];
			};
		};
	} foreach life_tracked;
			
	while {visibleMap} do
	{
		{
			private["_marker","_veh"];
			_marker = _x select 0;
			_veh = _x select 1;
			if(!isNil "_veh") then
			{
				if(!isNull _veh) then
				{
					_marker setMarkerPosLocal (getPos _veh);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 1;
	};
	
	{deleteMarkerLocal (_x select 0);} foreach _markers;
};