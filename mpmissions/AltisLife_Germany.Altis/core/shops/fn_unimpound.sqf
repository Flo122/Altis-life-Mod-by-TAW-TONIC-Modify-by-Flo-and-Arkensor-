/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Unimpounds the car
	*DUE TO BE REWROTE FOR NEW SYSTEM*
*/
private["_display","_cars","_veh","_sel","_i","_name","_color","_text","_check","_price","_pos"];
disableSerialization;

_display = findDisplay 2800;
_cars = _display displayCtrl 2801;
_sel = lbCurSel _cars;
_veh = _cars lbData _sel;
_veh = life_vehicles select parseNumber(_veh);
_price = _cars lbValue _sel;
if(_veh distance impound_obj < 50) then
{

	hint format["%1", life_impound_yard];
	switch (life_impound_yard) do
	{
		case "civ":
		{
			switch (true) do
			{
				case (_veh isKindOf "Car") : {_pos = getPos car_impound;};
				case (_veh isKindOf "Air") : {_pos = getPos air_impound;};
				case (_veh isKindOf "Ship") : {_pos = getPos boat_impound;};
			};
		};
		
		case "cop":
		{
			switch (true) do
			{
				case (_veh isKindOf "Car") : {_pos = getPos cop_car_impound;};
				case (_veh isKindOf "Air") : {_pos = getPos cop_air_impound;};
				case (_veh isKindOf "Ship") : {_pos = getPos cop_boat_impound;};
			};
		};
	};
	_check = nearestObjects[_pos,["LandVehicle","Air"],4];
	if(count _check > 0) exitWith {hint localize "STR_Shop_Unimpound_VehExist";};
	if(_price > life_cash_pirates) then
	{
		_price = _price + 200;

		if(_price > life_atmcash_pirates) exitWith {hint localize "STR_Shop_Unimpound_NotEnough"};
		life_atmcash_pirates = life_atmcash_pirates - _price;
		life_cash_pirates = life_cash_pirates + _price;
	};
	_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
	_veh setDamage 0;
	_veh setFuel 0;
	_veh allowDamage false;
	_veh addEventHandler["handleDamage",{false}];
	[_veh] spawn
	{
		private["_v"];
		_v = _this select 0;
		sleep 10;
		_v allowDamage true;
		_v removeallEventHandlers "handleDamage";
	};

	hint format[localize "STR_Shop_Unimpound_Success",_name,[_price] call life_fnc_numberText];
	detach _veh;
	if(_veh isKindOf "Air") then 
	{
		_veh setPos [_pos select 0, _pos select 1, 1];
	}
	else
	{
		_veh setPos _pos;
	};
	player reveal _veh;
	life_cash_pirates = life_cash_pirates - _price;
	bank_addfunds = _price;
	publicVariableServer "bank_addfunds";
	_veh setFuel 1;
	_veh setVariable["lights",false,true];
};

[] call life_fnc_impoundMenu; //Refresh it