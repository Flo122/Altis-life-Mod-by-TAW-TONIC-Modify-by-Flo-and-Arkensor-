private["_craft","_return"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
	case "weapon":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],
				["hgun_P07_F", ["life_inv_ironr",10,"life_inv_copperr",1,"life_inv_silberp",3]],
				["arifle_Katiba_F", ["life_inv_ironr",9,"life_inv_copperr",4,"life_inv_silberp",12]],
				["srifle_EBR_F", ["life_inv_ironr",3,"life_inv_copperr",7,"life_inv_silberp",15]],
				["arifle_TRG21_F", ["life_inv_ironr",5,"life_inv_copperr",10,"life_inv_silberp",2]],
				["LMG_Zafir_F", ["life_inv_ironr",7,"life_inv_copperr",8,"life_inv_silberp",10]]

			];
	};
	
	case "ammo":
	{
	
		_return = [
		
				["20Rnd_762x51_Mag", ["life_inv_schwefelp",3,"life_inv_ironr",1,"life_inv_spulver",2]],
				["30Rnd_65x39_caseless_green", ["life_inv_schwefelp",2,"life_inv_ironr",1,"life_inv_spulver",2]],
				["5Rnd_127x108_Mag", ["life_inv_schwefelp",5,"life_inv_ironr",2,"life_inv_spulver",4]],
				["200Rnd_65x39_cased_Box", ["life_inv_schwefelp",5,"life_inv_ironr",2,"life_inv_spulver",2]]

		];
	
	};
	case "uniform":
	{
		_return = [
				["U_IG_Guerilla1_1", ["life_inv_baumwollep",6]],
				["U_I_G_resistanceLeader_F", ["life_inv_baumwollep",8]],
				["U_O_SpecopsUniform_ocamo", ["life_inv_baumwollep",10]],
				["U_O_CombatUniform_oucamo", ["life_inv_baumwollep",14]],
				["U_B_PilotCoveralls", ["life_inv_baumwollep",16]],
				["U_IG_leader", ["life_inv_baumwollep",18]],
				["U_O_GhillieSuit", ["life_inv_baumwollep",20]]
			
			
			
			];
	};
	case "Westen":
	{
		_return = [
				["V_PlateCarrier1_blk", ["life_inv_baumwollep",16,"life_inv_ironr",5]],
				["V_HarnessO_brn", ["life_inv_baumwollep",18]],
				["V_BandollierB_cbr", ["life_inv_baumwollep",18]],
				["V_TacVest_khk", ["life_inv_baumwollep",18]]
			];
	};

	case "backpack":
	{
		_return = [
				["B_Carryall_oli", ["life_inv_baumwollep",20]],
				["B_AssaultPack_cbr", ["life_inv_baumwollep",9]],
				["B_TacticalPack_oli", ["life_inv_baumwollep",13]],
				["B_Bergen_sgg", ["life_inv_baumwollep",15]],
				["B_Kitbag_cbr", ["life_inv_baumwollep",16]]

			];
	};


};

_return; 