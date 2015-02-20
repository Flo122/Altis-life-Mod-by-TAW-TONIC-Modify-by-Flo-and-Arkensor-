/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
[] call life_fnc_updateClothing;
if((lbCurSel 3101) == -1) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;
[] call life_fnc_updateClothing;
if(_price > life_cash_pirates) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};
life_cash_pirates = life_cash_pirates - _price;

life_clothesPurchased = true;
closeDialog 0;

[] call life_fnc_updateClothing;