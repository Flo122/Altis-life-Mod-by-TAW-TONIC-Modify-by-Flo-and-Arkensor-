/*
File : fn_copShowLicense.sqf
Create : Black Lagoon
Edit : Noldy and CYNX
Link : http://www.global-gamer.com/home/wbb/index.php/Thread/509-Turorial-Polizeimarke-zeigen/

Beschreibung : Fuegt einen 'Polizeiausweis' hinzu, den man ueber scrollen Zivilisten zeigen kann
*/

private["_target", "_message"];

_target = cursorTarget;

if(playerSide != civilian) exitWith
{
	hint "Du bist kein Civ!";
};

if( isNull _target) then {_target = player;};

if( !(_target isKindOf "Man") ) then {_target = player;};

if( !(alive _target) ) then {_target = player;};

_message = format["<img size='10' color='#FFFFFF' image='textures\civ\marke.paa'/><br/><br/><t size='2.5'>%1</t><br/><br/><t color='#f6f9fc' size='1.6'>Zivilausweis der Insel Altis</t>", name player];

[[player, _message],"life_fnc_copLicenseShown",_target,false] spawn life_fnc_MP;