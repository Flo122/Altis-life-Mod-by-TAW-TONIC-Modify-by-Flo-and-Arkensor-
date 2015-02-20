/*
	File: fn_trackMarkers.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Marks cops on the map for other cops. Only initalizes when the actual map is open.
*/
private["_markers","_vehicleName"];

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