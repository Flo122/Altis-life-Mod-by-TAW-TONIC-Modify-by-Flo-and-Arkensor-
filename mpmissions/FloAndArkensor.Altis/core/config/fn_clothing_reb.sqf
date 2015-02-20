/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_IG_Guerilla1_1",nil,10000],
			["U_I_G_Story_Protagonist_F",nil,12500],
			["U_I_G_resistanceLeader_F",nil,15000],
			["U_O_SpecopsUniform_ocamo",nil,17500],
			["U_O_PilotCoveralls",nil,20000],
			["U_IG_leader","Guerilla Leader",22500],
			["U_IG_Guerilla3_1",nil,42500],
			["U_IG_Guerilla2_3",nil,52500],
			["U_IG_Guerilla3_2",nil,32500],
			["U_O_CombatUniform_oucamo",nil,42500],
			["U_I_CombatUniform_tshirt",nil,52500],
			["U_B_PilotCoveralls",nil,22500],
			["U_O_GhillieSuit",nil,100000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_ShemagOpen_tan",nil,5000],
			["H_Shemag_olive",nil,5000],
			["H_ShemagOpen_khk",nil,5000],
			["H_HelmetO_ocamo",nil,5000],
			["H_MilCap_oucamo",nil,5000],
			["H_HelmetB_camo",nil,5000],
			["H_HelmetB_paint",nil,5000],
			["H_HelmetCrew_I",nil,5000],
			["H_HelmetSpecB",nil,5000],
			["H_PilotHelmetHeli_O",nil,5000],
			["H_Bandanna_camo",nil,5000]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_TacVest_khk",nil,25000],
			["V_BandollierB_cbr",nil,25000],
			["V_HarnessO_brn",nil,25000],
			["V_PlateCarrier1_blk","Anti Gas Weste",250000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2500],
			["B_Kitbag_mcamo",nil,4500],
			["B_TacticalPack_oli",nil,3500],
			["B_FieldPack_ocamo",nil,3000],
			["B_Bergen_sgg",nil,4500],
			["B_Kitbag_cbr",nil,4500],
			["B_Carryall_oli",nil,5000],
			["B_Carryall_khk",nil,5000]
		];
	};
};