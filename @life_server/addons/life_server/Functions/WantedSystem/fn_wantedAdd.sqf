/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
    case "187V": {_type = ["Ueberfahren mit Todesfolge",100000]};
    case "187": {_type = ["Mord",550000]};
    case "901": {_type = ["Gefaengnisflucht",75000]};
    case "261": {_type = ["Vergewaltigung",100000]};
    case "261A": {_type = ["Versuchte Vergewaltigung",50000]};
    case "215": {_type = ["Versuchter Fahrzeugdiebstahl",10000]};
    case "213": {_type = ["Verwenden illegaler Sprengstoff",10000]};
    case "211": {_type = ["Raub",100000]};
    case "207": {_type = ["Entfuehrung",100000]};
    case "207A": {_type = ["Versuchte Entfuehrung",50000]};
    case "487": {_type = ["Autodiebstahl",20000]};
    case "488": {_type = ["Petty Theft",15000]};
    case "480": {_type = ["Fahrerflucht",50000]};
    case "481": {_type = ["Drogenbesitz (s. Bussgeldkatalog)",1]};
    case "482": {_type = ["Versuchter Drogenhandel",100000]};
    case "483": {_type = ["Drogenhandel",100000]};
    case "500": {_type = ["Geblitzt",2000]}; 
	case "501": {_type = ["Geblitzt",5000]};
	case "502": {_type = ["Geblitzt",20000]};
	case "503": {_type = ["Geblitzt",50000]};
	case "504": {_type = ["Geblitzt",100000]};
	case "505": {_type = ["Geblitzt",150000]};
	case "506": {_type = ["Geblitzt",200000]};
	case "507": {_type = ["Geblitzt",250000]}; 
    case "999": {_type = ["Glueksspiel",10000]};
	case "919": {_type = ["Organ Dealing",20000]};
	case "8": {_type = ["Ruhestoerung",5000]};
    case "9": {_type = ["Fahren ohne Fahrerlaubnis",10000]};
    case "10": {_type = ["Fahren ohne Licht",2500]};
    case "11": {_type = ["Falschparken/Verkehrsbehinderung",2500]};
    case "12": {_type = ["Fahren unter Alkohol-/Drogeneinfluss",20000]};
    case "13": {_type = ["Verursachen eines Unfalls",7500]};
    case "14": {_type = ["Verursachen eines Unfalls mit Personenschaden",15000]};
    case "15": {_type = ["Fahrerflucht",50000]};
    case "16": {_type = ["Fliegen ohne Pilotenschein",30000]};
    case "17": {_type = ["Fliegen ohne Kollisionslichter",10000]};
    case "18": {_type = ["Missachtung der Mindestflughoehe",10000]};
    case "19": {_type = ["Landen in Staedten",20000]};
    case "20": {_type = ["Fliegen unter Alkohol-/Drogeneinfluss",100000]};
    case "21": {_type = ["Alkohol-/Drogenbesitz (s. Bussgeldkatalog)",1]};
    case "22": {_type = ["Alkohol-/Drogenkonsum",10000]};
    case "23": {_type = ["Alkohol-/Drogenhandel",100000]};
    case "24": {_type = ["versuchter Taschendiebstahl",7500]};
    case "25": {_type = ["Taschendiebstahl",15000]};
    case "26": {_type = ["versuchter Fahrzeugdiebstahl",10000]};
    case "27": {_type = ["Fahrzeugdiebstahl",20000]};
    case "28": {_type = ["Handel mit gestohlenen Fahrzeugen (s. Bussgeldkatalog)",1]};
    case "29": {_type = ["Handel mit Sprengstoffen (s. Bussgeldkatalog)",1]};
    case "30": {_type = ["Fuehren eines illegalen Fahrzeugs",50000]};
    case "31": {_type = ["offenes Tragen von Waffen",5000]};
    case "32": {_type = ["Besitz legaler Waffen ohne Waffenschein",10000]};
    case "33": {_type = ["Besitz illegaler Waffen",50000]};
    case "34": {_type = ["Abfeuern von Waffen",30000]};
    case "35": {_type = ["Beamtenbeleidigung (s. Bussgeldkatalog)",1]};
    case "36": {_type = ["Behinderung der Polizeiarbeit",7500]};
    case "37": {_type = ["Missachtung polizeilicher Anweisungen",7500]};
    case "38": {_type = ["Gefaengnisausbruch",75000]};
    case "39": {_type = ["Betreten einer Sperrzone",10000]};
    case "40": {_type = ["Widerstand gegen die Staatsgewalt",25000]};
	case "41": {_type = ["Anstiftung zu einem Verbrechen (s. Bussgeldkatalog)",1]};
	case "42": {_type = ["Angriff auf Kraftwerke",100000]};
	case "43": {_type = ["Beschuss",20000]};
	case "44": {_type = ["Beschuss mit Personenschaden",75000]};
	case "45": {_type = ["fahrlaessige Toetung",100000]};
	case "47": {_type = ["versuchte Entfuehrung",50000]};
	case "48": {_type = ["Entfuehrung",100000]};
	case "49": {_type = ["versuchter Raub",50000]};
	case "50": {_type = ["Raub",100000]};
	case "51": {_type = ["versuchter Bankraub",75000]};
	case "52": {_type = ["Bankraub",150000]};
	case "53": {_type = ["rebellische Uebernahme",200000]};
	case "54": {_type = ["Terrorismus",600000]};
	case "55": {_type = ["Einbruch",250000]};
	case "56": {_type = ["Ladendiebstahl",50000]};
	case "57": {_type = ["versuchter Ladendiebstahl",25000]};
	case "58": {_type = ["Vandalismus/Sachbeschädigung",20000]};
	case "59": {_type = ["Erpressung",50000]};
	case "60": {_type = ["Bestechung",25000]};
	case "61": {_type = ["versuchter Mord",350000]};
	case "62": {_type = ["Beihilfe zum Mord",150000]};
	case "63": {_type = ["Ausgabe als Polizist/Betrug",100000]};
	case "64": {_type = ["Hausfriedensbruch",125000]};
	case "65": {_type = ["Falschaussage",25000]};
    default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes pushBack (_type select 0);
	_val = _data select 3;
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
	[[_name,_uid,_crimes,(_type select 1) + _val],_uid] spawn TON_fnc_saveBounties;
}
	else
{
	life_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)];
	[[_name,_uid,[(_type select 0)],(_type select 1)],_uid] spawn TON_fnc_saveBounties;
};