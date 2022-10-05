-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.4.22-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dump della struttura del database rubrica
CREATE DATABASE IF NOT EXISTS `rubrica` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `rubrica`;

-- Dump della struttura di tabella rubrica.contatto
CREATE TABLE IF NOT EXISTS `contatto` (
  `id_contatto` int(11) DEFAULT NULL,
  `nome` text DEFAULT NULL,
  `cognome` text DEFAULT NULL,
  `data_creazione` date DEFAULT NULL,
  `eta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella rubrica.contatto: ~5 rows (circa)
/*!40000 ALTER TABLE `contatto` DISABLE KEYS */;
INSERT INTO `contatto` (`id_contatto`, `nome`, `cognome`, `data_creazione`, `eta`) VALUES
	(1, 'Mario', 'Bianchi', '1995-10-15', 50),
	(2, 'Andrea', 'Verdi', '2003-04-05', 35),
	(3, 'Luigi', 'Rossi', '2013-02-25', 25),
	(4, 'Anna', 'Esposito', '2020-01-28', 37),
	(5, 'Simona', 'Parisi', '2018-04-28', 41);
/*!40000 ALTER TABLE `contatto` ENABLE KEYS */;

-- Dump della struttura di vista rubrica.over35
-- Creazione di una tabella temporanea per risolvere gli errori di dipendenza della vista
CREATE TABLE `over35` (
	`id_contatto` INT(11) NULL,
	`nome` TEXT(65535) NULL COLLATE 'utf8mb4_general_ci',
	`cognome` TEXT(65535) NULL COLLATE 'utf8mb4_general_ci',
	`data_creazione` DATE NULL,
	`eta` INT(11) NULL
) ENGINE=MyISAM;

-- Dump della struttura di tabella rubrica.recapito
CREATE TABLE IF NOT EXISTS `recapito` (
  `id_recapito` int(11) DEFAULT NULL,
  `id_contatto` int(11) DEFAULT NULL,
  `tipo_recapito` text DEFAULT NULL,
  `recapito` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella rubrica.recapito: ~7 rows (circa)
/*!40000 ALTER TABLE `recapito` DISABLE KEYS */;
INSERT INTO `recapito` (`id_recapito`, `id_contatto`, `tipo_recapito`, `recapito`) VALUES
	(1, 1, 'cellulare', '334323255'),
	(2, 1, 'e-mail', 'mario.bianchi.51@mb.com'),
	(3, 2, 'e-mail PEC', 'andrea.v@pec.av.it'),
	(4, 3, 'e-mail PEC', 'l.rossi.41@pec.lr.it'),
	(5, 3, 'cellulare', '3387657980'),
	(6, 3, 'e-mail', 'l.rossi@lr.it'),
	(7, 4, 'skype', 'espositoanna80');
/*!40000 ALTER TABLE `recapito` ENABLE KEYS */;

-- Dump della struttura di vista rubrica.over35
-- Rimozione temporanea di tabella e creazione della struttura finale della vista
DROP TABLE IF EXISTS `over35`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `over35` AS select * from rubrica.contatto where eta >= 35 ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
