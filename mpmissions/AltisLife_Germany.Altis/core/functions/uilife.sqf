[] spawn
{
private["_ui","_geld","_fps"];
disableSerialization;
while {true} do
	{
	_ui = uiNameSpace getVariable ["playerHUD",displayNull];
	_geld = _ui displayCtrl 23520;
	_fps = _ui displayCtrl 23525;
	
	//Update Money
	_geld ctrlSetPosition [safeZoneX+safeZoneW-0.10,safeZoneY+safeZoneH-0.259];
	_geld ctrlSetText format["%1", [life_cash_pirates] call life_fnc_numberText];
	_geld ctrlSetBackgroundColor [0, 0, 0, 0.5]; 
	if(life_cash_pirates > 100000) then { 
		_geld ctrlSetBackgroundColor [255, 0, 0, 0.5]; 
	};
	_geld ctrlCommit 0;
	
	//Update FPS
	//_fps ctrlSetPosition [safeZoneX+safeZoneW-0.1,safeZoneY+safeZoneH-0.259];
	//_fps ctrlSetText format["%1", round diag_fps];					
	//_fps ctrlCommit 0;
	};
	//sleep 1.5;//safe some cpu
};