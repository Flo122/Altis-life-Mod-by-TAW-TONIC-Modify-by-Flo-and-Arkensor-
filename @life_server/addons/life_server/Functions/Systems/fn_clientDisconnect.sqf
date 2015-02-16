/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When a client disconnects this will remove their corpse and
	clean up their storage boxes in their house.
*/
private["_unit","_id","_uid","_name","_pid"];
_unit = _this select 0;
_id = _this select 1;
_uid = _this select 2;
_name = _this select 3;
if(isNull _unit) exitWith {};

{
	_pid = _x getVariable["steam64ID",""];
	
	if(_uid == _pid OR _pid == "" OR owner _x < 3) then {
		_containers = nearestObjects[_x,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
		{deleteVehicle _x;} foreach _containers; //Delete the containers.
		deleteVehicle _x; //Get rid of the corpse.
	}
} foreach allDeadMen;

{
	_pid = _x getVariable["steam64ID",""];
	
	if(_uid == _pid OR _pid == "" OR owner _x < 3) then {
		_containers = nearestObjects[_x,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
		{deleteVehicle _x;} foreach _containers; //Delete the containers.
		deleteVehicle _x; //Get rid of the corpse.
	}
} foreach playableUnits;

_uid spawn TON_fnc_houseCleanup;