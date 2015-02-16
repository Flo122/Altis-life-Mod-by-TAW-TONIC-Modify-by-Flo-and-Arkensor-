/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* processMulitpleItems.sqf
* processes any number of input items into one output item. progress bar is from bryan "tonic" boardwines fn_processAction.sqf.
*
* Please feel free to use and modify it, but remember to credit the author.
*
* PARAMS:
* _this select 3: String - processor type
*
*/

private ["_inputItems", "_outputItem", "_inputItemsNeeded", "_outputItemAmount", "_itemsInv", "_itemsNeeded", "_inputItemsDeleted", "_ui", "_progress", "_pgText", "_cP", "_productionAmount", "_possibleProductionAmount","_processor","_formatedProcessingInfo","_hasLicense","_licenseNeeded","_processingCost","_type","_productionInfo"];

if (isServer) exitWith {};

if (life_is_processing) exitWith {hint "Der Kollege ist beschäftigt. Bitte nicht stressen!";};    

//parameter
_processor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;

//Error check. taken from tonic.
if(isNull _processor OR _type == "" OR (player distance _processor > 5)) exitWith {};
if(vehicle player != player) exitwith {hint format["Du darfst nicht im Fahrzeug sitzen"];};

life_is_processing = true;

//define your production line here
_productionInfo = switch (_type) do
{
	case "bronze": {[["zinnp","copper_r"],[1,1],"bronze",1,"bronze",1337];};
	case "schmuck": {[["silberp","diamondc"],[1,1],"schmuck",1,"schmuck",1482];};
	case "pbrau": {[["zuckerip","getreideip"],[1,1],"pbrau",1,"pbrau",2470];};
	case "kkugel": {[["eisenp","iron_r"],[1,1],"kkugel",1,"kkugel",1398];};
	case "spulver": {[["schwefelp","holzp"],[1,1],"spulver",1,"spulver",1140];};
	case "pkugel": {[["kkugel","spulver"],[1,1],"pkugel",1,"pkugel",6272];};
	default {[]};
};

//initialize
_inputItems = _productionInfo select 0;
_inputItemsNeeded = _productionInfo select 1;
_outputItem = _productionInfo select 2;
_outputItemAmount = [(_productionInfo select 3),0,0,[0]] call BIS_fnc_param;
_licenseNeeded = _productionInfo select 4;
_processingCost = [(_productionInfo select 5),0,0,[0]] call BIS_fnc_param;

_hasLicense = missionNamespace getVariable (([_licenseNeeded,0] call life_fnc_licenseType) select 0);
_inputItemsDeleted = true;
_productionAmount = 9999; //infinite

if ((count _inputItems) != (count _inputItemsNeeded)) exitWith 
	{diag_log format["ERROR: ProcessMultipleItems falsch initialisiert: Anzahl InputItems ungleich Anzahl InputItem Kosten"];life_is_processing = false;};

//check if the player has enough items and determine how much he can produce
for "_x" from 0 to ((count _inputItems) - 1) do {
	//get current amount player has
	_itemsInv = missionNamespace getVariable ([(_inputItems select _x),0] call life_fnc_varHandle);
	_itemsNeeded = _inputItemsNeeded select _x;

	//calculate possible amount of processing cycles
	_possibleProductionAmount = floor (_itemsInv / _itemsNeeded);
	if (_possibleProductionAmount < _productionAmount) then {
		_productionAmount = _possibleProductionAmount;
	};
};

//exit if the player doenst have the required items for one process
if (_productionAmount < 1) exitWith {
	hint "Du hast nicht genug Materialien dabei";
	life_is_processing = false;
};

//check for cash if the player doesnt have the license and calculate possible max production
if (!_hasLicense) then {
	//determine max production by money
	if ((floor (life_cash_pirates / _processingCost)) < _productionAmount) then {
		_productionAmount = floor (life_cash_pirates / _processingCost);
	};
};

//exit if the player doenst have the required money for one process
if (_productionAmount < 1) exitWith {
	hint "Du hast nicht genug Geld dabei";
	life_is_processing = false;
};

//Setup our progress bar. taken from tonic.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%","Bei der Herstellung."];
_progress progressSetPosition 0.01;
_cP = 0.01;	

//progress bar. taken from tonic.
while{true} do
{
	sleep  0.3;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Bei der Herstellung."];
	if(_cP >= 1) exitWith {};
	if(player distance _processor > 10) exitWith {};
};

if(player distance _processor > 10) exitWith {hint "Du hast dich zu weit entfernt! Bleib dichter dran"; 5 cutText ["","PLAIN"]; life_is_processing = false;};

//substract items 
for "_x" from 0 to ((count _inputItems) - 1) do {
	//reduce 
	if (!([false,(_inputItems select _x),((_inputItemsNeeded select _x) * _productionAmount)] call life_fnc_handleInv)) then {
		_inputItemsDeleted = false;
	}
};

//add new items if players items where deleted
if (_inputItemsDeleted) then {
	if (!_hasLicense) then {
		life_cash_pirates = life_cash_pirates - (_processingCost * _productionAmount);
	};

	//add the new item
	if (!([true,_outputItem,(_outputItemAmount * _productionAmount)] call life_fnc_handleInv)) then {
		hint format["Ups. Beim produzieren ist was schiefgelaufen. Irgendein Admin ist Schuld! Ich nicht"];
		diag_log format["ERROR: fn_processMultipleItems - new item(s) are not added"];
	};

	//format output
	_formatedProcessingInfo = "Du hast";
	for "_x" from 0 to ((count _inputItems) - 2) do {
		_formatedProcessingInfo = _formatedProcessingInfo + format[" %1 %2,",((_inputItemsNeeded select _x) * _productionAmount),(_inputItems select _x)];
	};
	_formatedProcessingInfo = _formatedProcessingInfo + format[" und %1 %2 zu %4 %3 verarbeitet",((_inputItemsNeeded select ((count _inputItemsNeeded) - 1)) * _productionAmount),(_inputItems select ((count _inputItems) - 1)),_outputItem,(_outputItemAmount * _productionAmount)];

	5 cutText ["","PLAIN"];
	titleText[format["%1",_formatedProcessingInfo],"PLAIN"];
};

life_is_processing = false;