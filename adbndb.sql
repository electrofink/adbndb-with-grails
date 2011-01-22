-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 19. Januar 2011 um 02:47
-- Server Version: 5.1.41
-- PHP-Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `adbndb`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `confession`
--

CREATE TABLE IF NOT EXISTS `confession` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `confession_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `confession`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `location`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `name`
--

CREATE TABLE IF NOT EXISTS `name` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `other` varchar(255) DEFAULT NULL,
  `person_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK337A8B4275D656` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `name`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `bio` longtext,
  `date_of_birth` datetime DEFAULT NULL,
  `date_of_death` datetime DEFAULT NULL,
  `gender` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `person`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person_confessions`
--

CREATE TABLE IF NOT EXISTS `person_confessions` (
  `person_id` bigint(20) NOT NULL,
  `confession_id` bigint(20) NOT NULL,
  PRIMARY KEY (`person_id`,`confession_id`),
  KEY `FK2CC20AE24275D656` (`person_id`),
  KEY `FK2CC20AE2A3FEB316` (`confession_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `person_confessions`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person_locations`
--

CREATE TABLE IF NOT EXISTS `person_locations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `end_date` datetime DEFAULT NULL,
  `location_id` bigint(20) NOT NULL,
  `person_id` bigint(20) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8D3286F44275D656` (`person_id`),
  KEY `FK8D3286F4D8DBB56` (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `person_locations`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person_works`
--

CREATE TABLE IF NOT EXISTS `person_works` (
  `person_id` bigint(20) NOT NULL,
  `work_id` bigint(20) NOT NULL,
  PRIMARY KEY (`person_id`,`work_id`),
  KEY `FKEDD286184275D656` (`person_id`),
  KEY `FKEDD286183B806BD6` (`work_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `person_works`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `relation`
--

CREATE TABLE IF NOT EXISTS `relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `direct_relation` bit(1) NOT NULL,
  `person_id` bigint(20) NOT NULL,
  `related_person_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDEF3F9FC974D7342` (`related_person_id`),
  KEY `FKDEF3F9FC4275D656` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `relation`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `work`
--

CREATE TABLE IF NOT EXISTS `work` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `release_date` date DEFAULT NULL,
  `subtitle` varchar(255) NOT NULL,
  `work_title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `work`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
