/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "AntiFuel": {2};
	case "Handschuhe": {2};
	case "Skalpel": {3};
	case "kidney": {15};
	case "oilu": {3};
	case "oilp": {2};
	case "heroinu": {5};
	case "heroinp": {3};
	case "cannabis": {5};
	case "marijuana": {3};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {4};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {7};
	case "ironore": {5};
	case "copper_r": {4};
	case "iron_r": {3};
	case "sand": {6};
	case "salt": {8};
	case "salt_r": {4};
	case "glass": {3};
	case "diamond": {7};
	case "diamondc": {4};
	case "cocaine": {6};
	case "cocainep": {3};
	case "spikeStrip": {5};
	case "rock": {6};
	case "cement": {4};
	case "goldbar": {10};
	case "blastingcharge": {15};
	case "boltcutter": {5};
	case "defusekit": {2};
	case "storagesmall": {5};
	case "storagebig": {10};
	case "tracker": {2};
	case "getreideu": {4};
	case "holzu": {6};
	case "hopfenu": {6};
	case "schwefelu": {6};
	case "silberu": {7};
	case "tabaku": {8};
	case "traubenu": {7};
	case "zinnu": {6};
	case "zuckeru": {8};
	case "getreideip": {3};
	case "tabakip": {5};
	case "zuckerip": {3};
	case "eisenp": {3};
	case "getreidep": {3};
	case "holzp": {2};
	case "hopfenp": {4};
	case "schwefelp": {3};
	case "silberp": {4};
	case "tabakp": {4};
	case "traubenp": {4};
	case "zinnp": {3};
	case "zuckerp": {4};
	case "schmuck": {4};
	case "bronze": {4};
	case "pbrau": {3};
	case "kkugel": {6};
	case "spulver": {2};
	case "pkugel": {4};	
	case "speedbomb": {10};
	case "uran1": {19};
	case "uran2": {17};
	case "uran3": {15};
	case "uran4": {13};
	case "uran5": {11};
	case "uranip": {9};
	case "handcuffkey": {1};
	case "housewarn": {20};
	case "baumwollep": {5};
	case "empmodul": {55};
	default {1};
};
