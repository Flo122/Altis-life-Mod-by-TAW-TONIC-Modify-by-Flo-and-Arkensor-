/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine	
 
	Description:
	Replaces the mass addactions for various vehicle actions
*/
private["_display","_curTarget","_bRepair","_bRegister","_bSearch","_bPullOut","_bImpound","_bTowning","_bFlip"];
if(!dialog) then {
	createDialog "vInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
_display = findDisplay 37400;
	_bRepair = _display displayCtrl 2401;
	_bRegister = _display displayCtrl 2403;
	_bSearch = _display displayCtrl 2404;
	_bPullOut = _display displayCtrl 2405;
	_bImpound = _display displayCtrl 2406;
	_bTowning = _display displayCtrl 2408;
	_bFlip = _display displayCtrl 2407;
	_bMiningDevice = _display displayCtrl 2408;
	life_vInact_curTarget = _curTarget;
 
if(playerSide == west) then {
 

	
	//Set Repair Action
	_bRepair ctrlSetTooltip localize "STR_vInAct_Repair";
	_bRepair buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_repairTruck;";

	if("ToolKit" in (items player)) then {_bRepair ctrlEnable true;} else {_bRepair ctrlEnable false;};


	_bRegister ctrlSetTooltip localize "STR_vInAct_Registration";
	_bRegister buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_searchVehAction;";
		
	_bSearch ctrlSetTooltip localize "STR_vInAct_SearchVehicle";
	_bSearch buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_vehInvSearch;";
		
	_bPullOut ctrlSetTooltip localize "STR_vInAct_PullOut";
	_bPullOut buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_pulloutAction;";
	if(count crew _curTarget == 0) then {_bPullOut ctrlEnable false;};
		
	_bImpound ctrlSetTooltip localize "STR_vInAct_Impound";
	_bImpound buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_impoundAction;";
		

	
	
	
	if(_curTarget isKindOf "Ship") then {
		_bFlip ctrlSetTooltip localize "STR_vInAct_PushBoat";
		_bFlip buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_F","C_Heli_Light_01_civil_F"] && {_curTarget in life_vehicles}) then {
			_bFlip ctrlSetTooltip localize "STR_vInAct_GetInKart";
			_bFlip buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
		} else {
			_bFlip ctrlSetTooltip localize "STR_vInAct_Unflip";
			_bFlip buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
		};
	};

	
};

 
if(playerSide == civilian) then {
	

	
	_bRepair ctrlSetTooltip localize "STR_vInAct_Repair";
	_bRepair buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_repairTruck;";


	if("ToolKit" in (items player)) then {_bRepair ctrlEnable true;} else {_bRepair ctrlEnable false;};

	_bFlip ctrlSetTooltip localize "STR_vInAct_Unflip";
	_bFlip buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
	
	_bFlip ctrlShow false;
	
	//unflip und boot push
	if(_curTarget isKindOf "Ship") then {
		_bFlip ctrlShow true;
		_bFlip ctrlEnable true;
		_bFlip ctrlSetTooltip localize "STR_vInAct_PushBoat";
		_bFlip buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_F","C_Heli_Light_01_civil_F"] && {_curTarget in life_vehicles}) then {
			_bFlip ctrlShow true;
			_bFlip ctrlEnable true;
			_bFlip ctrlSetTooltip localize "STR_vInAct_GetInKart";
			_bFlip buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
		};
	};
	
	if((typeOf _curTarget == "O_Truck_03_device_F") && {_curTarget in life_vehicles}) then {
		_Btn4 ctrlSetText localize "STR_vInAct_DeviceMine";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
		if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
			_Btn4 ctrlEnable false;
		} else {
			_Btn4 ctrlEnable true;
		};
	} else {
		_Btn4 ctrlShow false;
	};
	
	if((_curTarget in life_vehicles) && (_curTarget isKindOf "Car" OR _curTarget isKindOf "Ship")) then {
	_Btn5 ctrlShow true;
	} else {
	_Btn5 ctrlShow false;
	};
	
	if(!(life_vInact_curTarget getVariable["RopeAttach",false])) then {
	_Btn5 ctrlSetText "Towing [Deaktiviert]";
	_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadon; closeDialog 0;";
	} else {
	_Btn5 ctrlSetText "Towing [Aktiviert]";
	_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadoff; closeDialog 0;";
	};
	_Btn6 ctrlShow false;
};
 
