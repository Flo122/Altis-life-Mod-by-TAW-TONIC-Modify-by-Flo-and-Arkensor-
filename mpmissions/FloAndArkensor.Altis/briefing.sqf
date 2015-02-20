waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["foreword","Vorwort"];
player createDiarySubject ["serverrules","Serverregeln"];
player createDiarySubject ["behavioral","Verhaltensregeln"];
player createDiarySubject ["penality","Bussgeldkatalog"];
player createDiarySubject ["close","Schlusswort"];

	player createDiaryRecord["foreword",
		[
			"Donator",
				"
				Wir haben auf unserem Server ein Donator-System. Der Donator-Status gilt jeweils fuer einen Monat und ist nach Bezahlung eines Mindestbetrages von 5 Euro verfuegbar. Zahlungen im Voraus werden nicht akzeptiert.<br/>
				Als Donator erhaeltst du Zugriff auf den Donator-Shop und damit auf:<br/>
				- Tempest (Geraet) verguenstigt<br/>
				- Hellcat verguenstigt mit Donator-Skin<br/>
				- Limousine (Sport)<br/>
				- Hunter mit exklusivem Skin<br/>
				- Vergünstigte Waffen<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["foreword",
		[
			"Bank",
				"
				Wir haben die Bank von Altis Life 3.1.3.5 auf dem Server. Diese hat einige grundlegende Neuerungen.<br/>
				Es werden verschiedene Gegenstaende benoetigt:<br/>
				- Bolzenschneider<br/>
				- Sprengladung<br/>
				- ein Landfahrzeug<br/><br/>
				Ein Bankraub laeuft jetzt folgendermassen ab:<br/>
				1. Aufbrechen der Banktueren<br/>
				2. Aufbrechen der Tresorraumtueren<br/>
				3. Aufsprengen des Tresors<br/>
				4. Abtransport der geraubten Goldbarren (nur mit Bodenfahrzeug moeglich)<br/>
				5. Alle Personen innerhalb des markierten Gebietes waehrend eines Bankraubes werden als Bankräuber angesehen und von der Polizei als feindlich eingestuft.
				6. Verkauf der Goldbarren beim Goldhaendler<br/><br/>
				Die Polizei muss die Tueren und den Tresor nach einem Bankraub reparieren, anderenfalls ist die Bank frei zugaenglich. Ist die Sprengladung platziert, erscheint ein Timer, der den Explosionszeitpunkt anzeigt. Die Sprengladung muss vor Ablauf des Timers mithilfe des Bombenentschaerfers entschaerft werden.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["foreword",
		[
			"Changelog",
				"
				Fixed Schwarzmarktlizens Knast sicher<br/>
				Fuel Traker<br/>
				- Balanced<br/>
				- Added Scanner Counter Item<br/>
				- Preis Balance<br/><br/>
				Handschellenschlüssel bei Rebellenlager/Schwarzmarkt <br/>
				Marktsystem Fixed<br/>
				Fuel Balanced <br/>
				Script verbesserung CPU auslastung Fixed<br/>
				"
		]
	];
	
	player createDiaryRecord ["foreword",
		[
			"Spezielle Steuerungselemente",
				"
				Linke Windowstaste: Hauptinteraktionstaste sowie Sammeltaste<br/>
				Z: Oeffnen des Spielermenues<br/>
				T: Fahrzeugkofferraum<br/>
				U: Oeffnen/Abschliessen von Fahrzeugen<br/>
				Links Shift + G: Ergeben<br/>
				Links Shift + R: Niederschlagen / Fesseln<br/><br/>
				Links Shift + L: Blaulicht (als Polizist und Medic)<br/>
				F: Yelp (als Polizist und Medic)<br/>
				Shift + F: Sirene (als Polizist und Medic)<br/>
				O: Oeffnen von Schranken<br/>
				Shift + O: mobiler Bankzugriff (als Polizist)<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["foreword",
		[
			"Daten",
				"
				- Filter: Altis Life Germany<br/>
				- IP: 37.187.165.64:2302<br/>
				- TS: ts.altislife-germany.de:8772<br/>
				- Homepage: www.altislife-germany.de<br/>
				- Forum: http://forum.altislife-germany.de<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["foreword",
		[
			"Vorwort",
				"
				Das RP liegt uns besonders am Herzen, denn das ist es, was Altis Life so besonders macht. Wenn ihr der gleichen Meinung seid, seid ihr bei uns herzlich willkommen und wir werden alles daran setzen, euch das Spielerlebnis so spannend und abwechslungsreich wie moeglich zu gestalten. Damit das funktioniert, muessen wir jedoch einige Regeln aufstellen, die jeder Spieler unbedingt kennen sollten. Bitte respektiert diese, dann werden ihr und wir mit Sicherheit sehr viel Spass haben. Team - Altis Life Germany.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["serverrules",
		[
			"Beschwerden",
				"
				Beschwerden gegen Spieler werden nur noch mit Begruendung sowie Spielernamen bearbeitet. Im Zweifelsfall sind Screenshots oder Videos vorzulegen. Verallgemeintere Gang- oder Polizeibeschwerden werden nicht mehr bearbeitet.<br/>
				"
		]
	];
	
	player createDiaryRecord["serverrules",
		[
			"Kommunikationsregeln",
				"
				1. Im Sidechat darf nur geschrieben, nicht geredet werden.<br/>
				2. Spamming im Sidechat ist nicht erlaubt und kann mit einem Kick oder Bann bestraft werden.<br/>
				3. Fuer Kommunikation im Sinne des RPs ist die InGame-Kommunikation vorhanden, nicht der TS. Ausnahmen sind Gangs, Clans, andere Organisationen und Zusammenschluesse und die Polizei.<br/>
				4. Der Chat DIREKTE KOMMUNIKATION ist zur Eröffnung von RP-Situationen erlaubt. Ankuendigungen im Sidechat sind nicht gueltig.<br/>
				5. Die Kommunikation via SMS ist nicht RP-tuechtig, da nicht davon ausgegangen werden kann, das der andere ein Handy besitzt. Drohungen via SMS sind somit ungueltig. Ausnahme hierbei ist jedoch die Warnung von Helikoptern vom Boden aus, dies ist erlaubt.<br/>
				"
		]
	];
	
	player createDiaryRecord["serverrules",
		[
			"New Life",
				"
				Ein neues Leben beginnt, wenn man stirbt.<br/>
				Tritt New Life in Kraft, darf man in das Geschehen, das den Tod verursacht hat, nicht mehr eingreifen und sich diesem in einem Umkreis von 2,5 Kilometern nicht mehr nähern.<br/>
				Liegt die Spielerzahl der Polizei bei unter 6, und das Geschehen hat sich nicht zum Grossteil aufgeloest, darf die Polizei nach 15 Minuten wieder ins Geschehen eingreifen.<br/>
				Hat man vor dem Tod eine Morddrohung o.Ä. einer Gruppe bzw. einer Einzelperson erhalten, sollte man diese über sein New Life informieren.<br/>
				Tritt New Life in Kraft, darf man in das Geschehen, das den Tod verursacht hat, nicht mehr eingreifen und sich diesem in einem Umkreis von 2,5 Kilometern nicht mehr nähern.<br/>
				Nicht als New Life gelten:<br/>
				- Absichtlicher Selbstmord, um einer RP-Situation zu entkommen<br/>
				- Ein Tod durch RDM/VDM<br/>
				- Tod durch Bug o.Ä.<br/>
				- Verwendung des Respawn-Buttons<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Random Deathmatch (RDM)", 
				"	
				Folgendes ist als RDM anzusehen:<br/>
				1. Grundloses absichtliches Erschiessen anderer Spieler<br/>
				2. Grundloses absichtliches Ueberfahren anderer Spieler (VDM)<br/>
				3. Grundloses Verursachen von Explosionen mit Personenschaden<br/>
				4. Ninja-RP: Geld/Schluessel/Weg oder tot (und aehnliche Formulierungen) sind RDM!<br/>
				5. Beschuss auf die Bank von außerhalb der markierten Zone waehrend eines Bankraubes wird als RDM angesehen. Findet das Gefecht außerhalb der Mauern statt, ist dies ein normales Gefecht und wird nicht durch die markierung begrenzt.<br/>
				Auch eine Rebellenlizens berechtigt nicht zum wahllosen Toeten!<br/>
				Gangverstecke sind kein RDM-Gebiet, es gelten normale Regeln.<br/>
				Selbstverteidigung oder das Verteidigen von Freunden oder Gangmitgliedern gilt nicht als RDM.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["serverrules",
		[
			"Safezones Allgemein",
				"
				Als Safezones sind folgende Bereiche inklusive eines Umkreises von 50 Metern definiert:<br/>
				- alle als solche auf der Map markierte Bereiche<br/>
				- Haendler (Markt, Gemischtwarenhaendler, Kleidungshaendler, Fahrzeughaendler, Waffenhaendler)<br/>
				- Garagen<br/>
				In Safezones ist folgendes NICHT gestattet:<br/>
				- Diebstahl von Fahrzeugen ohne Chance zum Abschliessen fuer den Besitzer<br/>
				- Niederschlagen/Ausrauben anderer Personen<br/>
				- Random Deathmatch/Vehicle Deathmatch<br/>
				Safezones werden bei Verfolgungen ungueltig.<br/>
				Absolute Safezone für alle sind Polizei HQ Kavala sowie Polizei HQ Pyrgos.<br/>
				Ausserdem koennen sie in Absprache mit den Admins, wenn RP-technisch begruendet, kurzfristig ausser Kraft gesetzt werden, z.B. durch eine Uebernahme einer Stadt. Diese Stadt darf jedoch unter keinen Umstaenden Kavala sein. Eine Uebernahme berechtigt jedoch nicht dazu, Zivilisten wahllos zu toeten, Polizisten duerfen jedoch, wenn sie sich dem uebernommenen Gebiet naehern, ohne weitere Vorwarnungen getoetet werden. Von Zivilisten darf z.B. Wegzoll gefordert werden.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["serverrules",
		[
			"Safezones ATM oder BANK",
				"
				Als Safezones sind folgende Bereiche inklusive eines Umkreises von 10 Metern definiert:<br/>
				- Geldautomaten oder Bank<br/><br/>
				In Safezones ist folgendes NICHT gestattet:<br/>
				- Diebstahl von Fahrzeugen ohne Chance zum Abschliessen fuer den Besitzer<br/>
				- Niederschlagen/Ausrauben anderer Personen<br/>
				- Random Deathmatch/Vehicle Deathmatch<br/>
				Safezones werden bei Verfolgungen ungueltig.<br/>
				Ausserdem koennen sie in Absprache mit den Admins, wenn RP-technisch begruendet, kurzfristig ausser Kraft gesetzt werden, z.B. durch eine Uebernahme einer Stadt. Diese Stadt darf jedoch unter keinen Umstaenden Kavala sein. Eine Uebernahme berechtigt jedoch nicht dazu, Zivilisten wahllos zu toeten, Polizisten duerfen jedoch, wenn sie sich dem uebernommenen Gebiet naehern, ohne weitere Vorwarnungen getoetet werden. Von Zivilisten darf z.B. Wegzoll gefordert werden.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Banngruende", 
				"			
				1.  Hacking<br/>
				2.  Cheating<br/>
				3.  Bugusing<br/>
				4.  Glitching<br/>
				5.  Duping<br/>
				6.  Nutzung offensichtlich gehackter Gegenstaende<br/>
				7.  RDM/VDM<br/>
				8.  Unangemessene Beleidigungen und rassistische Namen, Aeusserungen, Parolen<br/>
				9.  Jegliche Aktionen ohne RP-Hintergrund (fortwaehrendes Trolling) oder solche, um RP zu verhindern (absichtlicher Selbstmord, Combatlog). Des weiteren wird schlechtes RP (z.B. Geld/Schluessel/Weg oder tot und aehnliche Formulierungen sowie Aktionen) mit einem Tagesbann sanktioniert, der nicht zur Diskussion steht.<br/>
				10. Missachtung der New Life-Regeln<br/>
				11. Dreimaliger Kick vom Server.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["serverrules",
		[
			"Allgemeine Informationen",
				"
				Der Staat vergibt keine Auftragsmorde!<br/>
				Es gibt keine Freikarte fuer illegale andere Aktivitaeten<br/>
				Die Serverregeln sind in Kurzform auch im TS im entsprechenden Channel der Eingangshalle zu finden.<br/>
				Das Rollenspiel darf mit Waffen bzw. Warnschüssen auf Helikopter eröffnet werden aber der Helikopter darf dabei nicht getroffen werden.<br/>
				Das zerschiessen von Fahrzeugreifen ist erlaubt solange keine Personen dabei getötet werden! Alles andere ist als RDM anzusehen.<br/>
				dazu gilt zu sagen, dass auf keinen Fall sofort das Feuer eröffnet werden darf!!!<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["behavioral",
		[
			"Securityregeln",
				"
				Der Sicherheitsdienst ist staatlich anerkannt, arbeitet jedoch auf privater Basis. Das heisst:<br/>
				- Der Sicherheitsdienst ist selbst für die Beschaffung von Auftraegen verantwortlich.<br/>
				- Der Sicherheitsdienst darf nur legale Aktivitaeten sichern und selbt ausueben.<br/>
				- Der Sicherheitsdienst muss seine Kunden schuetzen, und darf Verdaechtige nicht selbst verfolgen. <br/>
				- Der Sicherheitsdienst muss bei jeglichen Vorfaellen die Polizei informieren, damit diese ggfs. einschreiten kann.<br/>
				- Der Sicherheitsdienst kann auch von der Polizei beauftragt werden, jedoch darf er keinesfalls eigenmaechtig Polizeiarbiet ausueben.<br/>
				"
		]
	];
	
	player createDiaryRecord["behavioral",
		[
			"Sanitaeterregeln",
				"
				Sanitaeter sind fuer jedermanns Gesundheit verantwortlich. Sie sind daher dazu angehalten, jeden - unabhaengig von persoenlichen Vorlieben - so gut sie koennen, zu behandeln. Sie besitzen politische Immunitaet.<br/>
				Sanitaeter duerfen nicht:<br/>
				- sich auf einem Schlachtfeld aufhalten oder Gefallene waehrend eines laufenden Gefechtes wiederbeleben. Sie muessen warten, bis das Gefecht zu Ende ist.<br/>
				- an einem Bankraub beteiligte Gefallene wiederbeleben.<br/>
				- Waffen tragen oder auf andere Art und Weise Gewalt ausueben.<br/>
				Missachtet ein Sanitaeter diese Regeln, ist seine politische Immunitaet aufgehoben.<br/>
				Verhalten nach einem Gefecht:<br/>
				- Sieg der Polizei: Wiederbelebung der Rebellen auf Anweisung der Polizei<br/>
				- Sieg der Rebellen: Warten auf Abzug der Rebellen vor der Wiederbelebung der Polizisten, ggf. Anweisungen der Rebellen befolgen<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["behavioral",
		[
			"Polizeiregeln",
				"
				Die Polizei ist folgendermassen untergliedert:<br/>
				1. Polizeianwaerter<br/>
				2. Wachtmeister<br/>
				3. Polizeikomissar<br/>
				4. Polizeioberkomissar<br/>
				5. Polizeihauptkomissar<br/>
				6. Bundespolizist<br/>
				7. Stellvertretender Polizeichef<br/>
				8. Polizeichef<br/>
				Der ranghoechste Polizist ist fuer jedwede Einsatzleitung sowie fuer die Koordinierung und Aufteilung der Einsatzkraefte zustaendig. Anweisungen hoeherrangiger Polizisten ist unbedingt Folge zu leisten.<br/><br/>
				<br/><br/>
				An folgende Regeln muss sich jeder Polizist halten:<br/>
				1. Toetungen sind unter allen Umstaenden zu vermeiden. Eine Festnahme sollte immer oberste Prioritaet haben. Scharfe Waffen werden nur bei massivem gegnerischen Beschuss verwendet.<br/>
				2. Anwaerter duerfen sich nur in Kavala aufhalten, es sei denn, sie werden von einem hoeherrangigen Beamten zu etwas anderem aufgefordert.<br/>
				3. Streifen muessen aus mindestens zwei Beamten bestehen.<br/>
				4. Zivilisten duerfen eine Durchsuchung verweigern, wenn kein dringender Tatverdacht vorliegt. Liegt dieser vor, muss er vor der Kontrolle angekündigt werden.<br/>
				5. Haeuser duerfen nur bei dringendem Tatverdacht aufgebrochen werden. Andernfalls hat der Besitzer Hausrecht. Unerlaubte Durchsuchungen fuehren zu einer Degradierung.<br/>
				6. Die aktuelle SEK-Schicht darf hoechstens aus vier Beamten bestehen, nur einer darf mit einem Scharfschuetzengewehr ausgeruestet sein.<br/>
				7. Razzien sind vom SEK zu leiten; dabei ist den Anweisungen des SEK uneingeschraenkt Folge zu leisten. Das SEK kann andere Beamte hinzuziehen. Ist kein SEK-Leiter online, kann auch der Polizeichef, ein stellvertretender Polizeichef oder ein Bundespolizist eine Razzia durchfuehren.<br/>
				8. Rebellengebiete und illegale Gebiete (Drogengebiete etc.) duerfen nur bei Razzien betreten werden. Es darf nur bei begruendetem Verdacht in illegalen Gebieten verweilt werden; dies beschraenkt sich jedoch auf eine Zeit von 15 Minuten.<br/>
				9. Bei Geiselnahmen hat das Leben der Geisel oberste Prioritaet. NICHTS ist wichtiger als das Leben unschuldiger Buerger.<br/>
				10. Bankueberfaelle duerfen, falls noetig, mit toedlicher Gewalt verhindert werden.<br/>
				11. Auch fuer Polizisten gilt New Life.<br/>
				12. Sinkt das Verhaeltnis von Polizisten und Zivilisten unter 1:5, ist ein Polizist, der aktuell als Zivilist online ist, dazu verpflichtet, sich schnellstmoeglich zum Polizeidienst zu melden.<br/>
				13. Befehle eines Polizeichefs sind nicht anzufechten.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["behavioral",
		[
			"Waffengesetz",
				"
				Der Besitz von Waffen ist nicht gestattet.<br/>
				Ausgenommen von dieser Regelung sind die folgenden Waffen bei Besitz eines Waffenscheins:<br/>
				- Rook 40<br/>
				- ACP C2<br/>
				- Zubr Revolver<br/>
				- 4-Five<br/>
				- PDW 2000<br/>
				- Vermin ACP<br/>
				- SDAR<br/>
				- TRG-20<br/>
				Diese Waffen duerfen nur ausserhalb von Staedten offen getragen werden.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["behavioral",
		[
			"Rebellenregeln",
				"
				1. Als Rebell gilt man, wenn man ein Rebellenfahrzeug faehrt oder eine illegale Waffe traegt. Der Besitz der Rebellenlizens ist nicht strafbar.<br/>
				2. Rebellen sind nicht von den RDM-Regeln befreit!<br/>
				3. Rebellen sind Staatsfeinde, also bei Sichtung durch einen Zivilisten unverzueglich der Polizei zu melden und durch diese zu verhaften.<br/>
				Damit eine Kriegserklaerung gegen einen anderen Clan gueltig ist, muessen ALLE der folgenden Benachrichtigung erfolgt sein:<br/>
				- Ankuendigung ueber Channel 7 News<br/>
				- Ankuendigung per SMS an ein Gangmitglied<br/>
				- Ankuendigung per SMS an die Polizei<br/>
				Eine Kriegserklaerung gilt nur für eine Serverperiode, das heisst bis zum nächsten Serverneustart.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["behavioral",
		[
			"illegale Substanzen",
				"
				Auf Altis wurde eine Prohibition ausgerufen. Darunter fallen:<br/>
				- Zigarren<br/>
				- Drogen (Marihuana, Heroin, Kokain)<br/>
				- Getraenke mit einem Alkoholgehalt von ueber 15 Prozent<br/>
				Jeglicher Abbau, Besitz, Konsum oder Handel der bzw. mit den genannten Substanzen ist verboten und wird dem Bussgeldkatalog entsprechend geahndet.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["behavioral",
		[
			"Strassen-/Luftverkehr",
				"
				Es gelten folgende Geschwindigkeitsbegrenzungen (unabhaengig von der Beschilderung):<br/>
				- 30 km/h an allen Marktplaetzen der Staedte<br/>
				- 50 km/h in allen Staedten<br/>
				- 70 km/h in allen anderen Ortschaften<br/>
				- auf Landstrassen herrscht keine Geschwindigkeitsbeschraenkung<br/>
				Karts duerfen nur mit entsprechender Schutzkleidung, die beim Kart Haendler zu erwerben ist, in der Zeit von 08:00 bis 20:00 gefahren werden.<br/>
				Die minimale Flughoehe ueber Staedten betraegt 200 Meter.<br/>
				Belaestigungen, Behinderungen, Gefaehrdungen und Beschaedigungen im Strassen-/Luftverkehr sind verboten und werden dem Bussgeldkatalog entsprechend geahndet.<br/>
				Das Fuehren illegaler Fahrzeuge ist nicht gestattet. Als solche zaehlen:<br/>
				- Ifrit, Geländewagen (bewaffnet) sowie alle in illegale Handlungen involvierte Fahrzeuge<br/>
				- saemtliche Polizeifahrzeuge<br/><br/>
				Jene Fahrzeuge werden von der Polizei, je nach Situation und Anweisung der Einsatzleitung, beschlagnahmt oder zerstoert!
				"
		]
	];
	
	player createDiaryRecord["behavioral",
		[
			"Allgemeine Informationen",
				"
				- Als Staedte sind im Folgenden die Ortschaften Kavala, Pyrgos, Athira und Sofia anzusehen.<br/>
				- Der Besitz von Lizenzen, egal ob legal oder illegal, ist nicht strafbar.<br/>
				- Der Bussgeldkatalog ist detailliert im TS im entsprechenden Channel der Eingangshalle zu finden.<br/><br/>
				"
		]
	];
		
	player createDiaryRecord["penality",
		[
			"Gefaengniszeiten bei Nichtbezahlen der Strafe",
				"
				Bei Tickets ueber 1.000.000$ oder bei mehrfachem Mord oder fahrlaessiger Toetung, rebellischen Uebernahmen oder Terrorismus sowie Bankraub besteht keine Moeglichkeit, das Ticket zu bezahlen. Der Verdaechtige wird sofort für 15min inhaftiert.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["penality",
		[
			"Kapitalverbrechen",
				"
				Angriff auf Kraftwerke: 100.000$<br/>
				Beschuss von Personen/bemannten Fahrzeugen: 50.000<br/>
				Drohung 20.000$<br/>
				Anstiftung zum Mord: 100.000$<br/>
				Mord: 150.000$<br/>
				versuchte Entfuehrung: 50.000$<br/>
				Entfuehrung: 70.000$<br/>
				versuchter Raub: 30.000$<br/>
				Raub: 50.000$<br/>
				versuchter Bankraub: 350.000$<br/>
				Bankraub: 500.000$<br/>
				rebellische Uebernahme: 200.000$<br/>
				Terrorismus: 500.000$<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["penality",
		[
			"Umgang mit der Polizei",
				"
				Beamtenbeleidigung: der Haerte der Beleidigung entsprechend zwischen 5.000$ bis 50.000$<br/>
				Behinderung der Polzeiarbeit/Missachtung polizeilicher Anweisungen: 10.000$ <br/>
				Befreiung festgesetzter Personen: 30.000$<br/>
				Fluchthilfe: 20.000$<br/>
				Flucht: 30.000$<br/>
				Gefaengnisausbruch: 100.000$<br/>
				Beihilfe Gefaengnisausbruch: 50.000$<br/> 
				Betreten einer Sperrzone: 10.000$<br/>
				Beamtenbeschuss: 50.000$<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["penality",
		[
			"illegale Gegenstaende/Substanzen",
				"
				Alkohol-/Drogenbesitz: 100.000 oder Alkohol-/Drogenwert : 2<br/>
				Alkohol-/Drogenkonsum: 10.000$<br/>
				Alkohol-/Drogenhandel: 100.000$ (eine Anzahl ueber 10 gilt nicht mehr als Eigenbedarf)<br/>
				versuchter Taschendiebstahl: 7.500$<br/>
				Taschendiebstahl: 15.000$<br/>
				versuchter Fahrzeugdiebstahl: 10.000$<br/>
				Fahrzeugdiebstahl: 20.000$<br/>
				Handel mit gestohlenen Fahrzeugen: Kaufpreis des Fahrzeugs x 2<br/>
				Handel mit Sprengstoffen: Anzahl der Schwarzpulversaecke/Kanonenkugeln x 5.000$, Anzahl der Bomben x 15.000$<br/><br/>
				Fuehren eines illegalen Fahrzeugs: 50.000$ + Beschlagnahmung/Zerstoerung<br/><br/>
				offenes Tragen von Waffen in Staedten: 5.000$<br/>
				Besitz legaler Waffen ohne Waffenschein: 10.000$ + Beschlagnahmung<br/>
				Besitz illegaler Waffen: 50.000$ + Beschlagnahmung<br/>
				Abfeuern von Waffen (Selbstverteidigung ausgenommen): 30.000$ + Beschlagnahmung<br/>
				"
		]
	];
	
	player createDiaryRecord["penality",
		[
			"Luftverkehr",
				"
				Fliegen ohne Pilotenschein: 50.000$ + Beschlagnahmung<br/>
				Fliegen ohne Kollisionslichter: 10.000$<br/>
				Nichteinhaltung der Mindestflughoehe: 10.000$<br/>
				Landen innerhalb von Staedten/auf Strassen: 20.000$ + Beschlagnahmung<br/>
				Fliegen unter Alkohol-/Drogeneinfluss: 100.000$ + Beschlagnahmung<br/>
				"
		]
	];
	
	player createDiaryRecord["penality",
		[
			"Strassenverkehr",
				"
				Geschwindigkeitsueberschreitungen:<br/>
				- 10 km/h: 2.000$ (gilt nur fuer Marktplaetze und Staedte)<br/>
				- 20 km/h: 5.000$<br/>
				- 50 km/h: 10.000$ + Beschlagnahmung<br/>
				- 75 km/h: 20.000$ + Beschlagnahmung<br/>
				- 100 km/h: 30.000$ + Beschlagnahmung<br/>
				- 150 km/h: 50.000$ + Beschlagnahmung<br/>
				Ruhestoerung: 5.000$<br/>
				Fahren ohne Fahrerlaubnis PKW: 1.000$ + Beschlagnahmung<br/>
				Fahren ohne Fahrerlaubnis LKW: 40.000$ + Beschlagnahmung<br/>
				Fahren ohne Licht: 2.500$<br/>
				Falschparken/Verkehrsbehinderung: 2.500$<br/>
				Fahren unter Alkohol-/Drogeneinfluss: 20.000$ + Beschlagnahmung<br/>
				Verursachen eines Unfalls: 7.500$<br/>
				Verursachen eines Unfalls mit Personenschaden: 15.000$<br/>
				Fahrerflucht: 30.000$<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["penality",
		[
			"Allgemeine Informationen",
				"
				Als Staedte werden im Folgenden die Ortschaften Kavala, Pyrgos, Athira und Sofia bezeichnet.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["close",
		[
			"Links",
				"
				ArmA 3: www.arma3.com<br/>
				Altis Life: www.altisliferpg.com<br/>
				Altis Life Germany: www.altislife-germany.de<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["close",
		[
			"Schlusswort",
				"
					Trotz der vielen Regeln und Gebote, die leider unabdingbar sind, um den Spielspass zu erhalten, sind wir auch nur Menschen. Wenn ihr also Zweifel habt, ob etwas richtig abgelaufen ist oder wenn ihr Verbesserungsvorschlaege habt, zoegert bitte nicht, uns entweder im TS oder InGame anzusprechen und im Supportbereich zu warten, damit wir uns so schnell wie moeglich um euer Anliegen kuemmern koennen. Solltet ihr Fragen das Spiel betreffend haben, koennte euch auch der im TS vorhandene FAQ-Channel in der Eingangshalle helfen. Team - Altis Life Germany.<br/><br/>
				"
		]
	];
