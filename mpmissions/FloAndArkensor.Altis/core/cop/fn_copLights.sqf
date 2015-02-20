/*
	File: fn_copLights.sqf
	Author: mindstorm, modified by RafiQuak
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	
	Description:
	Adds an single light effect to cop and medic vehicles.
*/
Private ["_vehicle","_lightBlue","_light","_lightOn"];
_vehicle = _this select 0;
	
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};
_lightBlue = [0.1, 0.1, 20];

_light = "#lightpoint" createVehicle getpos _vehicle;   
sleep 0.2;
_light setLightColor _lightBlue; 
_light setLightBrightness 0.2;  
_light setLightAmbient [0.1,0.1,1];

    /*
		[x, y, z]
	
       ^      <--------- y -------->       _
	   |            ___________             |
	   |           /           \          /
	   z     _____/             \       x
	   |    |                    \     /
	   |    |____________________|   |_
       v
	*/

switch (typeOf _vehicle) do
{
	case "C_Offroad_01_F":
	{
		_light lightAttachObject [_vehicle, [0.0, 0.0, 0.56]];
	};
	
	case "C_SUV_01_F":
	{
		_light lightAttachObject [_vehicle, [0.0,-0.6,0.42]];
	};
		
	case "B_MRAP_01_F":
	{
		_light lightAttachObject [_vehicle, [0, -0.9, 0.55]];
	};
	
	case "B_MRAP_01_hmg_F":
	{
		_light lightAttachObject [_vehicle, [0, -0.9, 0.55]];
	};
	
	
	case "C_Hatchback_01_sport_F":
	{
		_light lightAttachObject [_vehicle, [0,-0.1,0.3]];
	};
	
	case "C_Hatchback_01_F":
	{
		_light lightAttachObject [_vehicle, [0,-0.1,0.3]];
	};
	
	case "I_MRAP_03_F":
	{
		_light lightAttachObject [_vehicle, [0.0, 0.0, 0.56]];
	};
	
	case "I_MRAP_03_hmg_F":
	{
		_light lightAttachObject [_vehicle, [0.0, 0.0, 0.56]];
	};
			
	case "B_Heli_Light_01_F":
	{
		_light lightAttachObject [_vehicle, [0.0, 0.0, -0.95]];
	};
	
	case "B_Heli_Transport_01_F":
	{
		_light lightAttachObject [_vehicle, [0.0, 0.6, -1.0]];
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		_light lightAttachObject [_vehicle, [0.0, 0.0,-0.95]];
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		_light lightAttachObject [_vehicle, [0.0, 0.0,-0.95]];
	};
		
};

_light setLightAttenuation [0.181, 0, 1000, 130]; 
_light setLightIntensity 10;
_light setLightFlareSize 0.38;
_light setLightFlareMaxDistance 150;
_light setLightUseFlare true;


//ARE YOU ALL HAPPY?!?!?!?!?!?!?!?!?%#?@WGD?TGD?BN?ZDHBFD?GA
_light setLightDayLight true;

_lightOn = false;  
while{ (alive _vehicle)} do  
{  
	if(!(_vehicle getVariable "lights")) exitWith {};
	if(_lightOn) then  
	{  
		_lightOn = false;
		_light setLightBrightness 0.0;
	}  
		else  
	{  
		_lightOn = true;  
		_light setLightBrightness 6;
	};  
	sleep (_this select 1);  
};  
deleteVehicle _light;