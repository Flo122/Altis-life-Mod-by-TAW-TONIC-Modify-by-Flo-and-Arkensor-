private["_display","_listbox","_shortname","_longname","_price","_hasLicense","_displayname"];
 
_buyables = _this select 3;
 
 
if(!dialog) then
{
if(!(createDialog "LicenseShop")) exitWith {};
};
disableSerialization;
 
_display = findDisplay 5546;
if(isNull _display) exitWith {};
_listbox = _display displayCtrl 55126;
_struct = "";
 
{
_shortname = _x; 
_longname = ([_shortname, 0] call life_fnc_licenseType) select 0;
_displayname = ([_shortname, 0] call life_fnc_licenseType) select 1;
_price = [_shortname] call life_fnc_licensePrice;

if (_shortname == "home") then {
_price = "1000000";
};

if (_shortname == "rebel") then {
_price = "2000000";
};

if (_shortname == "bm") then {
_price = "7500000";
};

_hasLicense = missionNamespace getVariable _longname;
 
if(!_hasLicense) then
{
_listbox lbAdd format["%1 (€%2)", _displayname, _price];
_listbox lbSetData [(lbSize _listbox) - 1, _shortname];
};
}
foreach _buyables;
 