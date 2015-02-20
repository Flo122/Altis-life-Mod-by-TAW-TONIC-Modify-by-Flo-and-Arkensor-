/*

	Open pack-up dlg

*/
private["_index"];
if(!createDialog "marketView") exitWith {hint "Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;
waitUntil {!isNull (findDisplay 39500)};
lbClear 1500;
//Create listbox items
{
	_index = lbAdd [1500, [ [_x select 0, 0] call life_fnc_varHandle ] call life_fnc_varToStr ];
	lbSetData [1500, _index, _x select 0];
}
foreach life_market_resources;
lbSetCurSel [1500, 0];