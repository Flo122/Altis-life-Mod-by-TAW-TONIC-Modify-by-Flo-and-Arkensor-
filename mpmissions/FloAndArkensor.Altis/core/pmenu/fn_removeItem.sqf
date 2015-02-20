/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hint "Du hast nichts ausgewählt.";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hint "Du muss eine Nummer eintragen."};
if(parseNumber(_value) <= 0) exitWith {hint "Du hast nicht so viel davon."};
_ind = [_data,life_illegal_items] call TON_fnc_index;
if(_ind != -1 && ([west,getPos player,100] call life_fnc_nearUnits)) exitWith {titleText["Illegeale Items können nicht in der Nähe von Polizisten entfernt werden","PLAIN"]};
if(player != vehicle player) exitWith {titleText["Du kannst keine Items in Fahrzeugen entfernen.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "Du hast möglicherweise nicht genug davon ?"};
_type = [_data,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Du hast %1 %2 aus deinem Inventar entfernt.",(parseNumber _value), _type];
	
[] call life_fnc_p_updateMenu;