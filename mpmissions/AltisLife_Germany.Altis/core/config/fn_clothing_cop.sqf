#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

//Shop Title Name
ctrlSetText[3103,"Kleidungsladen"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_B_CombatUniform_mcam","Streife",800];
		if(__GETC__(life_coplevel) >= 3) then
		{
			_ret pushBack ["U_B_CombatUniform_mcam_worn","Einsatz",1000];
		};
		if(__GETC__(life_coplevel) >= 3) then
		{
			_ret pushBack ["U_B_Wetsuit",nil,4000];
		};
		if(license_cop_sek) then
		{
			_ret pushBack ["U_B_CombatUniform_mcam_vest","SEK",100];
		};
		if(__GETC__(life_coplevel) >= 8) then
		{
			_ret pushBack ["U_C_Poloshirt_blue","Poloshirt Blue",250];
			_ret pushBack ["U_C_Poloshirt_burgundy","Poloshirt Burgundy",275];
			_ret pushBack ["U_C_Poloshirt_redwhite","Poloshirt Red/White",150];
			_ret pushBack ["U_C_Poloshirt_salmon","Poloshirt Salmon",175];
			_ret pushBack ["U_C_Poloshirt_stripped","Poloshirt stripped",125];
			_ret pushBack ["U_C_Poloshirt_tricolour","Poloshirt Tricolor",350];
			_ret pushBack ["U_C_Poor_2","Rag tagged clothes",250];
			_ret pushBack ["U_IG_Guerilla2_2","Green stripped shirt & Pants",650];
			_ret pushBack ["U_IG_Guerilla3_1","Brown Jacket & Pants",735];
			_ret pushBack ["U_IG_Guerilla2_3","The Outback Rangler",1200];
			_ret pushBack ["U_C_HunterBody_grn","The Hunters Look",1500];
			_ret pushBack ["U_C_WorkerCoveralls","Mechanic Coveralls",2500];
			_ret pushBack ["U_OrestesBody","Surfing On Land",1100];
			_ret pushBack ["U_NikosAgedBody","Casual Wears",5000];
		};
	};
	
	//Hats
	case 1:
	{
		_ret pushBack ["H_Booniehat_khk_hs",nil,75];
		_ret pushBack ["H_Cap_blk",nil,75];
		if(license_cop_sek) then
		{
			_ret pushBack ["H_Beret_blk",nil,100];
			_ret pushBack ["H_HelmetSpecB_blk",nil,100];
		};
		if(__GETC__(life_coplevel) >= 3) then
		{
			_ret pushBack ["H_Beret_blk_POLICE",nil,120];
		};
		if(__GETC__(life_coplevel) >= 7) then
		{
			_ret pushBack ["H_Beret_02","Chef!",120];
		};		
		if(__GETC__(life_coplevel) == 8) then
		{
			_ret pushBack ["H_Bandanna_camo","Camo Bandanna",120];
			_ret pushBack ["H_Bandanna_surfer","Surfer Bandanna",130];
			_ret pushBack ["H_Bandanna_gry","Grey Bandanna",150];
			_ret pushBack ["H_Bandanna_cbr",nil,165];
			_ret pushBack ["H_Bandanna_surfer",nil,135];
			_ret pushBack ["H_Bandanna_khk","Khaki Bandanna",145];
			_ret pushBack ["H_Bandanna_sgg","Sage Bandanna",160];
			_ret pushBack ["H_StrawHat","Straw Fedora",225];
			_ret pushBack ["H_BandMask_blk","Hat & Bandanna",300];
			_ret pushBack ["H_Booniehat_tan",nil,425];
			_ret pushBack ["H_Hat_blue",nil,310];
			_ret pushBack ["H_Hat_brown",nil,276];
			_ret pushBack ["H_Hat_checker",nil,340];
			_ret pushBack ["H_Hat_grey",nil,280];
			_ret pushBack ["H_Hat_tan",nil,265];
			_ret pushBack ["H_Cap_blu",nil,150];
			_ret pushBack ["H_Cap_grn",nil,150];
			_ret pushBack ["H_Cap_grn_BI",nil,150];
			_ret pushBack ["H_Cap_oli",nil,150];
			_ret pushBack ["H_Cap_red",nil,150];
			_ret pushBack ["H_Cap_tan",nil,150];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
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
		
		if(license_cop_sek) then
		{
		_ret pushBack ["G_Balaclava_blk","SEK",55];
		};
		
		if(__GETC__(life_coplevel) >= 3) then
		{
			_ret pushBack ["G_Diving",nil,10];
		};		

	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,1000];
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["V_PlateCarrier1_blk","Anti Gas Weste",2500];
		};
		
		if(__GETC__(life_coplevel) >= 3) then
		{
			_ret pushBack ["V_RebreatherB",nil,5000];
		};
	};
	
	//Backpacks
	case 4:
	{
		if(__GETC__(life_coplevel) >= 1) then
		{
			_ret pushBack ["B_Carryall_mcamo",nil,1000];
			_ret pushBack ["B_Parachute","Fallschirm",2000];
		};
		if(__GETC__(life_coplevel) >= 6) then
		{
		_ret pushBack ["B_UAV_01_backpack_F","Drohne",10000];
		};
	};
};

_ret;