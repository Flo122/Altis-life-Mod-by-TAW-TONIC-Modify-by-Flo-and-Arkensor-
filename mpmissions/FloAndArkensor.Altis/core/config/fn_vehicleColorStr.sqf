/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	// Quad
	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Digi-Wueste"};
			case 1: {_color = "Schwarz"};
			case 2: {_color = "Blau"};
			case 3: {_color = "Rot"};
			case 4: {_color = "Weiss"};
			case 5: {_color = "Digi-Gruen"};
			case 6: {_color = "Jagd-Camo"};
			case 7: {_color = "Rebellen-Camo"};
		};
	};
	// Offroad
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Rot";};
			case 1: {_color = "Gelb";};
			case 2: {_color = "Weiss";};
			case 3: {_color = "Blau";};
			case 4: {_color = "Dunkelrot";};
			case 5: {_color = "Blau / Weiss"};
			case 6: {_color = "Polizei"};
			case 7: {_color = "Notarzt"};
       		case 8: {_color = "Tarnung"};
			case 9: {_color = "Dodge"};
			case 10: {_color = "Gamer"};
			case 11: {_color = "Taxi"};
			case 12: {_color = "Türkis"};
			case 13: {_color = "Grün"};
			case 14: {_color = "Rebel"};
			case 15: {_color = "Braun"};
			case 16: {_color = "ASF"};
		};
	};
	// Hatchback
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Gruen";};
			case 2: {_color = "Blau";};
			case 3: {_color = "Dunkelblau";};
			case 4: {_color = "Gelb";};
			case 5: {_color = "Weiss"};
			case 6: {_color = "Grau"};
			case 7: {_color = "Schwarz"};
			case 8: {_color = "Feuer";};
			case 9: {_color = "Metallica"};
			case 10: {_color = "Polizei"};
			case 11: {_color = "Taxi"};
			};
	};
	// Hatchback Sport
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Rot"};
			case 1: {_color = "Dunkelblau"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Schwarz / Weiss"};
			case 4: {_color = "Hellbraun"};
			case 5: {_color = "Gruen"};
			case 6: {_color = "Feuer";};
			case 7: {_color = "Metallica"};
			case 8: {_color = "Undercover"};
			case 9: {_color = "Polizei"};
			case 10: {_color = "Taxi"};
		};
	};
	// SUV	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dunkelrot";};
			case 1: {_color = "Silber";};
			case 2: {_color = "Orange";};
			case 3: {_color = "Polizei";};
			case 4: {_color = "Notarzt";};
			case 5: {_color = "Blau"};
			case 6: {_color = "Carbon"};
			case 7: {_color = "Carbon Weiss"};
			case 8: {_color = "Türkis"};
			case 9: {_color = "Ferrari"};
			case 10: {_color = "Schwartz"};
			case 11: {_color = "Hellgrün"};
			case 12: {_color = "Rebel"};
			case 13: {_color = "Monster Energy"};
			case 14: {_color = "SEK"};
			case 15: {_color = "ALG"};
			case 16: {_color = "Braun"};
			case 17: {_color = "Gelb"};
			case 18: {_color = "Dunkelgrün"};
		};
	};	
	// Truck
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weiss"};
			case 1: {_color = "Rot"};
		};
	};	
	// Truck Box
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weiss"};
			case 1: {_color = "Rot"};
			case 2: {_color = "Notarzt"};
		};
	};
	// Truck Fuel
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weiss"};
			case 1: {_color = "Rot"};
		};
	};
	// Zamak
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Weed Farmer"};
			case 2: {_color = "Ereka"};
			case 3: {_color = "RedBull"};
		};
	};
	// Zamak
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Weed Farmer"};
			case 2: {_color = "Ereka"};
			case 3: {_color = "RedBull"};
		};
	};
	// HEMTT
	case "B_Truck_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Kitty"};
			case 2: {_color = "Devil"};
		};
	};
	// HEMTT
	case "B_Truck_01_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Kitty"};
			case 2: {_color = "Devil"};
		};
	};
	// HEMTT
	case "B_Truck_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Kitty"};
			case 2: {_color = "Devil"};
		};
	};
	// HEMTT
	case "B_Truck_01_ammo_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Radioaktiv"};
		};
	};	
	// Hummingbird
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "Digi-Gruen"};
			case 2: {_color = "Blueline"};
			case 3: {_color = "Elliptical Rot"};
			case 4: {_color = "Furious Blau"};
			case 5: {_color = "Jeans Blue"};
			case 6: {_color = "Speedy Orange"};
			case 7: {_color = "Sunset Redline"};
			case 8: {_color = "Vrana Rot"};
			case 9: {_color = "Waves Blue"};
			case 10: {_color = "Rebellen-Digital"};
			case 11: {_color = "Polizei"};
			case 12: {_color = "Notarzt"};
			case 13: {_color = "RedBull"};
			case 14: {_color = "Rebel"};
			case 15: {_color = "ASF"};
			case 16: {_color = "Grau-Orange"};
			case 17: {_color = "Hellgrau-Orange"};
			case 18: {_color = "Braun"};
			case 19: {_color = "Beige"};
			case 20: {_color = "Wespe"};
			case 21: {_color = "Blau-Hell-Dunkel"};
		};
	};
	// Orca
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "Weiss / Blau"};
			case 2: {_color = "Digi-Gruen"};
			case 3: {_color = "Wuesten-Digi"};
			case 4: {_color = "Polizei"};
			case 5: {_color = "Notarzt"};
			case 6: {_color = "Rebellen"};
			case 7: {_color = "ASF"};
			case 8: {_color = "CH7 Red"};
		};
	};
	// Ghosthawk
	case "B_Heli_Transport_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
			case 1: {_color = "PEK"};
		};
	};
	// Hellcat
	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
			case 1: {_color = "Donator"};
			case 2: {_color = "Rebel"};
			case 3: {_color = "ASF"};
		};
	};
	// Mohawk
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
			case 2: {_color = "Rebel"};
		};
	};
	// Hunter
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
			case 1: {_color = "Einheitsgrün"};
			case 2: {_color = "Mattgrün"};
			case 3: {_color = "Rot"};
			case 4: {_color = "Blau"};
			case 5: {_color = "Gruen"};
			case 6: {_color = "Grau"};
			case 7: {_color = "SEK"};
			case 8: {_color = "ASF"};
		};
	};
	// Hunter
	case "B_MRAP_01_hmg_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
		};
	};
	// Ifrit
	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Braun"};
			case 1: {_color = "Grau"};
			case 2: {_color = "Hexa-Tarn"};
			case 3: {_color = "Blau"};
			case 4: {_color = "Rot"};
		};
	};
	// Strider
	case "I_MRAP_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "SEK"};
			case 1: {_color = "Bundespolizei"};
		};
	};
	// Schlauchboot 
	case "B_Boat_Transport_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Küstenwache"};
		};
	};
	// Speedboot
	case "C_Boat_Civil_01_police_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Küstenwache"};
		};
	};
	// Minigunboot
	case "B_Boat_Armed_01_minigun_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Küstenwache"};
		};
	};
	// U-boot
	case "B_SDV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
		};
	};
};

_color;