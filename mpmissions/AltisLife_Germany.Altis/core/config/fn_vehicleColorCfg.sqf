/*
    File: fn_vehicleColorCfg.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Master configuration for vehicle colors.
*/
    private["_vehicle","_ret","_path"];
    _vehicle = [_this,0,"",[""]] call BIS_fnc_param;
    if(_vehicle == "") exitWith {[]};
    _ret = [];
     
    switch (_vehicle) do
    {
            // Quad
            case "B_Quadbike_01_F":
            {
                    _ret =
                    [
                            ["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
                            ["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
                            ["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
                            ["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
                            ["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
                            ["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
                            ["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
                            ["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"]
                    ];
            };
            // Offroader
            case "C_Offroad_01_F":
            {
                    _ret =
                    [
                            ["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa","civ"],
                            ["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa","civ"],
                            ["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa","civ"],
                            ["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
                            ["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
                            ["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
                            ["textures\cop\cop_offroad.paa","cop"],
                            ["textures\medic\medic_offroad.paa","med"],
                            ["\A3\soft_f_gamma\Offroad_01\Data\offroad_01_ext_ig01_co.paa","reb"],
                            ["textures\civ\civ_offroad_dodge.paa","civ"],
                            ["textures\civ\civ_offroad_gamer.paa","civ"],
                            ["textures\civ\civ_offroad_taxi.paa","civ"],
                            ["textures\civ\civ_offroad_tuerkis.paa","civ"],
                            ["textures\civ\civ_offroad_gruen.paa","civ"],
                            ["textures\rebel\rebel_offroad.paa","reb"],
							["textures\civ\civ_offroad_braun.paa","civ"],
							["textures\ASF\ASF_offroad.paa","ASF"]
                    ];
            };
            // Hatchback
            case "C_Hatchback_01_F":
            {
                    _ret =
                    [
                            ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
                            ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
                            ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
                            ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
                            ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
                            ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
                            ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
                            ["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"],
                            ["textures\civ\civ_hatchback_fire.paa","civ"],
                            ["textures\civ\civ_hatchback_metallica.paa","civ"],
                            ["textures\cop\cop_hatchback.paa","cop"],
							["textures\civ\civ_hatchback_taxi.paa","civ"]	                           
                    ];
            };
            // Hatchback Sport
            case "C_Hatchback_01_sport_F":
            {
                    _path = "\a3\soft_f_gamma\Hatchback_01\data\";
                    _ret =
                    [
                            [_path + "hatchback_01_ext_sport01_co.paa","civ"],
                            [_path + "hatchback_01_ext_sport02_co.paa","civ"],
                            [_path + "hatchback_01_ext_sport03_co.paa","civ"],
                            [_path + "hatchback_01_ext_sport04_co.paa","civ"],
                            [_path + "hatchback_01_ext_sport05_co.paa","civ"],
                            [_path + "hatchback_01_ext_sport06_co.paa","civ"],
                            ["textures\civ\civ_hatchback_fire.paa","civ"],
                            ["textures\civ\civ_hatchback_metallica.paa","civ"],
                            [_path + "hatchback_01_ext_sport04_co.paa","cop"],
                            ["textures\cop\cop_hatchback.paa","cop"],
							["textures\civ\civ_hatchback_taxi.paa","civ"]	
                    ];
            };     
            // SUV
			case "C_SUV_01_F":
			{
				_ret =
				[
					["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
					["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
					["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
					["textures\cop\cop_suv.paa","cop"],
					["textures\medic\medic_suv.paa","med"],
					["textures\civ\civ_suv_blau.paa","civ"],
					["textures\civ\civ_suv_carbon.paa","civ"],
					["textures\civ\civ_suv_carbonwhite.paa","civ"],
					["textures\civ\civ_suv_tuerkis.paa","civ"],
					["textures\civ\civ_suv_ferrari.paa","civ"],
					["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","civ"],
					["textures\civ\civ_suv_gruen.paa","civ"],
					["textures\rebel\rebel_suv.paa","reb"],
					["textures\civ\civ_suv_monster.paa","civ"],
					["textures\cop\sek_suv.paa","cop"],
					["textures\civ\civ_suv_alg.paa","civ"],
					["textures\civ\civ_suv_braun.paa","civ"],
					["textures\civ\civ_suv_gelb.paa","civ"],
					["textures\civ\civ_suv_dunkelgrün.paa","civ"]
				];
			};
            // Truck
            case "C_Van_01_transport_F":
            {
                    _ret =
                    [
                            ["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
                            ["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
                    ];
            };
            // Truck Box
            case "C_Van_01_box_F":
            {
                    _ret =
                    [
                            ["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
                            ["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
                            ["textures\medic\medic_truck_0.paa","med","textures\medic\medic_truck_1.paa"]
                    ];
            };
            // Truck Fuel
            case "C_Van_01_fuel_F":
            {
                    _ret =
                    [
                            ["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
                            ["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
                    ];
            };
            // Zamak
            case "I_Truck_02_covered_F":
            {
                    _ret =
                    [
                            ["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
                            ["textures\civ\civ_zamak_weed_0.paa","civ","textures\civ\civ_zamak_weed_1.paa"],
                            ["textures\civ\civ_zamak_ereka_0.paa","civ","textures\civ\civ_zamak_ereka_1.paa"],
                            ["textures\civ\civ_zamak_redbull_0.paa","civ","textures\civ\civ_zamak_redbull_1.paa"]                  
                    ];
            };
            // Zamak
            case "I_Truck_02_transport_F":
            {
                    _ret =
                    [
                            ["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
                            ["textures\civ\civ_zamak_weed_0.paa","civ","textures\civ\civ_zamak_weed_1.paa"],
                            ["textures\civ\civ_zamak_ereka_0.paa","civ","textures\civ\civ_zamak_ereka_1.paa"],
                            ["textures\civ\civ_zamak_redbull_0.paa","civ","textures\civ\civ_zamak_redbull_1.paa"] 
                    ];
            };
            // HEMTT
            case "B_Truck_01_box_F":
            {
                    _ret =
                    [
                            ["\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa","civ","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
                            ["textures\civ\civ_hemtt_kitty_0.paa","civ","textures\civ\civ_hemtt_kitty_1.paa","textures\civ\civ_hemtt_kitty_1.paa"],
                            ["textures\civ\civ_hemtt_devil_0.paa","civ","textures\civ\civ_hemtt_devil_1.paa","textures\civ\civ_hemtt_devil_1.paa"]
                    ];
            };
            // HEMTT
            case "B_Truck_01_covered_F":
            {
                    _ret =
                    [
                            ["\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa","civ","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
                            ["textures\civ\civ_hemtt_kitty_0.paa","civ","textures\civ\civ_hemtt_kitty_1.paa","textures\civ\civ_hemtt_kitty_1.paa"],
                            ["textures\civ\civ_hemtt_devil_0.paa","civ","textures\civ\civ_hemtt_devil_1.paa","textures\civ\civ_hemtt_devil_1.paa"]
                    ];
            };
            // HEMTT
            case "B_Truck_01_transport_F":
            {
                    _ret =
                    [
                            ["\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa","civ","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
                            ["textures\civ\civ_hemtt_kitty_0.paa","civ","textures\civ\civ_hemtt_kitty_1.paa","textures\civ\civ_hemtt_kitty_1.paa"],
                            ["textures\civ\civ_hemtt_devil_0.paa","civ","textures\civ\civ_hemtt_devil_1.paa","textures\civ\civ_hemtt_devil_1.paa"]
                    ];
            };     
            // HEMTT
            case "B_Truck_01_ammo_F":
            {
                    _ret =
                    [
                            ["textures\civ\civ_hemtt_radio_0.paa","civ","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa","textures\civ\civ_hemtt_radio_2.paa"]
                    ];
            };
            // Hummingbird
            case "B_Heli_Light_01_F":
            {
                    _ret =
                    [
                            ["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","civ"],
                            ["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","reb"],
                            ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
                            ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
                            ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
                            ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
                            ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
                            ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
                            ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
                            ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
                            ["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
                            ["textures\cop\cop_hummingbird.paa","cop"],
                            ["textures\medic\medic_hummingbird.paa","med"],
                            ["textures\civ\civ_hummingbird_redbull.paa","civ"],
                            ["textures\rebel\rebel_hummingbird.paa","reb"],
							["textures\ASF\ASF_Hummingbird.paa","ASF"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa","civ"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa","civ"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa","civ"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","civ"],
							["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"],
							["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"]
                    ];
            };
            // Orca
            case "O_Heli_Light_02_unarmed_F":
            {
                    _ret =
                    [
                            ["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","civ"],
                            ["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
                            ["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","civ"],
                            ["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
                            ["textures\cop\cop_orca.paa","cop"],
                            ["textures\medic\medic_orca.paa","med"],
                            ["textures\rebel\rebel_orca.paa","reb"],
							["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","ASF"],
							["textures\civ\civ_orca_seven.paa","civ"]
                    ];
            };
            // Ghosthawk
            case "B_Heli_Transport_01_F":
            {
                    _ret =
                    [
                            ["textures\cop\cop_ghosthawk_0.paa","cop","textures\cop\cop_ghosthawk_1.paa"],
                            ["textures\cop\sek_ghosthawk_0.paa","cop","textures\cop\sek_ghosthawk_1.paa"]
                    ];
            };
            // Hellcat
            case "I_Heli_light_03_unarmed_F":
            {
                    _ret =
                    [
                            ["textures\cop\cop_hellcat.paa","cop"],
                            ["textures\donator\donator_hellcat.paa","civ"],
                            ["\a3\air_f_epb\Heli_Light_03\Data\heli_light_03_base_indp_co.paa","reb"],
							["textures\ASF\ASF_hellcat.paa","ASF"]
                    ];
            };
            // Mohawk
            case "I_Heli_Transport_02_F":
            {
                    _path = "\a3\air_f_beta\Heli_Transport_02\Data\";
                    _ret =
                    [
                            [_path + "Skins\heli_transport_02_1_ion_co.paa","civ",_path + "Skins\heli_transport_02_2_ion_co.paa",_path + "Skins\heli_transport_02_3_ion_co.paa"],
                            [_path + "Skins\heli_transport_02_1_dahoman_co.paa","civ",_path + "Skins\heli_transport_02_2_dahoman_co.paa",_path + "Skins\heli_transport_02_3_dahoman_co.paa"],
                            [_path + "heli_transport_02_1_indp_co.paa","reb",_path + "heli_transport_02_2_indp_co.paa",_path + "heli_transport_02_3_indp_co.paa"]
                    ];
            };             
            // Hunter
            case "B_MRAP_01_F":
            {
			    _ret =
                [
					["textures\cop\cop_hunter_0.paa","cop","textures\cop\cop_hunter_1.paa"],
					["\a3\soft_f\MRAP_01\Data\mrap_01_base_co.paa","civ","\a3\soft_f\MRAP_01\Data\mrap_01_adds_co.paa"],
					["\a3\soft_f\MRAP_01\Data\mrap_01_base_co.paa","civ","\a3\soft_f\MRAP_01\Data\mrap_01_adds_co.paa"],
					["textures\donator\donator_hunter_rot_0.paa","civ","textures\donator\donator_hunter_1.paa"],
					["textures\donator\donator_hunter_blau_0.paa","civ","textures\donator\donator_hunter_1.paa"],
					["textures\donator\donator_hunter_gruen_0.paa","civ","textures\donator\donator_hunter_1.paa"],
					["textures\donator\donator_hunter_grau_0.paa","civ","textures\donator\donator_hunter_1.paa"],
					["textures\cop\sek_hunter_0.paa","cop","textures\cop\sek_hunter_1.paa"],
					["textures\ASF\ASF_Hunter_0.paa","ASF","textures\ASF\ASF_Hunter_1.paa"]
				];
            };
            // HunterHMG
            case "B_MRAP_01_hmg_F":
            {
                    _ret =
                    [
                            ["textures\cop\cop_hunter_0.paa","cop","textures\cop\cop_hunter_1.paa","textures\cop\cop_hmg.paa"]
                    ];
            };     
            // Ifrit       
            case "O_MRAP_02_F":
            {
                    _ret =
                    [
                            ["textures\rebel\rebel_ifrit_braun_0.paa","reb","textures\rebel\rebel_ifrit_braun_1.paa"],
                            ["textures\rebel\rebel_ifrit_grau_0.paa","reb","textures\rebel\rebel_ifrit_grau_1.paa"],
							["\a3\soft_f\MRAP_02\Data\mrap_02_ext_01_co.paa","reb","\a3\soft_f\MRAP_02\Data\mrap_02_ext_02_co.paa"],
                            ["textures\rebel\rebel_ifrit_blau_0.paa","reb","textures\rebel\rebel_ifrit_blau_1.paa"],
							["textures\rebel\rebel_ifrit_rot_0.paa","reb","textures\rebel\rebel_ifrit_rot_1.paa"]
                    ];
            };
            // Strider     
            case "I_MRAP_03_F":
            {
                    _ret =
                    [
                            ["textures\cop\sek_strider.paa","cop"],
							["textures\cop\cop_strider.paa","cop"]
                    ];
            };
			
			// Strider HMG    
            case "I_MRAP_03_hmg_F":
            {
                    _ret =
                    [
                            ["textures\cop\sek_strider.paa","cop","textures\cop\sek_hmg.paa"]
                    ];
            };
			
			// Schlauchboot    
            case "B_Lifeboat":
            {
                    _ret =
                    [
                            ["textures\cop\cop_schlauchboot.paa","cop"]
                    ];
            };
			
			// Minigunboot    
            case "B_Boat_Armed_01_minigun_F":
            {
                    _ret =
                    [
                            ["textures\cop\cop_gunboot.paa","cop"]
                    ];
            };
			
			// Speedboot    
            case "C_Boat_Civil_01_police_F":
            {
                    _ret =
                    [
                            ["textures\cop\cop_speedboot.paa","cop"]
                    ];
            };
			// U-boot   
            case "B_SDV_01_F":
            {
                    _ret =
                    [
                            ["textures\cop\cop_uboot.paa","cop"]
                    ];
            };
    }; 
_ret;