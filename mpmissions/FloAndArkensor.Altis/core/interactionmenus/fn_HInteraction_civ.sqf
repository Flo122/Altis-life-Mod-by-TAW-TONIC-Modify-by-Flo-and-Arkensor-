/*


	Show vehicle interaction menu
	By ImSorry

*/


private["_display","_houseCfg","_curTarget","_bLockStorage","_bUnlockStorage","_bGarage","_bBuySellHouse","_bLichtAnBild","_bLichtAusBild","_bStoreVehicle","_bAlarmDeactiv","_bStorageButton","_bLichtButton","_bSellHouseBild","_bBuyHouseBild"];
if(!dialog) then {
	createDialog "HInteraction_Civ";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

_display = findDisplay 37401;

//Licht
_bLichtAnBild = _display displayCtrl 99999;
_bLichtAusBild = _display displayCtrl 99998;
_bLichtButton = _display displayCtrl 99997;


//Storage
_bLockStorage = _display displayCtrl 99996; //Bild
_bUnlockStorage = _display displayCtrl 99995; // Bild
_bStorageButton = _display displayCtrl 99994;


//Kaufen Verkaufen Haus
_bBuySellHouse = _display displayCtrl 99991;
_bSellHouseBild = _display displayCtrl 99992;
_bBuyHouseBild = _display displayCtrl 99993;


 // Andere Buttons
_bStoreVehicle = _display displayCtrl 9585; // Deaktiviert
_bAlarmDeactiv = _display displayCtrl 9863; // Deaktiviert
_bGarage = _display displayCtrl 99968;
_bSellHouseBild ctrlShow false;
_bLockStorage ctrlshow true;
_bunlockStorage ctrlshow false;
_bLichtAnBild ctrlShow false;
_bLichtAusBild ctrlShow true;
_bAlarmDeactiv ctrlShow false;
_bStoreVehicle ctrlShow false;
_bStorageButton ctrlShow false;
_bLichtButton ctrlShow false;
_bAlarmDeactiv ctrlShow false;
_bGarage ctrlShow false;
life_pInact_curTarget = _curTarget;

_houseCfg = [(typeOf _curTarget)] call life_fnc_houseConfig;
if(_houseCfg isEqualTo []) exitWith {closeDialog 0;};

if(!(_curTarget in life_vehicles) OR isNil {_curTarget getVariable "house_owner"}) then {
	if(_curTarget in life_vehicles) then {life_vehicles = life_vehicles - [_curTarget];};
	_bBuySellHouse ctrlSetTooltip localize "STR_pInAct_BuyHouse";
	_bBuySellHouse buttonSetAction "[life_pInact_curTarget] spawn life_fnc_buyHouse;";
	_bBuySellHouse ctrlShow true;
	_bBuyHouseBild ctrlShow true;
	if(!isNil {_curTarget getVariable "house_owner"}) then {
		_bBuySellHouse ctrlEnable false;
		_bBuyHouseBild ctrlShow false;
	};
} else {

	if((typeOf _curTarget) in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]) then {
		_bBuySellHouse ctrlSetTooltip localize "STR_pInAct_SellGarage";
		_bBuySellHouse buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
		_bBuySellHouse ctrlShow true;
		_bBuyHouseBild ctrlShow false;
		_bSellHouseBild ctrlShow true;
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
			_bBuySellHouse ctrlshow false;
			_bSellHouseBild ctrlShow false;
		};

		_bGarage ctrlSetTooltip localize "STR_pInAct_AccessGarage";
		_bGarage buttonSetAction "[life_pInact_curTarget,""Car""] spawn life_fnc_vehicleGarage; closeDialog 0;";
		_bGarage ctrlShow true;

		_bStoreVehicle ctrlSetTooltip localize "STR_pInAct_StoreVeh";
		_bStoreVehicle buttonSetAction "[life_pInact_curTarget,player] spawn life_fnc_storeVehicle; closeDialog 0;";
		_bStoreVehicle ctrlShow true;
	} else {
		_bBuyHouseBild ctrlShow false;
		_bSellHouseBild ctrlShow true;
		_bBuySellHouse ctrlSetTooltip localize "STR_pInAct_SellHouse";
		_bBuySellHouse buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
		_bBuySellHouse ctrlShow true;
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {
			_bBuySellHouse ctrlshow false;
			_bSellHouseBild ctrlShow false;
		};

		if(_curTarget getVariable ["locked",false]) then {
			_bStorageButton ctrlSetTooltip localize "STR_pInAct_UnlockStorage";
			_bunlockStorage ctrlshow true;
			_bLockStorage ctrlshow false;
		} else {
				_bStorageButton ctrlSetTooltip localize "STR_pInAct_LockStorage";
				_bunlockStorage ctrlshow false;
				_bLockStorage ctrlshow true;
		};
		_bStorageButton buttonSetAction "[life_pInact_curTarget] call life_fnc_lockHouse; closeDialog 0;";
		_bStorageButton ctrlShow true;

		if(isNull (_curTarget getVariable ["lightSource",ObjNull])) then {
			_bLichtButton ctrlSetTooltip localize "STR_pInAct_LightsOn";
			_bLichtAnBild ctrlShow true;
			_bLichtAusBild ctrlShow false;
		} else {
			_bLichtButton ctrlSetTooltip localize "STR_pInAct_LightsOff";
			_bLichtAnBild ctrlShow false;
			_bLichtAusBild ctrlShow true;
		};
		_bLichtButton buttonSetAction "[life_pInact_curTarget] call life_fnc_lightHouseAction; closeDialog 0;";
		_bLichtButton ctrlShow true;

		if(_curTarget getVariable["HouseRob",false]) then {
		_bAlarmDeactiv ctrlSetTooltip "Alarm abstellen";
		_bAlarmDeactiv buttonSetAction "[life_pInact_curTarget] call life_fnc_HouseAlarmOff; closeDialog 0;";
		_bAlarmDeactiv ctrlShow true;
		};

	};
};



