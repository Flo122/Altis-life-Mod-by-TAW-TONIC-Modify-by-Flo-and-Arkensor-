/*
	File: welcomecredits.sqf
	Author: HellsGateGaming.com
	Edit: RenildoMarcio
	Date: 09/05/2014
	Description:
	Creates an intro on the bottom-right hand corner of the screen.
*/

_onScreenTime = 8;

sleep 15; //Wait in seconds before the credits start after player is in-game

_role1 = "Willkommen auf dem Altis Life Server von";
_role1names = ["Name Here"];
_role2 = "Besuche uns auf dem Teamspeak:";
_role2names = ["zero-one.ovh"];
_role3 = "Unser Forum:";
_role3names = ["http://zero-one-altis.de/"];
_role4 = "Beachtet immer die Regeln!";
_role4names = ["Diese findet ihr auf der Map"];
_role5 = "Neuerungen:";
_role5names = ["Findet ihr im Changelog"];
_role6 = "Extratasten haben wir auch!";
_role6names = ["Druecke die Tasten F1 bis F4 fuer eine Uebersicht"];
_role7 = "Beachtet immer die Regeln";
_role7names = ["So machts allen am meisten Spass!"];
_role8 = "Noch Fragen?";
_role8names = ["Dann komm ins TS oder frag im Forum"];

{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.55' color='#FF0000' align='right'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.80' color='#FFFFFF' align='right'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.9);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names],
[_role8, _role8names]
];