#include <macro.h>
/*
	File: fn_seizeCfg.sqf
	Author: Tabakhase
	Slightly adapted by Daniel Larusso (Keep Calm and Roleplay)
	
	Description:
	Master configuration file for seize player everything.
	
	Parameters:
	0 = All
	1 = Weapons
	2 = Uniform
	3 = Backpack
	4 = Vest
	5 = Items
	
	ToDo:
	Adding list 0,2,3,4&5
*/
private["_mode"];
_mode = [_this,0,objNull,[""]] call BIS_fnc_param;

switch(_mode) do
{
	if(license_civ_gun) then
		{
			case 1: {
			[
				// Weapons
				"arifle_TRG21_F",
				"arifle_Mk20_F",
				"arifle_Katiba_F",
				"srifle_DMR_01_F",
				"LMG_Zafir_F",
				"srifle_EBR_F",
				"srifle_LRR_F",
				"hgun_P07_F",
				"hgun_P07_snds_F",
				"SMG_02_F",
				"arifle_MXC_F",
				"arifle_MX_F",
				"arifle_MX_SW_F",
				"arifle_MXM_F",
				"arifle_MXC_Black_F",
				"arifle_MX_Black_F",
				"arifle_MX_SW_Black_F",
				"arifle_MXM_Black_F",
				"srifle_GM6_F",
				
				
				// Mags
				"30Rnd_556x45_Stanag",
				"30Rnd_65x39_caseless_green",
				"10Rnd_762x51_Mag",
				"150Rnd_762x51_Box",
				"20Rnd_762x51_Mag",
				"7Rnd_408_Mag",
				"30Rnd_65x39_caseless_mag",
				"100Rnd_65x39_caseless_mag",
				"5Rnd_127x108_Mag",
				"5Rnd_127x108_APDS_Mag",
				"HandGrenade_Stone"
				];
			};
		} else {
			case 1: {
			[
				// Weapons
				"arifle_TRG21_F",
				"arifle_Mk20_F",
				"arifle_Katiba_F",
				"srifle_DMR_01_F",
				"LMG_Zafir_F",
				"srifle_EBR_F",
				"srifle_LRR_F",
				"hgun_P07_F",
				"hgun_P07_snds_F",
				"SMG_02_F",
				"arifle_MXC_F",
				"arifle_MX_F",
				"arifle_MX_SW_F",
				"arifle_MXM_F",
				"arifle_MXC_Black_F",
				"arifle_MX_Black_F",
				"arifle_MX_SW_Black_F",
				"arifle_MXM_Black_F",
				"srifle_GM6_F",
				
				
				// Mags
				"30Rnd_556x45_Stanag",
				"30Rnd_65x39_caseless_green",
				"10Rnd_762x51_Mag",
				"150Rnd_762x51_Box",
				"7Rnd_408_Mag",
				"30Rnd_65x39_caseless_mag",
				"100Rnd_65x39_caseless_mag",
				"5Rnd_127x108_Mag",
				"5Rnd_127x108_APDS_Mag",
				"HandGrenade_Stone",
				"optic_ACO_grn",
				"optic_Aco",
				"optic_Holosight",
				"optic_Arco",						
				"optic_Hamr",
				"optic_MRCO",
				"optic_SOS",
				"optic_LRPS",
				"optic_DMS",
				"optic_NVS",
				"acc_pointer_IR",
				"acc_flashlight",
				"hgun_Rook40_F",
				"30Rnd_9x21_Mag",
				"hgun_Pistol_heavy_02_F",
				"6Rnd_45ACP_Cylinder",
				"hgun_ACPC2_F",
				"9Rnd_45ACP_Mag",
				"hgun_Pistol_heavy_01_F",
				"11Rnd_45ACP_Mag",
				"hgun_PDW2000_F",
				"16Rnd_9x21_Mag",
				"30Rnd_9x21_Mag",
				"SMG_01_F",
				"30Rnd_45ACP_Mag_SMG_01",
				"arifle_SDAR_F",
				"20Rnd_556x45_UW_mag",
				"TRG21 5.56mm",
				"arifle_TRG20_F",
				"TRG20 5.56mm",
				"srifle_DMR_01_F",						
				"LMG_Zafir_F",
				"srifle_EBR_F",
				"20Rnd_762x51_Mag",
				"srifle_LRR_F",
				"muzzle_snds_M",
				"muzzle_snds_H",
				"muzzle_snds_B",
				"optic_Yorris",
				"optic_ACO_grn_smg",
				"optic_Holosight_smg"
			];
		};
	};
};