/*
	File: fn_licenseType.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the short-var of the license name to a long var and display name.
*/
private["_type","_ret","_var","_mode"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_type == "" OR _mode == -1) exitWith {[]};

switch (_mode) do
{
	case 0:
	{
		switch (_type) do
		{
			case "cair": {_var = "license_cop_air"}; //Cop Pilot License cost
			case "sek": {_var = "license_cop_sek"}; //Swat License cost
			case "cg": {_var = "license_cop_cg"}; //Coast guard license cost
			case "mair": {_var = "license_med_air"};
			case "driver": {_var = "license_civ_driver"}; //Drivers License cost
			case "truck":{_var = "license_civ_truck"}; //Truck License
			case "pilot": {_var = "license_civ_air"}; //Pilot/air license cost
			case "boat": {_var = "license_civ_boat"}; //Boating license cost
			case "dive": {_var = "license_civ_dive"}; //Diving license cost
			case "gun": {_var = "license_civ_gun"}; //Firearm/gun license cost
			case "rebel": {_var = "license_civ_rebel"}; //Rebel License
			case "donator": {_var = "license_civ_donator"};
			case "home": {_var = "license_civ_home"};
			case "heroin": {_var = "license_civ_heroin"}; //Heroin processing license cost
			case "marijuana": {_var = "license_civ_marijuana"}; //Marijuana processing license cost
			case "cocaine": {_var = "license_civ_coke"};
			case "oil": {_var = "license_civ_oil"}; //Oil processing license cost
			case "diamond": {_var = "license_civ_diamond"};
			case "copper": {_var = "license_civ_copper"};
			case "iron": {_var = "license_civ_iron"};
			case "sand": {_var = "license_civ_sand"};
			case "salt": {_var = "license_civ_salt"};
			case "cement": {_var = "license_civ_cement"};
			case "brauer": {_var = "license_civ_brauer"};
			case "nudeln": {_var = "license_civ_nudeln"};
			case "wein": {_var = "license_civ_wein"};
			case "zigaretten": {_var = "license_civ_zigaretten"};
			case "zucker": {_var = "license_civ_zucker"};
			case "whiskey": {_var = "license_civ_whiskey"};
			case "zigarren": {_var = "license_civ_zigarren"};
			case "rum": {_var = "license_civ_rum"};
			case "holz": {_var = "license_civ_holz"};
			case "schwefel": {_var = "license_civ_schwefel"};
			case "silber": {_var = "license_civ_silber"};
			case "zinn": {_var = "license_civ_zinn"};
			case "gusseisen": {_var = "license_civ_gusseisen"};
			case "bronze": {_var = "license_civ_bronze"};
			case "schmuck": {_var = "license_civ_schmuck"};
			case "pbrau": {_var = "license_civ_pbrau"};
			case "kkugel": {_var = "license_civ_kkugel"};
			case "pkugel": {_var = "license_civ_pkugel"};
			case "spulver": {_var = "license_civ_spulver"};
			case "uran2": {_var = "license_civ_uran2"};
			case "uran3": {_var = "license_civ_uran3"};
			case "uran4": {_var = "license_civ_uran4"};
			case "uran5": {_var = "license_civ_uran5"};
			case "uranip": {_var = "license_civ_uranip"};
			case "bm": {_var = "license_civ_bm"};
			default {_var = ""};
		};
	};
	
	case 1:
	{
		switch (_type) do
		{
			case "license_cop_air": {_var = "cair"}; //Cop Pilot License cost
			case "license_cop_sek": {_var = "sek"}; //Swat License cost
			case "license_cop_cg": {_var = "cg"}; //Coast guard license cost
			case "license_med_air": {_var = "mair"};
			case "license_civ_driver": {_var = "driver"}; //Drivers License cost
			case "license_civ_truck":{_var = "truck"}; //Truck License
			case "license_civ_air": {_var = "pilot"}; //Pilot/air license cost
			case "license_civ_boat": {_var = "boat"}; //Boating license cost
			case "license_civ_dive": {_var = "dive"}; //Diving license cost
			case "license_civ_gun": {_var = "gun"}; //Firearm/gun license cost
			case "license_civ_gang": {_var = "gang"}; //Gang license cost
			case "license_civ_rebel": {_var = "rebel"}; //Rebel License
			case "license_civ_donator": {_var = "donator"};
			case "license_civ_home": {_var = "home"};
			case "license_civ_heroin": {_var = "heroin"}; //Heroin processing license cost
			case "license_civ_marijuana": {_var = "marijuana"}; //Marijuana processing license cost
			case "license_civ_coke": {_var = "cocaine"};
			case "license_civ_oil": {_var = "oil"}; //Oil processing license cost
			case "license_civ_diamond": {_var = "diamond"};
			case "license_civ_copper": {_var = "copper"};
			case "license_civ_iron": {_var = "iron"};
			case "license_civ_sand": {_var = "sand"};
			case "license_civ_salt": {_var = "salt"};
			case "license_civ_cement": {_var = "cement"};
			case "license_civ_brauer": {_var = "brauer"};
			case "license_civ_nudeln": {_var = "nudeln"};
			case "license_civ_wein": {_var = "wein"};
			case "license_civ_zigaretten": {_var = "zigaretten"};
			case "license_civ_zucker": {_var = "zucker"};
			case "license_civ_whiskey": {_var = "whiskey"};
			case "license_civ_zigarren": {_var = "zigarren"};
			case "license_civ_rum": {_var = "rum"};
			case "license_civ_holz": {_var = "holz"};
			case "license_civ_schwefel": {_var = "schwefel"};
			case "license_civ_silber": {_var = "silber"};
			case "license_civ_zinn": {_var = "zinn"};
			case "license_civ_gusseisen": {_var = "gusseisen"};
			case "license_civ_bronze": {_var = "bronze"};
			case "license_civ_schmuck": {_var = "schmuck"};
			case "license_civ_pbrau": {_var = "pbrau"};
			case "license_civ_kkugel": {_var = "kkugel"};
			case "license_civ_pkugel": {_var = "pkugel"};
			case "license_civ_spulver": {_var = "spulver"};	
			case "license_civ_uran2": {_var = "uran2"};
			case "license_civ_uran3": {_var = "uran3"};
			case "license_civ_uran4": {_var = "uran4"};
			case "license_civ_uran5": {_var = "uran5"};
			case "license_civ_uranip": {_var = "uranip"};
			case "license_civ_bm": {_var = "bm"};
			default {_var = ""};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call life_fnc_varToStr)})];
_ret;