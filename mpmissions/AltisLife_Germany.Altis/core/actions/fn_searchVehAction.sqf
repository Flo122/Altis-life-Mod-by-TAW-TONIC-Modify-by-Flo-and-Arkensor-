/*
	File: fn_searchVehAction.sqf
*/
private["_vehicle","_data"];
_vehicle = cursorTarget;
if((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship")) then
{
	_owners = _vehicle getVariable "vehicle_info_owners";
	if(isNil {_owners}) exitWith {hint localize "STR_NOTF_VehCheat";};
	life_action_inUse = true;
	hint localize "STR_NOTF_Searching";
	sleep 3;
	life_action_inUse = false;
	if(player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {hint localize "STR_NOTF_SearchVehFail";};
	//_inventory = [(_vehicle getVariable "vehicle_info_inv")] call fnc_veh_inv;
	//if(isNil {_inventory}) then {_inventory = "Keine Ladung."};
	_owners = [_owners] call life_fnc_vehicleOwners;
	
	if(_owners == "any") then
	{
		_owners = "Kein Besitzer, nicht beschlagnahmen!<br/>";
	};
	hint parseText format["<t color='#FF0000'><t size='2'>Fahrzeuginfo</t></t><br/><t color='#FFD700'><t size='1.5'>Besitzer</t></t><br/> %1",_owners];
};