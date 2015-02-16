/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(life_cash_pirates > 0) then
{
	[[life_cash_pirates],"life_fnc_robReceive",_robber,false] spawn life_fnc_MP;
	[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[life_cash_pirates] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
	life_cash_pirates = 0;
}
	else
{
	[[2,"STR_NOTF_RobFail",true,[profileName]],"life_fnc_broadcast",_robber,false] spawn life_fnc_MP;
};
// Sync life_cash_pirates to DB:
[[getPlayerUID player,playerSide,life_cash_pirates,0],"DB_fnc_updatePartial",false,false] spawn life_fnc_MP;

// Sync life_atmcash_pirates to DB:
[[getPlayerUID player,playerSide,life_atmcash_pirates,1],"DB_fnc_updatePartial",false,false] spawn life_fnc_MP