/*
	Author: Arkensor
	
	Description:
	If the Alarm is being turned off
*/
private["_building"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_building setVariable["HouseRob",false,true];
deleteMarkerLocal "HouseMarker";