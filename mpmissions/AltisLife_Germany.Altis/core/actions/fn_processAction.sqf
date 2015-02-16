/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	case "oil": {["oilu","oilp",257,"Öl verarbeiten"];};
	case "diamond": {["diamond","diamondc",356,"Diamanten schleifen"]};
	case "heroin": {["heroinu","heroinp",452,"Schlafmohn verarbeiten"]};
	case "copper": {["copperore","copper_r",374,"Kupfer verarbeiten"]};
	case "iron": {["ironore","iron_r",301,"Eisen verarbeiten"]};
	case "sand": {["sand","glass",336,"Sand verarbeiten"]};
	case "salt": {["salt","salt_r",475,"Salz verarbeiten"]};
	case "cocaine": {["cocaine","cocainep",534,"Kokain verarbeiten"]};
	case "marijuana": {["cannabis","marijuana",436,"Marihuana verarbeiten"]};
	case "cement": {["rock","cement",334,"Zement mischen"]};
	case "whiskey": {["getreideu","getreideip",424,"Ruehre Maische"]};
	case "zigarren": {["tabaku","tabakip",397,"Drehe Zigarren"]};
	case "rum": {["zuckeru","zuckerip",492,"Brenne Rum"]};
	case "gusseisen": {["ironore","eisenp",315,"Gieße Form"]};
	case "nudeln": {["getreideu","getreidep",321,"Mahle Mehl"]};
	case "holz": {["holzu","holzp",324,"Verkohle Holz"]};
	case "brauer": {["hopfenu","hopfenp",354,"Braue Bier"]};
	case "schwefel": {["schwefelu","schwefelp",322,"Zerkleinere Schwefel"]};
	case "silber": {["silberu","silberp",396,"Schmelze Silber"]};
	case "zigaretten": {["tabaku","tabakp",457,"Stopfe Zigaretten"]};
	case "wein": {["traubenu","traubenp",400,"Keltere Wein"]};
	case "zinn": {["zinnu","zinnp",327,"Schmelze Zinn"]};
	case "zucker": {["zuckeru","zuckerp",456,"Raffiniere Zucker"]};
	case "uran2": {["uran1","uran2",1000,"Reinige Uran"]};
	case "uran3": {["uran2","uran3",2000,"Verarbeite Uran"]};
	case "uran4": {["uran3","uran4",3000,"Reichere Uran an"]};
	case "uranip": {["uran2","uranip",5000,"Uran verschmutzen"]};
	default {[]};
};

//Error checking
if(count _itemInfo == 0) exitWith {};

//Setup vars.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;

if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
	_hasLicense = true;
} else {
	_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
};

_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);

_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_hasLicense) then
{
	while{true} do
	{
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed",_oldVal,_itemName],"PLAIN"];
	life_is_processing = false;
}
	else
{
	if(life_cash_pirates < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	while{true} do
	{
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(life_cash_pirates < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed2",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	life_cash_pirates = life_cash_pirates - _cost;
	life_is_processing = false;
};	