-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 22. Feb 2021 um 19:50
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `quiz`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `antworten`
--

CREATE TABLE `antworten` (
  `pk_antwort_id` int(11) NOT NULL,
  `fk_fragen_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `gueltigkeit` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `antworten`
--

INSERT INTO `antworten` (`pk_antwort_id`, `fk_fragen_id`, `text`, `gueltigkeit`) VALUES
(1, 1, 'Hase', 0),
(2, 1, 'Hahn', 0),
(3, 1, 'Hund', 0),
(4, 1, 'Löwe', 1),
(5, 2, 'Armenisch', 0),
(6, 2, 'Albanisch', 0),
(7, 2, 'Georgisch', 1),
(8, 2, 'Samojedisch', 0),
(9, 3, 'Kochrezepte', 0),
(10, 3, 'Werke über Natur- und Heilkunde', 1),
(11, 3, 'eine fromme und meditative Lebensweise', 0),
(12, 3, 'Aufnahme fernöstlicher Glaubensinhalte', 0),
(13, 4, 'Reiter', 0),
(14, 4, 'Räuber', 0),
(15, 4, 'Ritter', 1),
(16, 5, 'Heiß', 0),
(17, 5, 'Faden', 0),
(18, 5, 'Brot', 0),
(19, 5, 'Sich drehend', 1),
(20, 6, 'Ceres', 0),
(21, 6, 'Eros', 1),
(22, 6, 'Hermes', 0),
(23, 6, 'Aries', 0),
(24, 7, 'Neumond', 1),
(25, 7, 'Vollmond', 0),
(26, 7, 'Halbmond', 0),
(27, 8, '1973', 0),
(28, 8, '1963', 1),
(29, 8, '1983', 0),
(30, 8, '1953', 0),
(31, 9, 'Neptun', 0),
(32, 9, 'Saturn', 0),
(33, 9, 'Mars', 1),
(34, 9, 'Jupiter', 0),
(35, 10, 'Unschärferelation', 0),
(36, 10, 'Schrödinger-Gleichung', 0),
(37, 10, 'Stringtheorie', 0),
(38, 10, 'Raum-Zeit-Kontinuum', 1),
(39, 11, 'Klagenfurt am Wörthersee', 1),
(40, 12, 'Eisenstadt', 1),
(41, 13, 'St. Pölten', 1),
(42, 14, 'Wien', 1),
(43, 15, 'Innsbruck', 1),
(44, 16, 'Aquamarin', 0),
(45, 16, 'Lapislazuli', 0),
(46, 16, 'Jaspis', 0),
(47, 16, 'Apsis', 1),
(48, 17, 'Blei', 0),
(49, 17, 'Eisen', 1),
(50, 17, 'Kupfer', 0),
(51, 17, 'Aluminium', 0),
(52, 18, 'Nein, sie sind zu hart', 0),
(53, 18, 'Nein, da sie zu rein sind', 0),
(54, 18, 'Ja, ohne weitere Rückstände zu Kohlendioxid', 1),
(55, 18, 'Ja, dabei entsteht Stickstoff und Asche aus Kohlenstoff', 0),
(56, 19, 'Quecksilber', 0),
(57, 19, 'Aluminium', 1),
(58, 19, 'Ruthenium', 0),
(59, 19, 'Palladium', 0),
(60, 20, 'Paracelsus', 0),
(61, 20, 'Scheele', 0),
(62, 20, 'Marggraf', 1),
(63, 20, 'Ostwald', 0),
(64, 21, 'TNT', 0),
(65, 21, 'TDD', 0),
(66, 21, 'LCD', 1),
(67, 21, 'DDT', 0),
(68, 22, 'Doofes', 0),
(69, 22, 'Dynamic', 1),
(70, 22, 'Dreamer', 0),
(71, 22, 'Dynamite', 0),
(72, 23, 'Ein Drucker', 0),
(73, 23, 'Ein Gerät in Netzwerken', 1),
(74, 23, 'Eine Webseite mit wenig Inhalt', 0),
(75, 23, 'Die Verbindung zwischen Hardware und Software', 0),
(76, 24, 'Kurzwellen', 0),
(77, 24, 'Dezimeterwellen', 1),
(78, 24, 'Ultrakurzwellen', 0),
(79, 24, 'Zentimeterwellen', 0),
(80, 25, 'Photoshop', 0),
(81, 25, 'Excel', 0),
(82, 25, 'Windows', 1),
(83, 25, 'Netscape Navigator', 0),
(84, 26, 'Eine Erklärung von Robert Schuman im Jahr 1950', 1),
(85, 26, 'Die Einführung des Euro im Jahr 2002', 0),
(86, 26, 'Den ersten Eurovision Song Contest im Jahr 1956', 0),
(87, 26, 'Die erste Wahl zum Europäischen Parlament im Jahr 1979', 0),
(88, 27, '5 Cent pro Minute', 0),
(89, 27, '50 Cent pro Minute', 0),
(90, 27, '5 Cent pro Anruf', 0),
(91, 27, 'Es entstehen keine Zusatzkosten', 1),
(92, 28, 'Der Europäische Rechnungshof', 0),
(93, 28, 'Die Europäische Zentralbank', 0),
(94, 28, 'Der Europarat', 1),
(95, 28, 'Die Europäische Kommission', 0),
(96, 29, 'Die Mitglieder des Europäischen Parlaments', 0),
(97, 29, 'Die Europäische Kommission', 1),
(98, 29, 'Die Mitgliedstaaten', 0),
(99, 29, 'Der Gerichtshof der Europäischen Union', 0),
(100, 30, 'Genf', 1),
(101, 30, 'Der Haag', 0),
(102, 30, 'Luxemburg', 0),
(103, 30, 'Alicante', 0),
(104, 31, 'Paul McCartney', 1),
(105, 31, 'Elton John', 0),
(106, 31, 'Phil Collins', 0),
(107, 31, 'Cliff Richard', 0),
(108, 32, 'Tom Hanks', 0),
(109, 32, 'Kevin Costner', 0),
(110, 32, 'Whoopi Goldberg', 0),
(111, 32, 'Richard Burton', 1),
(112, 33, 'Peter Kraus', 1),
(113, 33, 'Freddie Quinn', 0),
(114, 33, 'Heino', 0),
(115, 33, 'Rex Gildo', 0),
(116, 34, 'Béla Bartók', 0),
(117, 34, 'Alban Berg', 0),
(118, 34, 'Carl Orff', 1),
(119, 34, 'Johannes Brahms', 0),
(120, 35, '(I Just) Died in Your Arms', 0),
(121, 35, 'Walk of Life', 0),
(122, 35, 'Brothers in Arms', 0),
(123, 35, 'Sultans of Swing', 1),
(124, 36, 'Tschechien', 0),
(125, 36, 'Rumänien', 0),
(126, 36, 'Russland', 0),
(127, 36, 'Bulgarien', 1),
(128, 37, 'Madrid', 0),
(129, 37, 'Sevilla', 0),
(130, 37, 'Rom', 1),
(131, 37, 'Florenz', 0),
(132, 38, 'Bandung', 0),
(133, 38, 'Beirut', 0),
(134, 38, 'Bagdad', 0),
(135, 38, 'Bamako', 1),
(136, 39, 'Helsinki', 1),
(137, 39, 'Helsingborg', 0),
(138, 39, 'Helsingfors', 0),
(139, 39, 'Kristianstadt', 0),
(140, 40, 'rio', 1),
(141, 40, 'ríov', 0),
(142, 40, 'rivo', 0),
(143, 40, 'fiume', 0),
(144, 41, 'Iwan VI.', 0),
(145, 41, 'Peter III.', 0),
(146, 41, 'Nikolaus II.', 1),
(147, 41, 'Alexander II.', 0),
(148, 42, 'Dritte Republik', 0),
(149, 42, 'Vierte Republik', 0),
(150, 42, 'Fünfte Republik', 1),
(151, 42, 'Sechste Republik', 0),
(152, 43, '611', 0),
(153, 43, '711', 1),
(154, 43, '811', 0),
(155, 43, '911', 0),
(156, 44, '1789', 0),
(157, 44, '1830', 0),
(158, 44, '1945', 0),
(159, 44, '1981', 1),
(160, 45, '1725', 0),
(161, 45, '1825', 1),
(162, 45, '1925', 0),
(163, 45, '1945', 0),
(164, 46, 'Bellheim', 0),
(165, 46, 'Bockelmann', 1),
(166, 46, 'Bodenmann', 0),
(167, 46, 'Bellmann', 0),
(168, 47, 'Georg Danzer', 0),
(169, 47, 'Peter Alexander', 0),
(170, 47, 'Freddy Quinn', 0),
(171, 47, 'Udo Jürgens', 1),
(172, 48, 'Peter Corneslius', 0),
(173, 48, 'Ernst Happel', 0),
(174, 48, 'Horst Hrubesch', 0),
(175, 48, 'Pepi Bican', 1),
(176, 49, 'Heureuter', 0),
(177, 49, 'Weinbeißer', 0),
(178, 49, 'Kracherl', 0),
(179, 49, 'Heuriger', 1),
(180, 50, 'Vorarlberg', 0),
(181, 50, 'Burgenland', 0),
(182, 50, 'Salzburg', 0),
(183, 50, 'Wien', 1),
(184, 51, 'Rot, Blau, Gelb', 1),
(185, 51, 'Rot, Blau, Grün', 0),
(186, 51, 'Rot, Gelb, Violett', 0),
(187, 51, 'Blau, Gelb, Grün', 0),
(188, 52, 'Tesla', 0),
(189, 52, 'Weber', 0),
(190, 52, 'Farad', 0),
(191, 52, 'Henry', 1),
(192, 53, 'Edward Schüssel', 0),
(193, 53, 'Edward Tasse', 0),
(194, 53, 'Edward Teller', 1),
(195, 53, 'Edward Fork', 0),
(196, 54, 'quadrierte Dichte', 0),
(197, 54, 'quadrierte Zeit', 0),
(198, 54, 'quadrierte Vakuumlichtgeschwindigkeit', 1),
(199, 54, 'quadrierte Fallbeschleunigung', 0),
(200, 55, 'Silber', 1),
(201, 55, 'Aluminium', 0),
(202, 55, 'Gold', 0),
(203, 55, 'Platin', 0),
(204, 56, 'Gabriele Heinisch-Hosek', 1),
(205, 57, 'Rudolf Hundstorfer', 1),
(206, 58, 'Norbert Darabos', 1),
(207, 59, 'Josef Pröll', 1),
(208, 60, 'Maria Fekter', 1),
(209, 61, 'Haiku', 1),
(210, 61, 'Taekwondo', 0),
(211, 61, 'Kendo', 0),
(212, 61, 'Boxen', 0),
(213, 62, 'Salt Lake City', 0),
(214, 62, 'Saint Louis', 0),
(215, 62, 'Los Angeles', 0),
(216, 62, 'San Francisco', 1),
(217, 63, 'Fans', 0),
(218, 63, 'Fanatici', 0),
(219, 63, 'Azzurri', 0),
(220, 63, 'Tifosi', 1),
(221, 64, 'Das Münchner Olympiastadion', 0),
(222, 64, 'Das Berliner Olympiastadion', 0),
(223, 64, 'Das Centenario-Stadion in Montevideo', 0),
(224, 64, 'Das Maracaná-Stadion in Rio de Janeiro', 1),
(225, 65, '1986 in Athen', 0),
(226, 65, '1900 in Paris', 0),
(227, 65, '1912 in Stockholm', 0),
(228, 65, '1920 in Antwerpen', 1),
(229, 66, 'Piaster', 0),
(230, 66, 'Lira', 1),
(231, 66, 'Drachme', 0),
(232, 66, 'Dirham', 0),
(233, 67, 'Familienrecht', 0),
(234, 67, 'Erbrecht', 0),
(235, 67, 'Sachenrecht', 0),
(236, 67, 'Schuldrecht', 1),
(237, 68, 'Sam Walton', 1),
(238, 68, 'John Walton', 0),
(239, 68, 'Donald Duck', 0),
(240, 68, 'Donald Trump', 0),
(241, 69, 'Tara', 0),
(242, 69, 'Kollo', 1),
(243, 69, 'Brutto', 0),
(244, 69, 'Cargo', 0),
(245, 70, 'Rezession', 0),
(246, 70, 'Inflation', 0),
(247, 70, 'Extension', 0),
(248, 70, 'Expansion', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fragen`
--

CREATE TABLE `fragen` (
  `pk_fragen_id` int(11) NOT NULL,
  `fk_kategorie_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `fragen`
--

INSERT INTO `fragen` (`pk_fragen_id`, `fk_kategorie_id`, `text`, `type`) VALUES
(1, 1, 'Was ist kein chinesisches Tierkreiszeichen?', 1),
(2, 1, 'Wie heißt die einzige alte Literatursprache der kaukasischen Sprachen?', 1),
(3, 1, 'Wodurch wurde Hildegard von Bingen (1098-1179) bekannt?', 1),
(4, 1, 'Wie nennt man die gepanzerten Reiter, die im Dienste des Königs standen?', 1),
(5, 1, 'Was bedeutet \"Döner\" in Dönerkebap?', 1),
(6, 2, 'Auf welchem Asteroiden gelang im Februar 2001 erstmals eine kontrollierte Landung einer Sonde?', 1),
(7, 2, 'Eine Sonnenfinsternis kann es nur geben bei?', 1),
(8, 2, 'In welchem Jahr flog erstmals eine Frau ins Weltall?', 1),
(9, 2, 'Welcher Planet hat die Monde Phobos und Deimos?', 1),
(10, 2, 'Wie nennt man eine Grundannahme der Relativitätstheorie?', 1),
(11, 3, 'Wie heißt die Hauptstadt von Kärnten?', 3),
(12, 3, 'Wie heißt die Hauptstadt von Burgenland?', 3),
(13, 3, 'Wie heißt die Hauptstadt von Niederösterreich?', 3),
(14, 3, 'Wie heißt die Hauptstadt von Wien?', 3),
(15, 3, 'Wie heißt die Hauptstadt von Tirol?', 3),
(16, 4, 'Was ist kein Schmuck- oder Edelstein?', 1),
(17, 4, 'Welches Metall gewinnt man nicht durch Verhüttung?', 1),
(18, 4, 'Können Diamanten verbrennen?', 1),
(19, 4, 'Was ist kein Edelmetall?', 1),
(20, 4, 'Wer entdeckte im 18. Jahrhundert den Zucker im Runkelrübensaft?', 1),
(21, 5, 'Welche Bildschirmtechnik verwendet Flüssigkristalle statt einer Bildröhre?', 1),
(22, 5, 'Für was steht das D bei DHTML?', 1),
(23, 5, 'Was ist eine Bridge?', 1),
(24, 5, 'Welche Wellen verwendet man für Bluetooth?', 1),
(25, 5, 'Welcher dieser Begriffe ist ein Betriebssystem?', 1),
(26, 6, 'Der Europatag wird am 9. Mai gefeiert. Doch auf welches Ereignis geht er zurück?', 1),
(27, 6, 'Die EU hat Rechtsvorschriften zu Roaming-Gebühren verabschiedet. Wie hoch sind die Zusatzkosten, wenn du eine Person aus einem anderen EU-Mitgliedstaat anrufen würdest?', 1),
(28, 6, 'Was ist kein Organ der EU?', 1),
(29, 6, 'Wer schlägt EU-Gesetze vor?', 1),
(30, 6, 'Welche dieser Städte beherbergt kein Organ bzw. keine Agentur der EU?', 1),
(31, 7, 'Welcher Popsänger wurde als erster von der britischen Königin geadelt?', 1),
(32, 7, 'Wer wurde siebenmal für einen Oscar nominiert, gewann aber keinen einzigen?', 1),
(33, 7, 'Wer besingt seit 40 Jahren das \"Sugar Sugar Baby\"?', 1),
(34, 7, 'Wer vertonte die \"Carmina Burana\"?', 1),
(35, 7, 'Welcher Song stammt nicht von den Dire Straits?', 1),
(36, 8, 'Lew ist die Währungseinheit von ...?', 1),
(37, 8, 'In welcher Stadt befindet sich die Spanische Treppe?', 1),
(38, 8, 'Welche Stadt liegt in Afrika?', 1),
(39, 8, 'Wie nennt man die Stadt Helsinki im Schwedischen?', 1),
(40, 8, 'Wie lautet das spanische Wort für Fluss?', 1),
(41, 9, 'Die Gro&szlig;f&uuml;rstin Anastasia war die Tochter des Zaren ...?', 1),
(42, 9, 'Seit 1959 gibt es in Frankreich die ...?', 1),
(43, 9, 'Wann schlug At-Tariq die Westgoten bei Jérez de la Frontera?', 1),
(44, 9, 'In welchem Jahr wurde in Frankreich die Todesstrafe abgeschafft?', 1),
(45, 9, 'Wann wurde Bolivien unabhängig?', 1),
(46, 10, 'Udo Jürgens heißt eigentlich Udo Jürgen ...?', 1),
(47, 10, 'Wer sang anlässlich der Fußball-WM 1978 \"Buenos dias, Argentina\"?', 1),
(48, 10, 'Welcher Fußballer mit Wiener Wurzeln fand in Tschechien seine Heimat?', 1),
(49, 10, 'Wie nennt man eine Wiener Buschenschank?', 1),
(50, 10, 'Welches Bundesland hat die kleinste Fläche?', 1),
(51, 11, 'Wie heißen die drei Grundfarben?', 1),
(52, 11, 'In welcher Einheit misst man die Induktivität einer Spule?', 1),
(53, 11, 'Wer schuf nach dem Zweiten Weltkrieg die theoretischen Grundlagen für die Wasserstoffbombe?', 1),
(54, 11, 'Wofür steht c² in der Gleichung E = m c² ?', 1),
(55, 11, 'Welches Metall ist der beste Wärmeleiter?', 1),
(56, 12, 'Wer war 2011 für das Bundesministerin für Frauenangelegenheiten zuständig?', 3),
(57, 12, 'Wer war 2011 für das Bundesministerium für Arbeit, Soziales und Konsumentenschutz zuständig?', 3),
(58, 12, 'Wer war 2011 für das Bundesministerium für Landesverteidigung zuständig?', 3),
(59, 12, 'Wer war 2011 für das Bundesministerium für Finanzen zuständig?', 3),
(60, 12, 'Wer war 2011 für das Bundesministerium für Inneres zuständig?', 3),
(61, 13, 'Was ist keine Kampfsportart?', 1),
(62, 13, 'Bis zum Jahre 2012 gab es keine Olympischen Spiele in ...?', 1),
(63, 13, 'Wie nennen sich italienische Fußballfans?', 1),
(64, 13, 'Welches Fußball-Stadion fasste die größte Zuschauerzahl aller Zeiten?', 1),
(65, 13, 'Wann und wo wurde erstmals die Olympische Flagge mit den Ringen gehisst?', 1),
(66, 14, 'Wie heißt die Währung der Türkei?', 1),
(67, 14, 'Was ist im zweiten Buch des BGB geregelt?', 1),
(68, 14, 'Wer gründete Wal-Mart?', 1),
(69, 14, 'Wie nennt man ein Frachtstück?', 1),
(70, 14, 'Wie nennt man eine Ausweitung der Wirtschaftstätigkeit?', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorien`
--

CREATE TABLE `kategorien` (
  `pk_kategorie_id` int(11) NOT NULL,
  `fk_unterkategorie_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `beschreibung` varchar(511) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kategorien`
--

INSERT INTO `kategorien` (`pk_kategorie_id`, `fk_unterkategorie_id`, `name`, `beschreibung`) VALUES
(1, NULL, 'Allgemeines', '<img src=\"../media/general.png\" alt=\"description_image\" style=\"width:20%; class=\"beschreibung\"><p class=\"beschreibung\">Wer ein breites Interessensgebiet besitzt, wird sich selten langweilen. Viele Interessen sind ein Ausdruck geistiger Beweglichkeit und eines ausgefüllten Lebens. Natürlich geht dies nur mit einem großen Allgemeinwissen. Wieviel du weißt und was du vielleicht noch über dich und viele Aspekte des Lebens lernen musst, kann dir das Quiz zeigen.</p>'),
(2, NULL, 'Astronomie', '<img src=\"../media/astronomics.png\" alt=\"description_image\" style=\"width:20%; class=\"beschreibung\"><p class=\"beschreibung\">Die Astronomie ist ein Fachgebiet, das schon seit Jahrtausenden starke Faszinationen auf die Menschen ausübt. Wie uns die Sterne wirklich beeinflussen und wo man sich Sternbilder zu Nutze macht, zeigt das Quiz. Wer dann selbst in die Sterne schauen oder eine Sternwarte besuchen möchte, ist auf jeden Fall gut vorbereitet.</p>'),
(3, NULL, 'Bundesländer & Hauptstädte Österreichs', '<img src=\"../media/austrian_states.png\" alt=\"description_image\" style=\"width:20%; class=\"beschreibung\"><p class=\"beschreibung\">Österreich ist ein relativ kleines Land mit nur wenigen Bundesländern und entsprechenden Hauptstädten der Bundesländer. Trotzdem aber sind es gerade diese Hauptstädte, die ein wahres Füllhorn an interessanten und wissenswerten Aspekten zu bieten haben. Wer dabei eigene Kenntnisse testen möchte oder ein sinnvolles Partyspiel sucht, sollte sich den Quiz ansehen.</p>'),
(4, NULL, 'Chemie', '<img src=\"../media/chemistry.png\" alt=\"description_image\" style=\"width:20%; class=\"beschreibung\"><p class=\"beschreibung\">Chemie ist heute oft in aller Munde und leider auch in jeder unmittelbaren Umgebung. Dabei ist man mehr oder weniger gezwungen, sich mit chemischen Stoffen und Substanzen zu umgeben. Was sich hinter der oft gefürchteten Chemie verbirgt und wie sie wirklich wirkt, zeigt der Chemie-Quiz in aufklärender und unterhaltsamer Weise.</p>'),
(5, NULL, 'Computer', '<img src=\"../media/computer.png\" alt=\"description_image\" style=\"width:20%; class=\"beschreibung\"><p class=\"beschreibung\">Es gibt wohl kaum einen Haushalt, der heute nicht vernetzt ist und zumindest einen Computer oder Laptop besitzt. Problematisch wird es aber immer dann, wenn die Technik nicht so will oder kann wie sie soll. Wie man sich selbst helfen kann und was man grundlegend wissen sollte verrät das Quiz.</p>'),
(6, NULL, 'EU', '<img src=\"../media/eu.png\" alt=\"description_image\" style=\"width:20%; class=\"beschreibung\"><p class=\"beschreibung\">Europas Hauptstädte sind nicht nur tolle Ziele für einen Urlaub oder einen Städtetrip, sondern eignen sich auch bestens für ein Ratespiel im Rahmen eines Spielabends mit Freunden. Wem dabei keine eigenen Fragen einfallen, der sollte vorab am Quiz teilnehmen und so auf amüsante Art sein Wissen testen und Anregungen holen.</p>'),
(7, NULL, 'Film & Musik', '<img src=\"../media/film_music.png\" alt=\"description_image\" style=\"width:20%; class=\"beschreibung\"><p class=\"beschreibung\">Gerade in der kühlen Jahreszeit steht vielen Menschen nicht nur der Sinn nach einem guten Film oder einer tollen CD, sondern auch nach den Menschen hinter den Kulissen. Wer sich dabei einfach näher mit Filmen und Musik sowie mit Stars und Sternchen beschäftigen möchte, dem sei das zugehörige Quiz empfohlen.</p>'),
(8, NULL, 'Geographie', '<img src=\"../media/geographics.png\" alt=\"description_image\" style=\"width:20%; class=\"beschreibung\"><p class=\"beschreibung\">Wer gerne reist und andere Länder kennen lernt, wird sich für Geographie interessieren. Leider ist es aber vor allem zwischen den verschiedenen Urlauben nur wenigen Menschen möglich, ihr Interesse vor Ort auszuleben. Hier kann der Geographie-Quiz ein vergnüglicher Ersatz für einen womöglich entgangenen Kurztrip sein oder den nächsten Urlaub vorbereiten.</p>'),
(9, NULL, 'Geschichte', '<img src=\"../media/history.png\" alt=\"description_image\" style=\"width:20%; class=\"beschreibung\"><p class=\"beschreibung\">Geschichte keine bloße Reihe von Jahreszahlen und Kriegsschauplätzen, sondern steckt auch in jedem von uns. Dabei muss es nicht langweilig sein, sich mit Geschichte und der mehr oder weniger eigenen Vergangenheit zu beschäftigen. Wie spannend die Historie sein kann zeigt der Quiz. Viel Spaß beim Raten und Stöbern nach Hintergründen.</p>'),
(10, NULL, 'Österreich', '<img src=\"../media/austria.png\" alt=\"description_image\" style=\"width:20%; class=\"beschreibung\"><p class=\"beschreibung\">Österreich ist ein Land, das seinen Einwohnern und Gästen viel zu bieten hat. Nicht umsonst zählt die Alpenrepublik als solche zu den beliebtesten Urlaubsländern europäischer Touristen. Wo aber liegen die Stärken und vielleicht auch Schwächen des Landes? Und was sind die beliebtesten Ziele und Highlights? Das Quiz gibt unterhaltsame Antwort.</p>'),
(11, NULL, 'Physik / Technik', '<img src=\"../media/physics_technology.png\" alt=\"description_image\" style=\"width:20%; class=\"beschreibung\"><p class=\"beschreibung\">Die Zeiten, in denen sich nur Jungen und Männer für Physik und Technik interessierten, sind längst vorbei. Immer mehr Frauen und Mädchen entdecken, wie spannend und interessant Technik sein kann. Hier bekommen beide Geschlechter die Möglichkeit, im Quiz ihr Wissen zu testen. Dabei ist der Physik-Quiz auch ein toller Partyspaß.</p>'),
(12, NULL, 'Politik', '<img src=\"../media/politics.png\" alt=\"description_image\" style=\"width:20%; class=\"beschreibung\"><p class=\"beschreibung\">Für viele Menschen ist Politik ein langweiliges Medium, mit dem man sich in der Schule und pflichtschuldig bei der Lektüre der Tageszeitungen befasst. Dabei muss Politik gar nicht immer trocken sein. Wie bunt und lebendig aktuelles Zeitgeschehen und politischer Hintergrund sein kann, soll das zugehörige Quiz auf spannende Art verdeutlichen.</p>'),
(13, NULL, 'Sport', '<img src=\"../media/sports.png\" alt=\"description_image\" style=\"width:20%; class=\"beschreibung\"><p class=\"beschreibung\">Wer selbst sportlich aktiv ist und sich für Sport begeistern kann, wird gern neue Sportarten und Sportgeräte testen. Was man weiß und was sich zu wissen lohnt, kann man nun mit dem Sportquiz herausfinden. Vielleicht erschließt sich so schon bald ein neuer Trend für den Winter oder den kommende Frühling.</p>'),
(14, NULL, 'Wirtschaft', '<img src=\"../media/economy.png\" alt=\"description_image\" style=\"width:20%; class=\"beschreibung\"><p class=\"beschreibung\">Wirtschaft hat nicht nur etwas mit Haushaltsführung zu tun, sondern ist entgegen vieler anderslautender Meinungen ein breites Band von Wissen, das durchaus auch in andere Fachbereiche übergreift. Wer sich für Wirtschaft interessiert, kann im zugehörigen Quiz seine eigenen Kenntnisse testen und vielleicht auch verborgene Interessen zu noch unbekannten Sachverhalten erkennen.</p>');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `antworten`
--
ALTER TABLE `antworten`
  ADD PRIMARY KEY (`pk_antwort_id`),
  ADD KEY `fk_fragen_id` (`fk_fragen_id`);

--
-- Indizes für die Tabelle `fragen`
--
ALTER TABLE `fragen`
  ADD PRIMARY KEY (`pk_fragen_id`),
  ADD KEY `fk_kategorie_id` (`fk_kategorie_id`);

--
-- Indizes für die Tabelle `kategorien`
--
ALTER TABLE `kategorien`
  ADD PRIMARY KEY (`pk_kategorie_id`),
  ADD KEY `fk_unterkategorie_id` (`fk_unterkategorie_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `antworten`
--
ALTER TABLE `antworten`
  MODIFY `pk_antwort_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT für Tabelle `fragen`
--
ALTER TABLE `fragen`
  MODIFY `pk_fragen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT für Tabelle `kategorien`
--
ALTER TABLE `kategorien`
  MODIFY `pk_kategorie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `antworten`
--
ALTER TABLE `antworten`
  ADD CONSTRAINT `antworten_ibfk_1` FOREIGN KEY (`fk_fragen_id`) REFERENCES `fragen` (`pk_fragen_id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `fragen`
--
ALTER TABLE `fragen`
  ADD CONSTRAINT `fragen_ibfk_1` FOREIGN KEY (`fk_kategorie_id`) REFERENCES `kategorien` (`pk_kategorie_id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `kategorien`
--
ALTER TABLE `kategorien`
  ADD CONSTRAINT `kategorien_ibfk_1` FOREIGN KEY (`fk_unterkategorie_id`) REFERENCES `kategorien` (`pk_kategorie_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