if(playerSide == east) then {
	//Set Repair Action
	_Btn1 ctrlSetText localize "STR_vInAct_Repair";
	_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";
 
	if("ToolKit" in (items player) && (damage _curTarget < 1)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

	_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
	_Btn2 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
	
	_Btn3 ctrlSetText localize "STR_vInAct_PullOut";
	_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
	if(count crew _curTarget == 0) then {_Btn3 ctrlEnable false;};
	
	_Btn4 ctrlShow false;
	
	//unflip und boot push
	if(_curTarget isKindOf "Ship") then {
		_Btn4 ctrlShow true;
		_Btn4 ctrlEnable true;
		_Btn4 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn4 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","B_Heli_Transport_03_F","C_Kart_01_Vrana_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_F","C_Heli_Light_01_civil_F"] && {_curTarget in life_vehicles}) then {
			_Btn4 ctrlShow true;
			_Btn4 ctrlEnable true;
			_Btn4 ctrlSetText localize "STR_vInAct_GetInKart";
			_Btn4 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
		};
	};
	
	if(typeOf _curTarget == "O_Truck_03_device_F") then {
		_Btn5 ctrlSetText localize "STR_vInAct_DeviceMine";
		_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
		if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
			_Btn5 ctrlEnable false;
		} else {
			_Btn5 ctrlEnable true;
		};
		} else {
			_Btn5 ctrlShow false;
		};
	if((_curTarget in life_vehicles) && (_curTarget isKindOf "Car" OR _curTarget isKindOf "Ship")) then {
	_Btn6 ctrlShow true;
	} else {
	_Btn6 ctrlShow false;
	};
	
	if(!(life_vInact_curTarget getVariable["RopeAttach",false])) then {
	_Btn6 ctrlSetText "Towing [Deaktiviert]";
	_Btn6 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadon; closeDialog 0;";
	} else {
	_Btn6 ctrlSetText "Towing [Aktiviert]";
	_Btn6 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadoff; closeDialog 0;";
	};
};
 
if(playerSide == independent) then {
	
		//Set Repair Action
		_Btn1 ctrlSetText localize "STR_vInAct_Repair";
		_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";
 
		if("ToolKit" in (items player) && (damage _curTarget < 1)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};
		
		_Btn2 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
		if(count crew _curTarget == 0) then {_Btn2 ctrlEnable false;};
		
		_Btn3 ctrlSetText localize "STR_vInAct_Unflip";
		_Btn3 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
		
		if(_curTarget isKindOf "Ship") then {
		_Btn4 ctrlEnable true;
		_Btn4 ctrlShow true;
		_Btn4 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn4 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
		} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","B_Heli_Transport_03_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_F","C_Heli_Light_01_civil_F"] && {_curTarget in life_vehicles}) then {
			_Btn4 ctrlEnable true;
			_Btn4 ctrlShow true;
			_Btn4 ctrlSetText localize "STR_vInAct_GetInKart";
			_Btn4 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
		};
		};
		if((_curTarget in life_vehicles) && (_curTarget isKindOf "Car" OR _curTarget isKindOf "Ship")) then {
		_Btn5 ctrlShow true;
		} else {
		_Btn5 ctrlShow false;
		};
		
		if(!(life_vInact_curTarget getVariable["RopeAttach",false])) then {
		_Btn5 ctrlSetText "Towing [Deaktiviert]";
		_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadon; closeDialog 0;";
		} else {
		_Btn5 ctrlSetText "Towing [Aktiviert]";
		_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadoff; closeDialog 0;";
		};
		_Btn4 ctrlShow false;
		_Btn6 ctrlShow false;
};