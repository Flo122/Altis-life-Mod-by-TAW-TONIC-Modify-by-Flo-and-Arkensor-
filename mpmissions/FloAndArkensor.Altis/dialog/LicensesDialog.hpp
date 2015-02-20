class LicenseShop {
idd = 5546;
name= "life_license_shop";
movingEnable = false;
enableSimulation = true;
onLoad = "uiNamespace setVariable [""Lizenzverkauf"", _this select 0];";
objects[] = { };

	class controls {
	 
		class RscTitleBackground : Life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			text = "Lizenzen";
			x = 0.285;
			y = 0.2;
			w = 0.41;
			h = 0.04;
		};
		 
		class Mainbackground : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.285;
			y = 0.244;
			w = 0.41;
			h = 0.52;
		};
		
		class listbox: Life_RscListBox
		{
			idc = 55126;
			sizeEx = 0.035;
			x = 0.295;
			y = 0.3;
			w = 0.385;
			h = 0.4;
		};
		
		class MyLicenses : Life_RscText
		{
			idc = 55130;
			text = "Verfügbar";
			x = 0.285;
			y = 0.24;
			w = 0.1375;
			h = 0.04;
		};
		
		class buybutton: Life_RscButtonMenu
		{
			idc = 55127;
			text = "$STR_Global_Buy";
			x = 0.415;
			y = 0.71;
			w = 0.15;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
			action = "if( (lbData[55126,lbCurSel (55126)] != """") ) then { [false, false, false, lbData[55126,lbCurSel (55126)]] call life_fnc_buyLicense; closeDialog 0;}";
		};
	};
};