-- phpMyAdmin SQL Dump
-- version 3.3.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 20, 2010 at 05:09 PM
-- Server version: 5.1.46
-- PHP Version: 5.2.13-pl0-gentoo

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `adbndbDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `confession`
--

CREATE TABLE IF NOT EXISTS `confession` (
`id` bigint(20) NOT NULL AUTO_INCREMENT,
										 `version` bigint(20) NOT NULL,
										 `title` varchar(255) NOT NULL,
										 `person_id` bigint(20) NOT NULL,
										 `start` date NOT NULL,
										 `end` date NOT NULL,
										 PRIMARY KEY (`id`),
										 KEY `FK2B73A88733D5EFD` (`person_id`)
										 ) ENGINE=MyISAM  DEFAULT CHARSET=utf8
AUTO_INCREMENT=8 ;
										 
										 --
										 -- Dumping data for table `confession`
										 --
										 
										 INSERT INTO `confession` (`id`,
`version`, `title`, `person_id`, `start`, `end`)								
	 VALUES
										 (7, 0, 'Evangelisch,Die Schlacht d.
Heilande', 7, '2010-06-20', '2010-06-20'),
										 (2, 0, 'Evangelisch,Viaggio in Italia
', 2, '1910-07-29', '1973-05-25'),
										 (3, 0, 'Katholisch,Geschichte der
theol. Facultät der Universität Wien', 3,										
 '1988-06-20', '2000-01-04'),
										  (6, 0, 'Evangelisch,Gedanken eines
Arztes üb. Medizin', 6, '1966-11-24',										  
'2000-03-01');
										   
										   --
--------------------------------------------------------
										   
										   --
										   -- Table structure for table
`location`
										   --
										   
										   CREATE TABLE IF NOT EXISTS `location`
(
										   `id` bigint(20) NOT NULL
AUTO_INCREMENT,
																				
 `version` bigint(20) NOT NULL,
																				
 `person_id` bigint(20) NOT NULL,
																				
 `start` date NOT NULL,
																				
 `description` varchar(255) NOT NULL,
																				
 `name` varchar(255) NOT NULL,
																				
 `longitude` float NOT NULL,
																				
 `latitude` float NOT NULL,
																				
 `end` date NOT NULL,
																				
 PRIMARY KEY (`id`),
																				
 KEY `FK714F9FB533D5EFD` (`person_id`)
																				
 ) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;
																				
 
																				
 --
																				
 -- Dumping data for table `location`
																				
 --
																				
 
																				
 INSERT INTO `location` (`id`, `version`, `person_id`, `start`, `description`,	
																				
			  `name`, `longitude`, `latitude`, `end`) VALUES
																				
					  (2, 0, 2, '1910-07-29', '-', 'Frankfurt am Main', 50.1229,
8.68183,																		
							   '1973-05-25'),
																				
					   (3, 0, 3, '1988-06-20', '-', 'unbekannt', 0, 0,
'2000-01-04'),
																				
					   (7, 0, 7, '2010-06-20', 'Preußen', 'Königsberg', 0, 0,
'2010-06-20'),
																				
					   (6, 0, 6, '1966-11-24', 'Brandenburg', 'Sauen', 52.2631,
14.2168, '2000-03-01');
																				
					   
																				
					   --
--------------------------------------------------------
																				
					   
																				
					   --
																				
					   -- Table structure for table `name`
																				
					   --
																				
					   
																				
					   CREATE TABLE IF NOT EXISTS `name` (
																				
					   `id` bigint(20) NOT NULL AUTO_INCREMENT,
																				
														  `version` bigint(20)
NOT NULL,
																				
														  `last_name`
varchar(255) NOT NULL,
																				
														  `person_id` bigint(20)
NOT NULL,
																				
														  `birth_name`
varchar(255) NOT NULL,
																				
														  `first_names`
varchar(255) NOT NULL,
																				
														  PRIMARY KEY (`id`),
																				
														  KEY `FK337A8B33D5EFD`
(`person_id`)
																				
														  ) ENGINE=MyISAM 
DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;
																				
														  
																				
														  --
																				
														  -- Dumping data for
table `name`
																				
														  --
																				
														  
																				
														  INSERT INTO `name`
(`id`, `version`, `last_name`, `person_id`, `birth_name`,						
																				
												  `first_names`) VALUES
																				
																			 
(2, 0, 'Goethe', 2, 'Johann', 'Caspar'),
																				
																			 
(3, 0, 'Klein', 3, '-1788 bis 1867', ' Anton'),
																				
																			 
(7, 0, 'Brust', 7, '-', 'Alfred'),
																				
																			 
(6, 0, 'Bier', 6, '-', 'August');
																				
																			  
																				
																			  --
--------------------------------------------------------
																				
																			  
																				
																			  --
																				
																			  --
Table structure for table `person`
																				
																			  --
																				
																			  
																				
																			 
CREATE TABLE IF NOT EXISTS `person` (
																				
																			 
`id` bigint(20) NOT NULL AUTO_INCREMENT,
																				
																				
							   `version` bigint(20) NOT NULL,
																				
																				
							   `date_of_birth` date NOT NULL,
																				
																				
							   `bio` longtext NOT NULL,
																				
																				
							   `gender` bit(1) NOT NULL,
																				
																				
							   `date_of_death` date DEFAULT NULL,
																				
																				
							   PRIMARY KEY (`id`)
																				
																				
							   ) ENGINE=MyISAM  DEFAULT CHARSET=utf8
AUTO_INCREMENT=8 ;
																				
																				
							   
																				
																				
							   --
																				
																				
							   -- Dumping data for table `person`
																				
																				
							   --
																				
																				
							   
																				
																				
							   INSERT INTO `person` (`id`, `version`,
`date_of_birth`, `bio`, `gender`,												
																				
																				
 `date_of_death`) VALUES
																				
																				
													 (2, 0, '1910-07-29',
'Goethe war, wenn auch nicht hochmütig, wie man es seinem						
																				
																				
						 Vater nachgesagt hat, so doch hochgemut und stolz,
energisch und von ernster														
																				
																			
Lebensführung und den Musen zugewandt. Er hielt auf eine angesehene				
																				
																				
								 gesellschaftliche Stellung, war aber zugleich
erfüllt von echter Liebe zu einer												
																				
																				
 universalen wissenschaftlichen Durchbildung und von Interesse für Literatur und
																				
																				
												 Schöne Künste. Seine
Schulbildung hatte er nach Absolvierung der Frankfurter							
																				
																				
					 Schule seit 1725 auf dem Casimirianum in Coburg erhalten,
einer angesehenen																
																				
																	
lutherischen Lateinschule, wo ihm auch das Französische, die Realien und Schönen
																				
																				
												 Künste erschlossen wurden. Dann
hatte er in Gießen (1730) und 4 Jahre in Leipzig								
																				
																				
				 Jurisprudenz studiert, sich am Reichskammergericht in Wetzlar
fortgebildet, 1738																
																				
																	 in Gießen
promoviert. Nach des Vaters Tod zog er mit der Mutter in das Haus am			
																				
																				
									 Hirschgraben – jetzt Nummer 23 – und trat
dann eine Bildungsreise über Wien nach											
																				
																				
	 Italien und Südfrankreich an: der Bürgersohn, der nicht einmal zu den alten
																				
																				
												 Geschlechtern gehörte, bildete
sich nach Art vornehmer Adliger aus, bereitete									
																				
																				
			 sich sorgfältig auf die Reise durch Studien vor, achtete auf
Altertümer,																		
																				
															 
Geschichtsdenkmäler, Kunstwerke und Volkssitten; er machte sich über alles		
																				
																				
										  Gesehene Aufzeichnungen in
italienischer Sprache, die erhalten sind. In vielen								
																				
																				
				  Zügen ist der Ausbildungsgang von Johann Wolfgang dem des
Vaters gefolgt, aber															
																				
																		  der
Vater hatte nicht das Glück des Erfolges. Denn als er sich um ein Amt in der	
																				
																				
											  Stadtregierung bemühte, wurde es
ihm verweigert, da er es ohne Ballotage											
																				
																				
	  erhalten wollte, was gegen den Brauch war. Nun verzichtete er auf jede
Bewerbung																		
																				
															  in Frankfurt und
verschaffte sich gegen eine beträchtliche Geldsumme die							
																				
																				
					  Ernennung zum kaiserlichen Wirklichen Rat. 6 Jahre später
war er der																		
																				
															  Schwiegersohn des
obersten Beamten der Stadt. Aber seiner Wirksamkeit waren enge					
																				
																				
							  Grenzen gesetzt, und das hinterließ einen Stachel
im Herzen. Seine starke															
																				
																		 
Energie richtete sich nun auf die Einrichtung seines Hauses, auf die			
																				
																				
									  Weiterbildung seiner Frau und vor allem
auf die Erziehung seiner hochbegabten											
																				
																				
	  Kinder. Er hat damit eine Leistung vollbracht, die ihm eine historische	
																				
																				
											  Bedeutung sichert, und wenn der
Sohn sie oft als drückend empfand, hat er sie									
																				
																				
			  doch anerkennen müssen. 1830 äußerte er sich rückblickend zu
Kanzler von Müller:																
																				
																	  „Mein
Vater war ein tüchtiger Kerl, aber freilich fehlte ihm Gewandtheit und			
																				
																				
									  Beweglichkeit des Geistes. Er ließ mich
mit meinen Possen gewähren, obgleich											
																				
																				
	  altertümlich gesinnt in religiöser Hinsicht, nahm er doch kein Arg an
meinen																			
																				
														  Spekulationen und
Ansichten, sondern erfreute sich seines Sohnes als eines						
																				
																				
						  wunderlichen Kauzes". Und im gleichen Alter (1827)
bekannte der Dichter, daß er													
																				
																				
 dem Vater ein hohes Gut verdanke: „Des Lebens ernstes Führen."', b'1',			
																				
																				
									  '1973-05-25'),
																				
																				
													  (3, 0, '1988-06-20',
'Anton K., katholischer Kirchenhistoriker, geboren am 10.						
																				
																				
						  August 1788 zu Wien, † am 9. April 1867 ebendaselbst.
Er wurde im J. 1811 zum															
																				
																		 
Priester geweiht, Herbst 1817 Professor der Kirchengeschichte am Lyceum zu		
																				
																				
										  Olmütz, 3. August 1820 Dr. theol.,
Anfang 1822 Professor der Kirchengeschichte										
																				
																				
		  in Graz, Herbst 1831 an der Universität Wien, 1834 Domherr bei St.
Stephan in																		
																				
															  Wien. Werke:
"Historia Ecclesiae christianae a nativitate Salvatoris usque ad				
																				
																				
								  obitum Pii VII. Pont. Max." (2 Bände in 3
Theilen, Graz 1827); "Geschichte des											
																				
																				
	  Christenthums in Oesterreich und Steiermark seit der ersten Einführung
desselben																		
																				
															  in diese Länder
bis auf gegenwärtige Zeit" (7 Bde., Wien 1840—1842). Krones,					
																				
																				
							   Geschichte der Karl Franzens-Universität in Graz
(Graz 1886), S. 503. — Wappler,													
																				
																				
  Geschichte der theol. Facultät der Universität Wien (Wien 1884), S. 446, 267.
—																				
																				
													   Litterar. Handweiser
1867, Nr. 56, Sp. 266.', b'1', '2000-01-04'),
																				
																				
													   (7, 0, '1931-06-15',
'Brust verbrachte seine Kindheit in Coadjuthen, dann in							
																				
																				
					   Göttingen bei den Großeltern, besuchte die Schule in
Tilsit und wurde, nach der														
																				
																			  
Vorbereitung auf den Kaufmannsberuf, Journalist. Längere Zeit war er als		
																				
																				
										   Redakteur in Annaberg (Erzgebirge)
tätig. Im 1. Weltkrieg kämpfte er 4 Jahre an									
																				
																				
			   der Ostfront. Als freier Schriftsteller ließ er sich dann bis
1923 in Heydekrug																
																				
																	   nieder,
lebte danach in Cranz und ab 1931 in Königsberg (Preußen), immer in				
																				
																				
								   bedrängten Verhältnissen. Brust schrieb
Dramen und Gedichte im Stil des													
																				
																				
  Expressionismus. Seine besondere Begabung zeigte sich in seinen Erzählungen,
die																				
																				
													   an Dostojewski erinnern
und deutlich erweisen, wie tief er in seiner östlichen							
																				
																				
					   Heimat verwurzelt war. Immer wieder wird in seinem Werk
die Kluft zwischen Leib															
																				
																		   und
Seele, animalischer Lebensgier und gänzlich entkörperter Ekstase aufgerissen	
																				
																				
											   in einer gewaltsamen Spannung,
die sich auch in der Sprache spiegelt. In seiner								
																				
																				
				   eigenwilligen Art und Gestaltung gehört Brust zu den
bedeutenderen modernen															
																				
																		  
Vertretern landschaftsgebundener Dichtung des deutschen Ostens.', b'1',			
																				
																				
										'2004-09-18'),
																				
																				
														(6, 0, '1961-11-24',
'Bier erhielt eine humanistische Vorbildung in dem								
																				
																				
					ländlichen Korbach in Waldeck. In der Berufswahl schwankte
er zwischen																		
																				
															
Forstwissenschaft und Medizin. Er studierte Medizin in Berlin, Leipzig und Kiel.
																				
																				
													Dort machte er sein
Staatsexamen und wurde promoviert (1886). Zwei Jahre später						
																				
																				
							war er Assistent bei Friedrich Esmarch und
habilitierte sich 1889 für Chirurgie.											
																				
																				
		1899 nahm er einen Ruf nach Greifswald an, 1903 nach Bonn, 1907 nach
Berlin als																		
																				
																Nachfolger Ernst
von Bergmanns (bis 1932). Bier war ein meisterhafter Operateur;					
																				
																				
								er bereicherte die Chirurgie durch neue
Methoden; er übte großen Einfluß auf die										
																				
																				
			Ärzte durch seine naturphilosophischen Lehren. Bereits in Kiel
tauchte der																		
																				
																Gedanke in ihm
auf, daß man die Hyperämie als heilende Maßnahme gegen akute und				
																				
																				
									chronische Entzündungen benützen könne. Für
die physiologische Grundlage dieser												
																				
																				
	Tatsache prägte er den Ausdruck „Blutgefühl". Der zweite große Beitrag, den
Bier der Chirurgie leistete, ist die Lumbalanästhesie, die Kokainisierung des
Rückenmarks. Heinrich Quincke hatte schon 1891 den Lumbalstich gelehrt, Hanson
Kelly Corning machte darauf aufmerksam, daß man ihn zur Anästhesierung großer
Körpergebiete verwerten könne. Bier wagte es, diesen Eingriff, dessen Folgen
nicht vorauszusehen waren, zuerst an sich selber ausführen zu lassen. Diese Tat
und der bleibende Wert der Maßnahme gehören zu den Ruhmestiteln dieses Arztes.
Es sei auch die Saugbehandlung erwähnt, eine einfache Maßnahme von großem
Nutzen, durch die man zu, zum, zur Bier Eiter aus dem Körper entfernen kann; sie
geht auf Bier zurück. Andere Neuerungen des gedankenvollen Mannes konnten sich
nicht behaupten. Der so genannten Bierschen Amputation, wobei die Sägefläche von
Schienbein und Wadenbein durch einen aus ersterem entnommenen Periostteil
bedeckt wird, und der Venaesthesie, das ist der Füllung eines blutleer gemachten
Gliedes mit dem Anästhetikum, sinnreichen Gedanken, stellten sich die
Schwierigkeiten der Ausführung und unberechenbare Umstände entgegen. Ein
theoretischer Beitrag zur Chirurgie waren seine Studien über den
Kollateralkreislauf. Als chirurgische Leistung ist es auch zu werten, daß er den
Stahlhelm erdachte, einen Schutz des Kopfes vor den vielen, oft geringfügig
erscheinenden, aber später sich verhängnisvoll auswirkenden Verletzungen durch
kleine Granatsplitter. Bier führte die Naturphilosophie als Ordnungs- und
Erkenntnismittel wieder in die Wissenschaft ein. Seine Philosophie trug ein ganz
persönliches Gepräge, er richtete seinen Blick auf das Ganze der Natur.
Beobachtungen - er pflanzte Pappeln auf seinem Gut in märkischen Sand - führten
ihn zu der Erkenntnis, daß die Seele in der Biologie und Medizin mindestens die
gleiche Rolle spiele wie in den Geisteswissenschaften. Bier meinte hier nicht
die Seele als Trägerin des Bewußtseins, seine Überlegungen galten der Seele als
der Dominante der Lebensvorgänge. „Seele ist Belebung." Ihre Grundeigenschaf
|ten sind Reizbarkeit und Zielstrebigkeit. Diese teleologische Betrachtungsweise
kündete sich schon in seinen wissenschaftlichen Anfängen an. Bier sprach nicht
vom regulativen Prinzip oder von Ganzbezogenheit. Sein Ideal war Heraklit. In
den spärlichen Fragmenten des alten Griechen erkannte er seine eigenen Gedanken
wieder, nach dessen Wortschatz bildete er seine eigene Redeweise: Rhythmus, die
regelmäßige Abfolge der Erscheinungen, Harmonie durch Gegensätze, offenbar die
allseitige Betrachtung eines Gegenstandes, Logos, die Gesetzmäßigkeit und
Vernünftigkeit im Naturgeschehen. Die Zergliederung des Einzelnen war nicht sein
Ziel, der Arzt und Forstmann wollte in lebendiger Schau die großen Zusammenhänge
erfassen. So hat er ein eigenartiges teleologisches System ausgebildet- Bier
hielt Systeme für notwendig -, und er hat dem neovitalistischen Denken eine
breite Gasse geöffnet in die medizinische Welt. Er sprach von seinem
„heraklitischen Experiment", aber auch von seinem hippokratischen Experiment.
Die hippokratische Welle in der heutigen Medizin ist nicht von ihm verursacht
worden, aber er hat ihre Kraft vermehrt. Natürlich ist für ihn Hippokrates ein
Heraklitiker. Aus seinem „biologischen System" wird verständlich sein Eintreten
für Heilgymnastik, Leibesübungen und Sport. Er gründete Hohenlychen, sogar das
ϒυμνάΖειν der Griechen befürwortete er. - Bier war ein sehr beliebter Lehrer,
bekannt durch seine Kernsprüche aus verdichteter Erfahrung. Ein Außenseiter
unter Ärzten und Philosophen, ist er eine scharf umrissene Gestalt.', b'1',
'2009-03-12');

-- --------------------------------------------------------

--
-- Table structure for table `person_works`
--

CREATE TABLE IF NOT EXISTS `person_works` (
  `work_id` bigint(20) NOT NULL,
  `person_id` bigint(20) NOT NULL,
  PRIMARY KEY (`person_id`,`work_id`),
  KEY `FKEDD2861833D5EFD` (`person_id`),
  KEY `FKEDD28618620FF23D` (`work_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person_works`
--

INSERT INTO `person_works` (`work_id`, `person_id`) VALUES
(2, 2),
(3, 3),
(6, 6),
(7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `relation`
--

CREATE TABLE IF NOT EXISTS `relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `related_person_id` bigint(20) DEFAULT NULL,
  `direct_relation` bit(1) NOT NULL,
  `person_id` bigint(20) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDEF3F9FC5814FBE9` (`related_person_id`),
  KEY `FKDEF3F9FC33D5EFD` (`person_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `relation`
--

INSERT INTO `relation` (`id`, `version`, `related_person_id`, `direct_relation`,
`person_id`, `start`, `end`) VALUES
(2, 0, NULL, b'0', 2, '1910-07-29', '1973-05-25'),
(3, 0, NULL, b'0', 3, '1988-06-20', '2000-01-04'),
(7, 0, 6, b'1', 7, '2010-06-20', '2010-06-20'),
(6, 0, 3, b'1', 6, '1966-11-24', '2000-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

CREATE TABLE IF NOT EXISTS `work` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `release_date` datetime NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `work`
--

INSERT INTO `work` (`id`, `version`, `title`, `release_date`, `subtitle`) VALUES
(2, 0, 'Evangelisch,Viaggio in Italia ', '1940-01-01 00:00:00', '-'),
(3, 0, 'Katholisch,Geschichte der theol. Facultät der Universität Wien',
'1997-10-14 00:00:00', ''),
(7, 0, 'Evangelisch,Die Schlacht d. Heilande', '1985-01-01 00:00:00', 'Es kommt
vom Herzen'),
(6, 0, 'Evangelisch,Gedanken eines Arztes üb. Medizin', '1997-07-17 00:00:00',
'-');
