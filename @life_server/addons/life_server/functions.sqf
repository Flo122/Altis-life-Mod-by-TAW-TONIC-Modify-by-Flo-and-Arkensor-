TON_fnc_index =
compileFinal "
	private[""_find"",""_limit"",""_select"",""_array"",""_return""];
	_find = _this select 0;
	_array = _this select 1;

	_limit = (count _array)-1;
	for ""_i"" from 0 to _limit do
	{
		_select = _array select _i;
		if((_find in _select) && (isNil {_return})) then
		{
			_return = _i;
		};
	};

	if(isNil {_return}) then {_return = -1;};
	_return;
";

TON_fnc_player_query =
compileFinal "
	private[""_ret""];
	_ret = _this select 0;
	if(isNull _ret) exitWith {};
	if(isNil ""_ret"") exitWith {};
	
	[[life_atmcash_pirates,life_cash_pirates,owner player,player],""life_fnc_admininfo"",_ret,false] spawn life_fnc_MP;
";
publicVariable "TON_fnc_player_query";

publicVariable "TON_fnc_index";

TON_fnc_clientWireTransfer =
compileFinal "
	private[""_unit"",""_val"",""_from"",""_to""];
	_val = _this select 0;
	_from = _this select 1;
	_to = _this select 2;
	if(!([str(_val)] call TON_fnc_isnumber)) exitWith {};
	if(_from == """") exitWith {};
	life_atmcash_pirates = life_atmcash_pirates + _val;
	hint format[""%1 hat dir $%2 ueberwiesen."",_from,[_val] call life_fnc_numberText];
	[[format[""%1 hat von %2 eine Summe von %3€ ueberwiesen bekommen. Der Kontostand von %1 ist nun %4"",_to,_from,[_val] call life_fnc_numberText,[life_atmcash_pirates] call life_fnc_numberText]],""Arma3Log"",false,false] call life_fnc_MP;
";
publicVariable "TON_fnc_clientWireTransfer";

TON_fnc_isnumber =
compileFinal "
	private[""_valid"",""_value"",""_compare""];
	_value = _this select 0;
	_valid = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
	_array = [_value] call KRON_StrToArray;
	_return = true;
	
	{
		if(_x in _valid) then	
		{}
		else
		{
			_return = false;
		};
	} foreach _array;
	_return;
";

publicVariable "TON_fnc_isnumber";

TON_fnc_clientGangKick =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		life_my_gang = ObjNull;
		[player] joinSilent (createGroup civilian);
		hint ""Du wurdest aus der Gang entfernt."";
		
	};
";
publicVariable "TON_fnc_clientGangKick";

TON_fnc_clientGetKey =
compileFinal "
	private[""_vehicle"",""_unit"",""_giver""];
	_vehicle = _this select 0;
	_unit = _this select 1;
	_giver = _this select 2;
	if(isNil ""_unit"" OR isNil ""_giver"") exitWith {};
	if(player == _unit && !(_vehicle in life_vehicles)) then
	{
		_name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
		hint format[""%1 hat dir die Schluessel fuer %2 gegeben"",_giver,_name];
		life_vehicles pushBack _vehicle;
		[[getPlayerUID player,playerSide,_vehicle,1],""TON_fnc_keyManagement"",false,false] spawn life_fnc_MP;
	};
";

publicVariable "TON_fnc_clientGetKey";

TON_fnc_clientGangLeader =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		player setRank ""COLONEL"";
		_group selectLeader _unit;
		hint ""Du bist der neue Anfuehrer."";
	};
";

publicVariable "TON_fnc_clientGangLeader";

//Cell Phone Messaging
/*
	-fnc_cell_textmsg
	-fnc_cell_textcop
	-fnc_cell_textadmin
	-fnc_cell_adminmsg
	-fnc_cell_adminmsgall
*/

//To One Person
TON_fnc_cell_textmsg =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3015,false];
	_msg = ctrlText 3003;
	if(lbCurSel 3004 == -1) exitWith {hint ""Du musst einen Spieler auswählen!""; ctrlShow[3015,true];};
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {ctrlShow[3015,true];};
	if(isNil ""_to"") exitWith {ctrlShow[3015,true];};
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben!"";ctrlShow[3015,true];};
	
	[[_msg,name player,0],""TON_fnc_clientMessage"",_to,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Du hast %1 eine Nachricht gesendet: %2"",name _to,_msg];
	ctrlShow[3015,true];
";
//To All Cops
TON_fnc_cell_textcop =
compileFinal "
	private[""_msg"",""_to""];
	if(({side _x == west} count playableUnits) == 0) exitWith {hint ""Die Polizei ist derzeit nicht zu erreichen. Bitte versuchen Sie es später nochmal.""};
	ctrlShow[3016,false];
	_msg = ctrlText 3003;
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben!"";ctrlShow[3016,true];};
		
	[[_msg,name player,1],""TON_fnc_clientMessage"",true,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Du hast der Polizei eine Nachricht geschickt: %1"",_msg];
	ctrlShow[3016,true];
";
//To All Admins
TON_fnc_cell_textadmin =
compileFinal "
	private[""_msg"",""_to"",""_from""];
	ctrlShow[3017,false];
	_msg = ctrlText 3003;
	_to = ""The Admins"";
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben!"";ctrlShow[3017,true];};
		
	[[_msg,name player,2],""TON_fnc_clientMessage"",true,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Du hast dem Admin %1 eine Nacricht gesendet: %2"",_to,_msg];
	ctrlShow[3017,true];
";
//Admin To One Person
TON_fnc_cell_adminmsg =
compileFinal "
	if(isServer) exitWith {};
	if((call life_adminlevel) < 1) exitWith {hint ""Du bist kein Admin!"";};
	private[""_msg"",""_to""];
	_msg = ctrlText 3003;
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {};
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben!"";};
	
	[[_msg,name player,3],""TON_fnc_clientMessage"",_to,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Adminnachricht versendet an: %1 - Nachricht: %2"",name _to,_msg];
";
//Admin to All
TON_fnc_cell_adminmsgall =
compileFinal "
	if(isServer) exitWith {};
	if((call life_adminlevel) < 1) exitWith {hint ""Du bist kein Admin!"";};
	private[""_msg"",""_from""];
	_msg = ctrlText 3003;
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben!"";};
	
	[[_msg,name player,4],""TON_fnc_clientMessage"",true,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Globale Nachricht versendet: %1"",_msg];
";
//To EMS
TON_fnc_cell_emsrequest = 
compileFinal "
	private[""_msg"",""_to""];
	if(({side _x == independent} count playableUnits) == 0) exitWith {hint ""Zurzeit ist kein Arzt im Dienst. Bitte probiere es später nochmal.""};
	ctrlShow[3022,false];
	_msg = ctrlText 3003;
	_to = ""EMS Units"";
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben!"";ctrlShow[3022,true];};
		
	[[_msg,name player,5],""TON_fnc_clientMessage"",independent,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Du hast eine Nachricht an die Sanitäter versendet."",_to,_msg];
	ctrlShow[3022,true];
";
//To ASF
TON_fnc_cell_ASFrequest = 
compileFinal "
	private[""_msg"",""_to""];
	if(({side _x == east} count playableUnits) == 0) exitWith {hint ""Zurzeit ist kein Pannenhelfer im Dienst. Bitte probiere es später nochmal.""};
	ctrlShow[3023,false];
	_msg = ctrlText 3003;
	_to = ""ASF"";
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben!"";ctrlShow[3023,true];};
		
	[[_msg,name player,6],""TON_fnc_clientMessage"",east,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Du hast eine Nachricht an den ASF versendet."",_to,_msg];
	ctrlShow[3023,true];
";
//Admin to All
TON_fnc_cell_copmsgall =
compileFinal "
	if(isServer) exitWith {};
	if((call life_coplevel) < 1) exitWith {hint ""Du bist kein Polizist!"";};
	private[""_msg"",""_from""];
	_msg = ctrlText 888806;
	if(_msg == """") exitWith {hint ""Du musst eine Nachricht eingeben!"";};
	
	[[_msg,name player,7],""TON_fnc_clientMessage"",true,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Polizeirundruf versendet an alle: %1"",_msg];
";

publicVariable "TON_fnc_cell_textmsg";
publicVariable "TON_fnc_cell_textcop";
publicVariable "TON_fnc_cell_textadmin";
publicVariable "TON_fnc_cell_adminmsg";
publicVariable "TON_fnc_cell_adminmsgall";
publicVariable "TON_fnc_cell_emsrequest";
publicVariable "TON_fnc_cell_ASFrequest";
publicVariable "TON_fnc_cell_copmsgall";

//Client Message
/*
	0 = private message
	1 = police message
	2 = message to admin
	3 = message from admin
	4 = admin message to all
*/
TON_fnc_clientMessage =
compileFinal "
	if(isServer) exitWith {};
	private[""_msg"",""_from"", ""_type""];
	_msg = _this select 0;
	_from = _this select 1;
	_type = _this select 2;
	if(_from == """") exitWith {};
	switch (_type) do
	{
		case 0 :
		{
			private[""_message""];
			_message = format["">>>Nachricht von %1: %2"",_from,_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>Private Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			systemChat _message;
		};
		
		case 1 :
		{
			if(side player != west) exitWith {};
			private[""_message""];
			_message = format["">>>Polizeianfrage von %1: %2"",_from,_msg];
			hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Polizeianfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Polizisten<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			systemChat _message;
		};
		
		case 2 :
		{
			if((call life_adminlevel) < 1) exitWith {};
			private[""_message""];
			_message = format["">>>Adminanfrage von %1: %2"",_from,_msg];
			hint parseText format [""<t color='#ffcefe'><t size='2'><t align='center'>Adminanfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Die Administratoren<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			systemChat _message;
		};
		
		case 3 :
		{
			private[""_message""];
			_message = format["">>>Admin Nachricht: %1"",_msg];
			_admin = format[""Gesendet von Admin: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>Einem Admin<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
			
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
		};
		
		case 4 :
		{
			private[""_message"",""_admin""];
			_message = format["">>>Admin Nachricht: %1"",_msg];
			_admin = format[""Von Administrator: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Spieler<br/><t color='#33CC33'>Von: <t color='#ffffff'>Den Administratoren<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
			
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
		};
		
		case 5: {
			private[""_message""];
			_message = format["">>>Sanitaeter Anfrage: %1"",_msg];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Sanitaeter Anfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			systemChat _message;
		};
		
		case 6: {
			private[""_message""];
			_message = format["">>>ASF Anfrage: %1"",_msg];
			hint parseText format [""<t color='#FFFF00'><t size='2'><t align='center'>ASF Anfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			systemChat _message;
		};
		
		case 7 :
		{
			private[""_message"",""_admin""];
			_message = format["">>>Polizeidurchsage: %1"",_msg];
			_admin = format[""Vom Polizisten: %1"", _from];
			hint parseText format [""<t color='#1E90FF'><t size='2'><t align='center'>Polizeidurchsage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Spieler<br/><t color='#33CC33'>Von: <t color='#ffffff'>Der Polizei<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
			
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
		};
		
		case 8 :
		{
			private[""_message"", ""_marker""];
			_message = format[""SMS Alarmanlage von: %1"",_msg];
			hint parseText format [""<t color='#1E90FF'><t size='2'><t align='center'>SMS Alarmanlage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>SMS Alarmanlage<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>In dein Haus bei: %1 wird eingebrochen"",_msg];
			systemChat _message;
			
			_marker = createMarkerLocal [""HouseMarker"", _msg ];
			_marker setMarkerColorLocal ""ColorRed"";
			_marker setMarkerTypeLocal ""Mil_dot"";
			_marker setMarkerTextLocal ""Hier wird eingebrochen"";
			
		};
	};
";
publicVariable "TON_fnc_clientMessage";