/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

////////////MAIN CONFIG

life_market_resources = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],
		
	["oilp", 2960, 200, 17940, 2, 2, 
		[ 
			["diamondc",1], 
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1], 
			["schwefelp",1]
		] 
	],
	
	["iron_r", 3200, 200, 8650, 1, 2,  
		[ 
			["diamondc",1], 
			["oilp",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1], 
			["schwefelp",1]

		] 
	],
	
	["diamondc", 3566, 200, 14500, 2, 2, 
		[ 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1],
			["schwefelp",1]

		] 
	],
	
	["copper_r", 3700, 200, 5750, 1, 2, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1]

		] 
	],
	
	["salt_r", 4750, 200, 6350, 1, 2, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["cement",1],
			["glass",1]
		] 
	],
	
	["glass", 3300, 200, 9800, 2, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["schwefelp",1]
		] 
	],
	
	["cement", 3347, 200, 9350, 2, 2, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1],
			["schwefelp",1]
		] 
	],
	["schwefelp", 3222, 200, 10350, 2, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1]
		] 
	],
	
	["silberp", 3966, 200, 11350, 2, 2, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1]
		] 
	],

	["holzp", 3200, 200, 11350, 2, 2, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1]
			
		] 
	],
	["eisenp", 5900, 200, 10350, 2, 2, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1]
		] 
	],
	["apple", 30, 25, 350, 2, 1, 
		[ 
			["peach",1], 
			["zuckerp",1]
		] 
	],
	///////////////////////////////////
	
	["turtle", 30000, 25000, 48000, 20, 18,  
		[ 
			["marijuana",1], 
			["cocainep",1],
			["heroinp",1],
			["pkugel",1],
			["pbrau",1]
		
		] 
	],
	
	["marijuana", 4300, 200, 26900, 2, 3,   
		[ 
			["turtle",1], 
			["cocainep",1],
			["heroinp",1]

			
		] 
	],
	
	["cocainep", 5200, 200, 13300, 3, 3,   
		[ 
			["marijuana",1], 
			["turtle",1],
			["heroinp",1],
			["pkugel",1],
			["pbrau",1]
		] 
	],
	
	["heroinp", 7800, 200, 11200, 2, 4,   
		[ 
			["marijuana",1], 
			["cocainep",1],
			["turtle",1]

		] 
	],

	["pkugel", 46800, 3000, 140200, 11, 8,   
		[ 
			["marijuana",1], 
			["cocainep",1],
			["turtle",1],
			["uran5",1]
		] 
	],
	["uran5", 42800, 20000, 70200, 2, 4,   
		[ 
			["pkugel",1], 
			["pbrau",1]

			
		] 
	],
	["pbrau", 16800, 3000, 100200, 1, 2,   
		[ 
			["marijuana",1], 
			["cocainep",1],
			["turtle",1],
			["pkugel",1],
			["uran5",1]
		] 
	]
	
	
	
];
publicVariable "life_market_resources";
 
////////////GENERATED CONFIG
//life_market_changes = []; //[SHORTNAME,SELL,BUY]
life_market_shortnames = []; //shortnames if in market
//life_market_clampprices = []; //[SHORTNAME,MIN,MAX]
 
{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
	//life_market_clampprices set [count life_market_clampprices, [_x select 0, _x select 2, _x select 3] ];
	//life_market_changes set [count life_market_changes, [_x select 0, _x select 4, _x select 5] ];
}
foreach life_market_resources;
 
publicVariable "life_market_shortnames";
//publicVariable "life_market_clampprices";
 
////////////SYNC PRICES WITH SERVER IF EMPTY
//if(isNil("life_market_prices")) then
//{
	life_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{
	
		life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
	}
	foreach life_market_resources;
	
	publicVariable "life_market_prices";
	
	
//};