/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `db_livraria` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `db_livraria`;

CREATE TABLE IF NOT EXISTS `tb_categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  `data_cadastro` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tb_categorias` (`id`, `nome`, `ativo`, `data_cadastro`) VALUES
	(1, 'Drama', b'1', '2022-08-21 18:43:51'),
	(2, 'Ficção', b'1', '2022-08-21 18:44:01'),
	(3, 'Romance', b'1', '2022-08-21 18:44:11'),
	(4, 'Terror', b'1', '2022-08-21 18:44:31'),
	(5, 'Suspense', b'1', '2022-08-21 18:44:44'),
	(6, 'Aventura', b'1', '2022-08-21 18:44:51'),
	(7, 'Ação', b'1', '2022-08-21 18:44:55'),
	(8, 'Fantasia', b'1', '2022-08-21 18:45:07'),
	(9, 'infantil', b'1', '2022-08-21 18:45:10');

CREATE TABLE IF NOT EXISTS `tb_livros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_categorias` int(11) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `autor` varchar(30) NOT NULL,
  `valor` float(7,2) NOT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  `data_cadastro` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_tb_livros_tb_categorias` (`id_categorias`),
  CONSTRAINT `FK_tb_livros_tb_categorias` FOREIGN KEY (`id_categorias`) REFERENCES `tb_categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tb_livros` (`id`, `id_categorias`, `titulo`, `autor`, `valor`, `ativo`, `data_cadastro`) VALUES
	(1, 1, ' Senhor dos Aneis ', ' Tolkien ', 90.00, b'1', '2022-06-23 23:17:55'),
	(2, 2, ' Game of Thrones ', ' Martin ', 200.00, b'1', '2022-06-23 23:18:25');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
