/*
	File: fn_groupBrowser.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fills out the group 'browser' menu with groups.
*/
private["_groups","_dialog","_group","_locked"];
disableSerialization;

waitUntil {!isNull (findDisplay 2520)};
_dialog = findDisplay 2520;
_groups = _dialog displayCtrl 2521;

{
	_group = _x;
	if(!isNull (_group select 1)) then
	{
		if((_group select 2)) then
		{
			_locked = "Locked";
		}
			else
		{
			_locked = "Unlocked";
		};
		
		_groups lbAdd format["%1 [Members: %2] - %3",_group select 0,count (units(_group select 1)),_locked];
		_groups lbSetData [(lbSize _groups)-1,_group select 0];
	};
} foreach (life_group_list);

if(((lbSize _groups)-1) == -1) then
{
	_groups lbAdd "No groups currently created.";
	ctrlShow[2522,false];
};