/*


	Show vehicle interaction menu
	By ImSorry

*/


private["_display","_curTarget","_bRepair","_bDlc","_bFlip","_bTowing","_bTowingP","_bTowingP1","_bTowing1"];
if(!dialog) then {
	createDialog "vInteraction_Civ"; //Use pInteraction_Menu with more buttons
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};

_display = findDisplay 37400;

_bRepair = _display displayCtrl 2401;
_bDlc = _display displayCtrl 2403;
_bFlip = _display displayCtrl 2402;
_bTowing = _display displayCtrl 2404; // Deaktiviert
_bTowing1 = _display displayCtrl 2405; // Aktiviert
_bTowingP1 = _display displayCtrl 1208; // Aktiviert
_bTowingP = _display displayCtrl 1209; // Deaktiviert
_bDevice = _display displayCtrl 2406; // Deaktiviert
_bDlc ctrlShow false;
_bTowing1 ctrlShow false;
_bTowingP1 ctrlShow false;
life_vInact_curTarget = _curTarget;

//Set Repair Action
if("ToolKit" in (items player)) then {_bRepair ctrlEnable true;} else {_bRepair ctrlEnable false;};
_bRepair ctrlSetTooltip localize "STR_vInAct_Repair";
_bRepair buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_repairTruck;";

_bFlip ctrlSetTooltip localize "STR_vInAct_Unflip";
_bFlip buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";



if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_F","C_Heli_Light_01_civil_F"] && {_curTarget in life_vehicles}) then {
			_bDlc ctrlShow true;
			_bDlc ctrlEnable true;
			_bDlc ctrlSetTooltip localize "STR_vInAct_GetInKart";
			_bDlc buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
};

	if((_curTarget in life_vehicles) && (_curTarget isKindOf "Car" OR _curTarget isKindOf "Ship")) then {
	_bTowing ctrlShow true;
	_bTowingP ctrlShow true;
	} else {
	_bTowing ctrlShow false;
	_bTowingP ctrlShow false;
	_bTowingP1 ctrlShow false;
	_bTowing1 ctrlShow false;
	};

if(!(life_vInact_curTarget getVariable["RopeAttach",false])) then {
	_bTowing ctrlSetTooltip localize "STR_TOW_OFF";
	_bTowing buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadon; closeDialog 0;";
	} else {
	_bTowing ctrlShow false;
	_bTowingP ctrlShow false;
	_bTowing1 ctrlShow true;
	_bTowingP1 ctrlShow true;
	_bTowing1 ctrlSetTooltip localize "STR_TOW_ON";
	_bTowing1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadoff; closeDialog 0;";
};


if((typeOf _curTarget == "O_Truck_03_device_F") && {_curTarget in life_vehicles}) then {
		_bDevice ctrlSetTooltip localize "STR_vInAct_DeviceMine";
		_bDevice buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
		if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
			_bDevice ctrlEnable false;
		} else {
			_bDevice ctrlEnable true;
		};
	} else {
		_bDevice ctrlShow false;
};






