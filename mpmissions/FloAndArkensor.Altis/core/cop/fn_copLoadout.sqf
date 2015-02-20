/*
File: fn_copLoadout.sqf
Author: Bryan "Tonic" Boardwine
Edited: Itsyuka

Description:
Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
player addUniform "U_B_CombatUniform_mcam";
player addVest "V_Rangemaster_belt";

player addWeapon "hgun_P07_snds_F";
player addMagazine "30Rnd_9x21_Mag";
player addMagazine "30Rnd_9x21_Mag";
player addMagazine "30Rnd_9x21_Mag";
player addMagazine "30Rnd_9x21_Mag";
player addMagazine "30Rnd_9x21_Mag";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio"; 

[] call life_fnc_updateClothing;
[] call life_fnc_saveGear;