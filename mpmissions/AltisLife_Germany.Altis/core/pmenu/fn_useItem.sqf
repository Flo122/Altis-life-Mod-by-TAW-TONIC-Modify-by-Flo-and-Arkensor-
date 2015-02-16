/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint "Du musst zuerst ein Item auswählen!";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
		};
	};
	
	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
	
	case (_item == "housewarn"): {
		[cursorTarget] spawn life_fnc_housewarn;
	};	
	
	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};
	
	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};
	
	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				titleText["Du kannst nun 3 Minuten lang sprinten","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint "Du hast bereits ein Nagelband gelegt"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint "You can't refuel the vehicle while in it!"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};
	
	case (_item == "handcuffkey"):
	{
		[] spawn life_fnc_handcuffkey;
	};
	
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
		[_item] call life_fnc_eatFood;
	};

	case (_item == "tracker"):
	{
		[] spawn life_fnc_tracker;
	};
	
	case (_item == "heroinp"):
	{
 		if(([false,_item,1] call life_fnc_handleInv)) then
 	{
      	[] spawn life_fnc_useHeroin;
    	};
	};
	case (_item == "cocainep"):
	{
 		if(([false,_item,1] call life_fnc_handleInv)) then
 	{
      	[] spawn life_fnc_useKokain2;
    	};
	};	
	case (_item == "marijuana"):
	{
		if(life_drugged_weed == 1) then {
			hint "Du rauchst bereits ein Joint!";
		} else {
			if(([false,_item,1] call life_fnc_handleInv)) then
			{
				[] spawn life_fnc_useMarihuana;
			};
		};
	};
	
	case (_item in ["hopfenp","traubenp"]):
	{
 		if(([false,_item,1] call life_fnc_handleInv)) then
 	{
      	[] spawn life_fnc_useAlkohol;
    	};
	};
	
	case (_item in ["getreideip","zuckerip"]):
	{
 		if(([false,_item,1] call life_fnc_handleInv)) then
 	{
      	[] spawn life_fnc_useSpirituosen;
    	};
	};
	
	case (_item == "pbrau"):
	{
 		if(([false,_item,1] call life_fnc_handleInv)) then
 	{
      	[] spawn life_fnc_usePbrau;
    	};
	};
	
	case (_item == "pkugel"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{		
			closeDialog 0;
			[] spawn life_fnc_usePkugel;
		};
	};
	
	case (_item == "speedbomb"):
	{
		[] spawn life_fnc_speedBomb;
    };
	
	case (_item == "kidney"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			player setVariable["missingOrgan",false,true];
			life_thirst = 100;
			life_hunger = 100;
			player setFatigue .5;
		};
	};
	default
	{
		hint "Das Item ist nicht benutzbar.";
	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;