/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "cair": {15000}; //Cop Pilot License cost
	case "sek": {35000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "mair": {15000};
	case "sec": {1};
	case "driver": {500}; //Drivers License cost
	case "truck": {20000}; //Truck license cost
	case "pilot": {25000}; //Pilot/air license cost
	case "boat": {1000}; //Boating license cost
	case "dive": {2000}; //Diving license cost
	case "gun": {10000}; //Firearm/gun license cost	
	case "rebel": {2000000}; //Rebel license cost	
	case "donator": {1};
	case "home": {1000000};
	case "heroin": {25000}; //Heroin processing license cost
	case "marijuana": {19500}; //Marijuana processing license cost
	case "cocaine": {30000};
	case "oil": {10000}; //Oil processing license cost
	case "diamond": {35000};
	case "copper": {8000};
	case "iron": {9500};
	case "sand": {14500};
	case "salt": {12000};
	case "cement": {6500};
	case "brauer": {20000};
	case "nudeln": {11500};
	case "wein": {10000};
	case "zigaretten": {27500};
	case "zucker": {11500};
	case "whiskey": {28500};
	case "zigarren": {27500};
	case "rum": {26000};
	case "holz": {5000};
	case "schwefel": {18500};
	case "silber": {25000};
	case "zinn": {7000};
	case "gusseisen": {10500};
	case "bronze": {65000};
	case "schmuck": {70000};
	case "pbrau": {75000};
	case "kkugel": {100000};
	case "pkugel": {100000};
	case "spulver": {200000};
	case "uran2": {50000};
	case "uran3": {75000};
	case "uran4": {100000};
	case "uran5": {125000};
	case "uranip": {150000};
	case "bm": {7500000};
};