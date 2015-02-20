#include <macro.h>
/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter", "_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"ASF Klamottenladen"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret = [
			["U_B_CombatUniform_mcam_vest","Dienstuniform",1000]
		];
	};
	
	//Hats
	case 1:
	{
		if(__GETC__(life_ASFlevel) == 1) then
		{
			_ret = [
			["H_Bandanna_gry",nil,150],
			["H_HelmetB_light_black",nil,150],
			["H_PilotHelmetHeli_B",nil,150]
			];
		};		
		
		if(__GETC__(life_ASFlevel) >= 2) then
		{
			_ret = [
			["H_Bandanna_gry",nil,150],
			["H_HelmetB_light_black",nil,150],
			["H_PilotHelmetHeli_B",nil,150],
			["H_Beret_blk","Beret Schwarz",200]
			];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = [
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		_ret = [
			["V_Rangemaster_belt",nil,2000],
			["V_TacVestIR_blk",nil,3500],
			["V_PlateCarrier1_blk","Anti Gas Weste",70000]
		];
	};
	
	//Backpacks
	case 4:
	{
		_ret = [
			["B_Carryall_oli",nil,1000]
		];
	};
};
_ret;