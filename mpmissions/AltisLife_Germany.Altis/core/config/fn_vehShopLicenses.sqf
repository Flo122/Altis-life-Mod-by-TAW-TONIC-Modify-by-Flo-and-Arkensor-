/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.
	
	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

switch (life_veh_shop select 0) do
{
	case "med_shop": {_ret = true;};
	case "kart_shop": {_ret = true;};
	case "ASF_air_hs": {_ret = true;};
	case "ASF_shop": {_ret = true;};
	case "ASF_basic": {_ret = true;};
	case "med_air_hs": {_ret = license_med_air;};
	case "civ_car": {_ret = true;};
	case "civ_ship": {_ret = true;};
	case "civ_air": {_ret = true;};
	case "cop_air": {_ret = license_cop_air;};
	case "cop_airhq": {_ret = license_cop_air;};
	case "civ_truck": {_ret = true;};
	case "reb_car": {_ret = license_civ_rebel;};
	case "cop_car": {_ret = true;};
	case "sek_hq": {_ret = license_cop_sek;};
	case "donator": {_ret = true;};
	case "cop_ship": 
	{
		if(_veh == "B_Boat_Armed_01_minigun_F") then
		{
			_ret = license_cop_cg;
		}
			else
		{
			_ret = true;
		};
	};
};

_ret;