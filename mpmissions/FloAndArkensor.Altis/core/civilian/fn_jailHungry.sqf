/*
	File: fn_jailHungry.sqf
	Edited by: Sven 'sleuny' Leunig - BHP
	
	Description:
	Addaction zum Ernähren im Gefängnis
*/
private["_jailhungry"];
_jailhungry = _this select 3;

switch (_jailhungry) do
{
	case "wasser":
	{
			life_thirst = 100;
			[] call life_fnc_hudUpdate;
			player setFatigue 0;
			hint "Warmes Mineralwasser .... immerhin musst du nicht verdursten";
	};
	
	case "bohnen":
	{
			life_hunger = 100;
			[] call life_fnc_hudUpdate;
			player setFatigue 0;
			hint "Die Bohnen waren nicht die besten, aber dein Hunger ist gestillt";
	};

	case "reis":
	{
			life_hunger = 100;
			[] call life_fnc_hudUpdate;
			player setFatigue 0;
			hint "Trockener Reis, macht zwar satt, du fühlst dich aber als hättest du Steine im Bauch";
	};
};