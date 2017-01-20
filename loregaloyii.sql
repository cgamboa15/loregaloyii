/*
SQLyog Trial v12.3.3 (64 bit)
MySQL - 10.1.19-MariaDB : Database - loregaloyii
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`loregaloyii` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `loregaloyii`;

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` text NOT NULL,
  `menu_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`menu_id`,`menu`,`menu_name`) values 
(1,'{\n    \"left\": [\n        {\n            \"label\": \"Home\",\n            \"url\": \"home\"\n        },\n        {\n            \"label\": \"Contáctenos\",\n            \"url\": \"contactenos\"\n        }\n    ],\n    \"right\": []\n}',NULL),
(2,'{\n    \"left\": [],\n    \"right\": [\n        {\n            \"label\": \"Menus\",\n            \"url\": \"index.php?r=menu/creator\"\n        },\n        {\n            \"label\": \"Estados\",\n            \"url\": \"index.php?r=status\"\n        },\n        {\n            \"label\": \"Elementos de Estados\",\n            \"url\": \"index.php?r=element\"\n        },\n        {\n            \"label\": \"Usuarios\",\n            \"url\": \"index.php?r=user\"\n        }\n    ]\n}',NULL),
(3,'{\"left\":[],\"right\":[]}','Prueba');

/*Table structure for table `q5vp2_application` */

DROP TABLE IF EXISTS `q5vp2_application`;

CREATE TABLE `q5vp2_application` (
  `itemid` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `statusid` tinyint(2) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`itemid`,`userId`),
  KEY `FK_q5vp2_product_applications` (`userId`),
  KEY `statusid` (`statusid`),
  CONSTRAINT `FK_q5vp2_product_applications` FOREIGN KEY (`userId`) REFERENCES `q5vp2_user` (`id`),
  CONSTRAINT `FK_q5vp2_product_applications_prod` FOREIGN KEY (`itemid`) REFERENCES `q5vp2_item` (`id`),
  CONSTRAINT `q5vp2_application_ibfk_1` FOREIGN KEY (`statusid`) REFERENCES `q5vp2_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='En esta tabla se guardan las solicitudes de los usuarios a';

/*Data for the table `q5vp2_application` */

/*Table structure for table `q5vp2_category` */

DROP TABLE IF EXISTS `q5vp2_category`;

CREATE TABLE `q5vp2_category` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `statusid` tinyint(2) DEFAULT NULL,
  `fatherid` int(3) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` datetime DEFAULT NULL,
  `updated_by` datetime DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_status` (`statusid`),
  KEY `fatherid` (`fatherid`),
  CONSTRAINT `fk_category_status` FOREIGN KEY (`statusid`) REFERENCES `q5vp2_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `q5vp2_category` */

insert  into `q5vp2_category`(`id`,`name`,`desc`,`statusid`,`fatherid`,`created_at`,`updated_at`,`created_by`,`updated_by`,`image`) values 
(1,'Sin categoría','Sin categoría, es una categoría principal',9,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL,NULL,NULL),
(4,'Hogar','Artículos que pertenecenn a la categoría del Hogar',9,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL,NULL,NULL),
(5,'Electródomésticos','Artículos que pertenecenn a la subcategoría Electródomésticos',9,4,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL,NULL,NULL),
(6,'Calzado','Artículos de tipo calzado, zapatos, tenis, sandalias..',9,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
(7,'Cocinas','Utensilios de cocina',9,4,'0000-00-00 00:00:00','2017-01-20 11:00:59','0000-00-00 00:00:00','0000-00-00 00:00:00','');

/*Table structure for table `q5vp2_city` */

DROP TABLE IF EXISTS `q5vp2_city`;

CREATE TABLE `q5vp2_city` (
  `id` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de registro',
  `name` varchar(50) NOT NULL COMMENT 'Nombre de la ciudad',
  `provincyid` int(11) NOT NULL,
  `countryid` int(11) NOT NULL,
  `statusid` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_city` (`provincyid`),
  KEY `FK_city_state` (`statusid`),
  CONSTRAINT `FK_city` FOREIGN KEY (`provincyid`) REFERENCES `q5vp2_provincy` (`id`),
  CONSTRAINT `q5vp2_city_ibfk_1` FOREIGN KEY (`statusid`) REFERENCES `q5vp2_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1119 DEFAULT CHARSET=utf8;

/*Data for the table `q5vp2_city` */

insert  into `q5vp2_city`(`id`,`name`,`provincyid`,`countryid`,`statusid`) values 
(0,'Medellin ',5,57,9),
(2,'Abejorral ',5,57,9),
(3,'Abriaqui ',5,57,9),
(4,'Alejandria ',5,57,9),
(5,'Amaga ',5,57,9),
(6,'Amalfi ',5,57,9),
(7,'Andes ',5,57,9),
(8,'Angelopolis ',5,57,9),
(9,'Angostura ',5,57,9),
(10,'Anori ',5,57,9),
(11,'Santafe De Antioquia ',5,57,9),
(12,'Anza ',5,57,9),
(13,'Apartado ',5,57,9),
(14,'Arboletes ',5,57,9),
(15,'Argelia ',5,57,9),
(16,'Armenia ',5,57,9),
(17,'Barbosa ',5,57,9),
(18,'Belmira ',5,57,9),
(19,'Bello ',5,57,9),
(20,'Betania ',5,57,9),
(21,'Betulia ',5,57,9),
(22,'Ciudad Bolivar ',5,57,9),
(23,'Briceño ',5,57,9),
(24,'Buritica ',5,57,9),
(25,'Caceres ',5,57,9),
(26,'Caicedo ',5,57,9),
(27,'Caldas ',5,57,9),
(28,'Campamento ',5,57,9),
(29,'Cañasgordas ',5,57,9),
(30,'Caracoli ',5,57,9),
(31,'Caramanta ',5,57,9),
(32,'Carepa ',5,57,9),
(33,'El Carmen De Viboral ',5,57,9),
(34,'Carolina ',5,57,9),
(35,'Caucasia ',5,57,9),
(36,'Chigorodo ',5,57,9),
(37,'Cisneros ',5,57,9),
(38,'Cocorna ',5,57,9),
(39,'Concepcion ',5,57,9),
(40,'Concordia ',5,57,9),
(41,'Copacabana ',5,57,9),
(42,'Dabeiba ',5,57,9),
(43,'Don Matias ',5,57,9),
(44,'Ebejico ',5,57,9),
(45,'El Bagre ',5,57,9),
(46,'Entrerrios ',5,57,9),
(47,'Envigado ',5,57,9),
(48,'Fredonia ',5,57,9),
(49,'Frontino ',5,57,9),
(50,'Giraldo ',5,57,9),
(51,'Girardota ',5,57,9),
(52,'Gomez Plata ',5,57,9),
(53,'Granada ',5,57,9),
(54,'Guadalupe ',5,57,9),
(55,'Guarne ',5,57,9),
(56,'Guatape ',5,57,9),
(57,'Heliconia ',5,57,9),
(58,'Hispania ',5,57,9),
(59,'Itagüi ',5,57,9),
(60,'Ituango ',5,57,9),
(61,'Jardin ',5,57,9),
(62,'Jerico ',5,57,9),
(63,'La Ceja ',5,57,9),
(64,'La Estrella ',5,57,9),
(65,'La Pintada ',5,57,9),
(66,'La Union ',5,57,9),
(67,'Liborina ',5,57,9),
(68,'Maceo ',5,57,9),
(69,'Marinilla ',5,57,9),
(70,'Montebello ',5,57,9),
(71,'Murindo ',5,57,9),
(72,'Mutata ',5,57,9),
(73,'Nariño ',5,57,9),
(74,'Necocli ',5,57,9),
(75,'Nechi ',5,57,9),
(76,'Olaya ',5,57,9),
(77,'Peñol ',5,57,9),
(78,'Peque ',5,57,9),
(79,'Pueblorrico ',5,57,9),
(80,'Puerto Berrio ',5,57,9),
(81,'Puerto Nare ',5,57,9),
(82,'Puerto Triunfo ',5,57,9),
(83,'Remedios ',5,57,9),
(84,'Retiro ',5,57,9),
(85,'Rionegro ',5,57,9),
(86,'Sabanalarga ',5,57,9),
(87,'Sabaneta ',5,57,9),
(88,'Salgar ',5,57,9),
(89,'San Andres ',5,57,9),
(90,'San Carlos ',5,57,9),
(91,'San Francisco ',5,57,9),
(92,'San Jeronimo ',5,57,9),
(93,'San Jose De La Montaña ',5,57,9),
(94,'San Juan De Uraba ',5,57,9),
(95,'San Luis ',5,57,9),
(96,'San Pedro ',5,57,9),
(97,'San Pedro De Uraba ',5,57,9),
(98,'San Rafael ',5,57,9),
(99,'San Roque ',5,57,9),
(100,'San Vicente ',5,57,9),
(101,'Santa Barbara ',5,57,9),
(102,'Santa Rosa De Osos ',5,57,9),
(103,'Santo Domingo ',5,57,9),
(104,'El Santuario ',5,57,9),
(105,'Segovia ',5,57,9),
(106,'Sonson ',5,57,9),
(107,'Sopetran ',5,57,9),
(108,'Tamesis ',5,57,9),
(109,'Taraza ',5,57,9),
(110,'Tarso ',5,57,9),
(111,'Titiribi ',5,57,9),
(112,'Toledo ',5,57,9),
(113,'Turbo ',5,57,9),
(114,'Uramita ',5,57,9),
(115,'Urrao ',5,57,9),
(116,'Valdivia ',5,57,9),
(117,'Valparaiso ',5,57,9),
(118,'Vegachi ',5,57,9),
(119,'Venecia ',5,57,9),
(120,'Vigia Del Fuerte ',5,57,9),
(121,'Yali ',5,57,9),
(122,'Yarumal ',5,57,9),
(123,'Yolombo ',5,57,9),
(124,'Yondo ',5,57,9),
(125,'Zaragoza ',5,57,9),
(126,'Barranquilla ',8,57,9),
(127,'Baranoa ',8,57,9),
(128,'Campo De La Cruz ',8,57,9),
(129,'Candelaria ',8,57,9),
(130,'Galapa ',8,57,9),
(131,'Juan De Acosta ',8,57,9),
(132,'Luruaco ',8,57,9),
(133,'Malambo ',8,57,9),
(134,'Manati ',8,57,9),
(135,'Palmar De Varela ',8,57,9),
(136,'Piojo ',8,57,9),
(137,'Polonuevo ',8,57,9),
(138,'Ponedera ',8,57,9),
(139,'Puerto Colombia ',8,57,9),
(140,'Repelon ',8,57,9),
(141,'Sabanagrande ',8,57,9),
(142,'Sabanalarga ',8,57,9),
(143,'Santa Lucia ',8,57,9),
(144,'Santo Tomas ',8,57,9),
(145,'Soledad ',8,57,9),
(146,'Suan ',8,57,9),
(147,'Tubara ',8,57,9),
(148,'Usiacuri ',8,57,9),
(149,'Bogota',11,57,9),
(150,'Cartagena ',13,57,9),
(151,'Achi ',13,57,9),
(152,'Altos Del Rosario ',13,57,9),
(153,'Arenal ',13,57,9),
(154,'Arjona ',13,57,9),
(155,'Arroyohondo ',13,57,9),
(156,'Barranco De Loba ',13,57,9),
(157,'Calamar ',13,57,9),
(158,'Cantagallo ',13,57,9),
(159,'Cicuco ',13,57,9),
(160,'Cordoba ',13,57,9),
(161,'Clemencia ',13,57,9),
(162,'El Carmen De Bolivar ',13,57,9),
(163,'El Guamo ',13,57,9),
(164,'El Peñon ',13,57,9),
(165,'Hatillo De Loba ',13,57,9),
(166,'Magangue ',13,57,9),
(167,'Mahates ',13,57,9),
(168,'Margarita ',13,57,9),
(169,'Maria La Baja ',13,57,9),
(170,'Montecristo ',13,57,9),
(171,'Mompos ',13,57,9),
(172,'Morales ',13,57,9),
(173,'Pinillos ',13,57,9),
(174,'Regidor ',13,57,9),
(175,'Rio Viejo ',13,57,9),
(176,'San Cristobal ',13,57,9),
(177,'San Estanislao ',13,57,9),
(178,'San Fernando ',13,57,9),
(179,'San Jacinto ',13,57,9),
(180,'San Jacinto Del Cauca ',13,57,9),
(181,'San Juan Nepomuceno ',13,57,9),
(182,'San Martin De Loba ',13,57,9),
(183,'San Pablo ',13,57,9),
(184,'Santa Catalina ',13,57,9),
(185,'Santa Rosa ',13,57,9),
(186,'Santa Rosa Del Sur ',13,57,9),
(187,'Simiti ',13,57,9),
(188,'Soplaviento ',13,57,9),
(189,'Talaigua Nuevo ',13,57,9),
(190,'Tiquisio ',13,57,9),
(191,'Turbaco ',13,57,9),
(192,'Turbana ',13,57,9),
(193,'Villanueva ',13,57,9),
(194,'Zambrano ',13,57,9),
(195,'Tunja ',15,57,9),
(196,'Almeida ',15,57,9),
(197,'Aquitania ',15,57,9),
(198,'Arcabuco ',15,57,9),
(199,'Belen ',15,57,9),
(200,'Berbeo ',15,57,9),
(201,'Beteitiva ',15,57,9),
(202,'Boavita ',15,57,9),
(203,'Boyaca ',15,57,9),
(204,'Briceño ',15,57,9),
(205,'Buenavista ',15,57,9),
(206,'Busbanza ',15,57,9),
(207,'Caldas ',15,57,9),
(208,'Campohermoso ',15,57,9),
(209,'Cerinza ',15,57,9),
(210,'Chinavita ',15,57,9),
(211,'Chiquinquira ',15,57,9),
(212,'Chiscas ',15,57,9),
(213,'Chita ',15,57,9),
(214,'Chitaraque ',15,57,9),
(215,'Chivata ',15,57,9),
(216,'Cienega ',15,57,9),
(217,'Combita ',15,57,9),
(218,'Coper ',15,57,9),
(219,'Corrales ',15,57,9),
(220,'Covarachia ',15,57,9),
(221,'Cubara ',15,57,9),
(222,'Cucaita ',15,57,9),
(223,'Cuitiva ',15,57,9),
(224,'Chiquiza ',15,57,9),
(225,'Chivor ',15,57,9),
(226,'Duitama ',15,57,9),
(227,'El Cocuy ',15,57,9),
(228,'El Espino ',15,57,9),
(229,'Firavitoba ',15,57,9),
(230,'Floresta ',15,57,9),
(231,'Gachantiva ',15,57,9),
(232,'Gameza ',15,57,9),
(233,'Garagoa ',15,57,9),
(234,'Guacamayas ',15,57,9),
(235,'Guateque ',15,57,9),
(236,'Guayata ',15,57,9),
(237,'Güican ',15,57,9),
(238,'Iza ',15,57,9),
(239,'Jenesano ',15,57,9),
(240,'Jerico ',15,57,9),
(241,'Labranzagrande ',15,57,9),
(242,'La Capilla ',15,57,9),
(243,'La Victoria ',15,57,9),
(244,'La Uvita ',15,57,9),
(245,'Villa De Leyva ',15,57,9),
(246,'Macanal ',15,57,9),
(247,'Maripi ',15,57,9),
(248,'Miraflores ',15,57,9),
(249,'Mongua ',15,57,9),
(250,'Mongui ',15,57,9),
(251,'Moniquira ',15,57,9),
(252,'Motavita ',15,57,9),
(253,'Muzo ',15,57,9),
(254,'Nobsa ',15,57,9),
(255,'Nuevo Colon ',15,57,9),
(256,'Oicata ',15,57,9),
(257,'Otanche ',15,57,9),
(258,'Pachavita ',15,57,9),
(259,'Paez ',15,57,9),
(260,'Paipa ',15,57,9),
(261,'Pajarito ',15,57,9),
(262,'Panqueba ',15,57,9),
(263,'Pauna ',15,57,9),
(264,'Paya ',15,57,9),
(265,'Paz De Rio ',15,57,9),
(266,'Pesca ',15,57,9),
(267,'Pisba ',15,57,9),
(268,'Puerto Boyaca ',15,57,9),
(269,'Quipama ',15,57,9),
(270,'Ramiriqui ',15,57,9),
(271,'Raquira ',15,57,9),
(272,'Rondon ',15,57,9),
(273,'Saboya ',15,57,9),
(274,'Sachica ',15,57,9),
(275,'Samaca ',15,57,9),
(276,'San Eduardo ',15,57,9),
(277,'San Jose De Pare ',15,57,9),
(278,'San Luis De Gaceno ',15,57,9),
(279,'San Mateo ',15,57,9),
(280,'San Miguel De Sema ',15,57,9),
(281,'San Pablo De Borbur ',15,57,9),
(282,'Santana ',15,57,9),
(283,'Santa Maria ',15,57,9),
(284,'Santa Rosa De Viterbo ',15,57,9),
(285,'Santa Sofia ',15,57,9),
(286,'Sativanorte ',15,57,9),
(287,'Sativasur ',15,57,9),
(288,'Siachoque ',15,57,9),
(289,'Soata ',15,57,9),
(290,'Socota ',15,57,9),
(291,'Socha ',15,57,9),
(292,'Sogamoso ',15,57,9),
(293,'Somondoco ',15,57,9),
(294,'Sora ',15,57,9),
(295,'Sotaquira ',15,57,9),
(296,'Soraca ',15,57,9),
(297,'Susacon ',15,57,9),
(298,'Sutamarchan ',15,57,9),
(299,'Sutatenza ',15,57,9),
(300,'Tasco ',15,57,9),
(301,'Tenza ',15,57,9),
(302,'Tibana ',15,57,9),
(303,'Tibasosa ',15,57,9),
(304,'Tinjaca ',15,57,9),
(305,'Tipacoque ',15,57,9),
(306,'Toca ',15,57,9),
(307,'Togüi ',15,57,9),
(308,'Topaga ',15,57,9),
(309,'Tota ',15,57,9),
(310,'Tunungua ',15,57,9),
(311,'Turmeque ',15,57,9),
(312,'Tuta ',15,57,9),
(313,'Tutaza ',15,57,9),
(314,'Umbita ',15,57,9),
(315,'Ventaquemada ',15,57,9),
(316,'Viracacha ',15,57,9),
(317,'Zetaquira ',15,57,9),
(318,'Manizales ',17,57,9),
(319,'Aguadas ',17,57,9),
(320,'Anserma ',17,57,9),
(321,'Aranzazu ',17,57,9),
(322,'Belalcazar ',17,57,9),
(323,'Chinchina ',17,57,9),
(324,'Filadelfia ',17,57,9),
(325,'La Dorada ',17,57,9),
(326,'La Merced ',17,57,9),
(327,'Manzanares ',17,57,9),
(328,'Marmato ',17,57,9),
(329,'Marquetalia ',17,57,9),
(330,'Marulanda ',17,57,9),
(331,'Neira ',17,57,9),
(332,'Norcasia ',17,57,9),
(333,'Pacora ',17,57,9),
(334,'Palestina ',17,57,9),
(335,'Pensilvania ',17,57,9),
(336,'Riosucio ',17,57,9),
(337,'Risaralda ',17,57,9),
(338,'Salamina ',17,57,9),
(339,'Samana ',17,57,9),
(340,'San Jose ',17,57,9),
(341,'Supia ',17,57,9),
(342,'Victoria ',17,57,9),
(343,'Villamaria ',17,57,9),
(344,'Viterbo ',17,57,9),
(345,'Florencia ',18,57,9),
(346,'Albania ',18,57,9),
(347,'Belen De Los Andaquies ',18,57,9),
(348,'Cartagena Del Chaira ',18,57,9),
(349,'Curillo ',18,57,9),
(350,'El Doncello ',18,57,9),
(351,'El Paujil ',18,57,9),
(352,'La Montañita ',18,57,9),
(353,'Milan ',18,57,9),
(354,'Morelia ',18,57,9),
(355,'Puerto Rico ',18,57,9),
(356,'San Jose De La Fragua ',18,57,9),
(357,'San Vicente Del Caguan ',18,57,9),
(358,'Solano ',18,57,9),
(359,'Solita ',18,57,9),
(360,'Valparaiso ',18,57,9),
(361,'Popayan ',19,57,9),
(362,'Almaguer ',19,57,9),
(363,'Argelia ',19,57,9),
(364,'Balboa ',19,57,9),
(365,'Bolivar ',19,57,9),
(366,'Buenos Aires ',19,57,9),
(367,'Cajibio ',19,57,9),
(368,'Caldono ',19,57,9),
(369,'Caloto ',19,57,9),
(370,'Corinto ',19,57,9),
(371,'El Tambo ',19,57,9),
(372,'Florencia ',19,57,9),
(373,'Guapi ',19,57,9),
(374,'Inza ',19,57,9),
(375,'Jambalo ',19,57,9),
(376,'La Sierra ',19,57,9),
(377,'La Vega ',19,57,9),
(378,'Lopez ',19,57,9),
(379,'Mercaderes ',19,57,9),
(380,'Miranda ',19,57,9),
(381,'Morales ',19,57,9),
(382,'Padilla ',19,57,9),
(383,'Paez ',19,57,9),
(384,'Patia ',19,57,9),
(385,'Piamonte ',19,57,9),
(386,'Piendamo ',19,57,9),
(387,'Puerto Tejada ',19,57,9),
(388,'Purace ',19,57,9),
(389,'Rosas ',19,57,9),
(390,'San Sebastian ',19,57,9),
(391,'Santander De Quilichao ',19,57,9),
(392,'Santa Rosa ',19,57,9),
(393,'Silvia ',19,57,9),
(394,'Sotara ',19,57,9),
(395,'Suarez ',19,57,9),
(396,'Sucre ',19,57,9),
(397,'Timbio ',19,57,9),
(398,'Timbiqui ',19,57,9),
(399,'Toribio ',19,57,9),
(400,'Totoro ',19,57,9),
(401,'Villa Rica ',19,57,9),
(402,'Valledupar ',20,57,9),
(403,'Aguachica ',20,57,9),
(404,'Agustin Codazzi ',20,57,9),
(405,'Astrea ',20,57,9),
(406,'Becerril ',20,57,9),
(407,'Bosconia ',20,57,9),
(408,'Chimichagua ',20,57,9),
(409,'Chiriguana ',20,57,9),
(410,'Curumani ',20,57,9),
(411,'El Copey ',20,57,9),
(412,'El Paso ',20,57,9),
(413,'Gamarra ',20,57,9),
(414,'Gonzalez ',20,57,9),
(415,'La Gloria ',20,57,9),
(416,'La Jagua De Ibirico ',20,57,9),
(417,'Manaure ',20,57,9),
(418,'Pailitas ',20,57,9),
(419,'Pelaya ',20,57,9),
(420,'Pueblo Bello ',20,57,9),
(421,'Rio De Oro ',20,57,9),
(422,'La Paz ',20,57,9),
(423,'San Alberto ',20,57,9),
(424,'San Diego ',20,57,9),
(425,'San Martin ',20,57,9),
(426,'Tamalameque ',20,57,9),
(427,'Monteria ',23,57,9),
(428,'Ayapel ',23,57,9),
(429,'Buenavista ',23,57,9),
(430,'Canalete ',23,57,9),
(431,'Cerete ',23,57,9),
(432,'Chima ',23,57,9),
(433,'Chinu ',23,57,9),
(434,'Cienaga De Oro ',23,57,9),
(435,'Cotorra ',23,57,9),
(436,'La Apartada ',23,57,9),
(437,'Lorica ',23,57,9),
(438,'Los Cordobas ',23,57,9),
(439,'Momil ',23,57,9),
(440,'Montelibano ',23,57,9),
(441,'Moñitos ',23,57,9),
(442,'Planeta Rica ',23,57,9),
(443,'Pueblo Nuevo ',23,57,9),
(444,'Puerto Escondido ',23,57,9),
(445,'Puerto Libertador ',23,57,9),
(446,'Purisima ',23,57,9),
(447,'Sahagun ',23,57,9),
(448,'San Andres De Sotavento ',23,57,9),
(449,'San Antero ',23,57,9),
(450,'San Bernardo Del Viento ',23,57,9),
(451,'San Carlos ',23,57,9),
(452,'San Pelayo ',23,57,9),
(453,'Tierralta ',23,57,9),
(454,'Valencia ',23,57,9),
(455,'Agua De Dios ',25,57,9),
(456,'Alban ',25,57,9),
(457,'Anapoima ',25,57,9),
(458,'Anolaima ',25,57,9),
(459,'Arbelaez ',25,57,9),
(460,'Beltran ',25,57,9),
(461,'Bituima ',25,57,9),
(462,'Bojaca ',25,57,9),
(463,'Cabrera ',25,57,9),
(464,'Cachipay ',25,57,9),
(465,'Cajica ',25,57,9),
(466,'Caparrapi ',25,57,9),
(467,'Caqueza ',25,57,9),
(468,'Carmen De Carupa ',25,57,9),
(469,'Chaguani ',25,57,9),
(470,'Chia ',25,57,9),
(471,'Chipaque ',25,57,9),
(472,'Choachi ',25,57,9),
(473,'Choconta ',25,57,9),
(474,'Cogua ',25,57,9),
(475,'Cota ',25,57,9),
(476,'Cucunuba ',25,57,9),
(477,'El Colegio ',25,57,9),
(478,'El Peñon ',25,57,9),
(479,'El Rosal ',25,57,9),
(480,'Facatativa ',25,57,9),
(481,'Fomeque ',25,57,9),
(482,'Fosca ',25,57,9),
(483,'Funza ',25,57,9),
(484,'Fuquene ',25,57,9),
(485,'Fusagasuga ',25,57,9),
(486,'Gachala ',25,57,9),
(487,'Gachancipa ',25,57,9),
(488,'Gacheta ',25,57,9),
(489,'Gama ',25,57,9),
(490,'Girardot ',25,57,9),
(491,'Granada ',25,57,9),
(492,'Guacheta ',25,57,9),
(493,'Guaduas ',25,57,9),
(494,'Guasca ',25,57,9),
(495,'Guataqui ',25,57,9),
(496,'Guatavita ',25,57,9),
(497,'Guayabal De Siquima ',25,57,9),
(498,'Guayabetal ',25,57,9),
(499,'Gutierrez ',25,57,9),
(500,'Jerusalen ',25,57,9),
(501,'Junin ',25,57,9),
(502,'La Calera ',25,57,9),
(503,'La Mesa ',25,57,9),
(504,'La Palma ',25,57,9),
(505,'La Peña ',25,57,9),
(506,'La Vega ',25,57,9),
(507,'Lenguazaque ',25,57,9),
(508,'Macheta ',25,57,9),
(509,'Madrid ',25,57,9),
(510,'Manta ',25,57,9),
(511,'Medina ',25,57,9),
(512,'Mosquera ',25,57,9),
(513,'Nariño ',25,57,9),
(514,'Nemocon ',25,57,9),
(515,'Nilo ',25,57,9),
(516,'Nimaima ',25,57,9),
(517,'Nocaima ',25,57,9),
(518,'Venecia ',25,57,9),
(519,'Pacho ',25,57,9),
(520,'Paime ',25,57,9),
(521,'Pandi ',25,57,9),
(522,'Paratebueno ',25,57,9),
(523,'Pasca ',25,57,9),
(524,'Puerto Salgar ',25,57,9),
(525,'Puli ',25,57,9),
(526,'Quebradanegra ',25,57,9),
(527,'Quetame ',25,57,9),
(528,'Quipile ',25,57,9),
(529,'Apulo ',25,57,9),
(530,'Ricaurte ',25,57,9),
(531,'San Antonio Del Tequendama ',25,57,9),
(532,'San Bernardo ',25,57,9),
(533,'San Cayetano ',25,57,9),
(534,'San Francisco ',25,57,9),
(535,'San Juan De Rio Seco ',25,57,9),
(536,'Sasaima ',25,57,9),
(537,'Sesquile ',25,57,9),
(538,'Sibate ',25,57,9),
(539,'Silvania ',25,57,9),
(540,'Simijaca ',25,57,9),
(541,'Soacha ',25,57,9),
(542,'Sopo ',25,57,9),
(543,'Subachoque ',25,57,9),
(544,'Suesca ',25,57,9),
(545,'Supata ',25,57,9),
(546,'Susa ',25,57,9),
(547,'Sutatausa ',25,57,9),
(548,'Tabio ',25,57,9),
(549,'Tausa ',25,57,9),
(550,'Tena ',25,57,9),
(551,'Tenjo ',25,57,9),
(552,'Tibacuy ',25,57,9),
(553,'Tibirita ',25,57,9),
(554,'Tocaima ',25,57,9),
(555,'Tocancipa ',25,57,9),
(556,'Topaipi ',25,57,9),
(557,'Ubala ',25,57,9),
(558,'Ubaque ',25,57,9),
(559,'Villa De San Diego De Ubate ',25,57,9),
(560,'Une ',25,57,9),
(561,'Utica ',25,57,9),
(562,'Vergara ',25,57,9),
(563,'Viani ',25,57,9),
(564,'Villagomez ',25,57,9),
(565,'Villapinzon ',25,57,9),
(566,'Villeta ',25,57,9),
(567,'Viota ',25,57,9),
(568,'Yacopi ',25,57,9),
(569,'Zipacon ',25,57,9),
(570,'Zipaquira ',25,57,9),
(571,'Quibdo ',27,57,9),
(572,'Acandi ',27,57,9),
(573,'Alto Baudo ',27,57,9),
(574,'Atrato ',27,57,9),
(575,'Bagado ',27,57,9),
(576,'Bahia Solano ',27,57,9),
(577,'Bajo Baudo ',27,57,9),
(578,'Belen De Bajira ',27,57,9),
(579,'Bojaya ',27,57,9),
(580,'El Canton Del San Pablo ',27,57,9),
(581,'Carmen Del Darien ',27,57,9),
(582,'Certegui ',27,57,9),
(583,'Condoto ',27,57,9),
(584,'El Carmen De Atrato ',27,57,9),
(585,'El Litoral Del San Juan ',27,57,9),
(586,'Istmina ',27,57,9),
(587,'Jurado ',27,57,9),
(588,'Lloro ',27,57,9),
(589,'Medio Atrato ',27,57,9),
(590,'Medio Baudo ',27,57,9),
(591,'Medio San Juan ',27,57,9),
(592,'Novita ',27,57,9),
(593,'Nuqui ',27,57,9),
(594,'Rio Iro ',27,57,9),
(595,'Rio Quito ',27,57,9),
(596,'Riosucio ',27,57,9),
(597,'San Jose Del Palmar ',27,57,9),
(598,'Sipi ',27,57,9),
(599,'Tado ',27,57,9),
(600,'Unguia ',27,57,9),
(601,'Union Panamericana ',27,57,9),
(602,'Neiva ',41,57,9),
(603,'Acevedo ',41,57,9),
(604,'Agrado ',41,57,9),
(605,'Aipe ',41,57,9),
(606,'Algeciras ',41,57,9),
(607,'Altamira ',41,57,9),
(608,'Baraya ',41,57,9),
(609,'Campoalegre ',41,57,9),
(610,'Colombia ',41,57,9),
(611,'Elias ',41,57,9),
(612,'Garzon ',41,57,9),
(613,'Gigante ',41,57,9),
(614,'Guadalupe ',41,57,9),
(615,'Hobo ',41,57,9),
(616,'Iquira ',41,57,9),
(617,'Isnos ',41,57,9),
(618,'La Argentina ',41,57,9),
(619,'La Plata ',41,57,9),
(620,'Nataga ',41,57,9),
(621,'Oporapa ',41,57,9),
(622,'Paicol ',41,57,9),
(623,'Palermo ',41,57,9),
(624,'Palestina ',41,57,9),
(625,'Pital ',41,57,9),
(626,'Pitalito ',41,57,9),
(627,'Rivera ',41,57,9),
(628,'Saladoblanco ',41,57,9),
(629,'San Agustin ',41,57,9),
(630,'Santa Maria ',41,57,9),
(631,'Suaza ',41,57,9),
(632,'Tarqui ',41,57,9),
(633,'Tesalia ',41,57,9),
(634,'Tello ',41,57,9),
(635,'Teruel ',41,57,9),
(636,'Timana ',41,57,9),
(637,'Villavieja ',41,57,9),
(638,'Yaguara ',41,57,9),
(639,'Riohacha ',44,57,9),
(640,'Albania ',44,57,9),
(641,'Barrancas ',44,57,9),
(642,'Dibulla ',44,57,9),
(643,'Distraccion ',44,57,9),
(644,'El Molino ',44,57,9),
(645,'Fonseca ',44,57,9),
(646,'Hatonuevo ',44,57,9),
(647,'La Jagua Del Pilar ',44,57,9),
(648,'Maicao ',44,57,9),
(649,'Manaure ',44,57,9),
(650,'San Juan Del Cesar ',44,57,9),
(651,'Uribia ',44,57,9),
(652,'Urumita ',44,57,9),
(653,'Villanueva ',44,57,9),
(654,'Santa Marta ',47,57,9),
(655,'Algarrobo ',47,57,9),
(656,'Aracataca ',47,57,9),
(657,'Ariguani ',47,57,9),
(658,'Cerro San Antonio ',47,57,9),
(659,'Chivolo ',47,57,9),
(660,'Cienaga ',47,57,9),
(661,'Concordia ',47,57,9),
(662,'El Banco ',47,57,9),
(663,'El Piñon ',47,57,9),
(664,'El Reten ',47,57,9),
(665,'Fundacion ',47,57,9),
(666,'Guamal ',47,57,9),
(667,'Nueva Granada ',47,57,9),
(668,'Pedraza ',47,57,9),
(669,'Pijiño Del Carmen ',47,57,9),
(670,'Pivijay ',47,57,9),
(671,'Plato ',47,57,9),
(672,'Puebloviejo ',47,57,9),
(673,'Remolino ',47,57,9),
(674,'Sabanas De San Angel ',47,57,9),
(675,'Salamina ',47,57,9),
(676,'San Sebastian De Buenavista ',47,57,9),
(677,'San Zenon ',47,57,9),
(678,'Santa Ana ',47,57,9),
(679,'Santa Barbara De Pinto ',47,57,9),
(680,'Sitionuevo ',47,57,9),
(681,'Tenerife ',47,57,9),
(682,'Zapayan ',47,57,9),
(683,'Zona Bananera ',47,57,9),
(684,'Villavicencio ',50,57,9),
(685,'Acacias ',50,57,9),
(686,'Barranca De Upia ',50,57,9),
(687,'Cabuyaro ',50,57,9),
(688,'Castilla La Nueva ',50,57,9),
(689,'Cubarral ',50,57,9),
(690,'Cumaral ',50,57,9),
(691,'El Calvario ',50,57,9),
(692,'El Castillo ',50,57,9),
(693,'El Dorado ',50,57,9),
(694,'Fuente De Oro ',50,57,9),
(695,'Granada ',50,57,9),
(696,'Guamal ',50,57,9),
(697,'Mapiripan ',50,57,9),
(698,'Mesetas ',50,57,9),
(699,'La Macarena ',50,57,9),
(700,'Uribe ',50,57,9),
(701,'Lejanias ',50,57,9),
(702,'Puerto Concordia ',50,57,9),
(703,'Puerto Gaitan ',50,57,9),
(704,'Puerto Lopez ',50,57,9),
(705,'Puerto Lleras ',50,57,9),
(706,'Puerto Rico ',50,57,9),
(707,'Restrepo ',50,57,9),
(708,'San Carlos De Guaroa ',50,57,9),
(709,'San Juan De Arama ',50,57,9),
(710,'San Juanito ',50,57,9),
(711,'San Martin ',50,57,9),
(712,'Vista Hermosa ',50,57,9),
(713,'Pasto ',52,57,9),
(714,'Alban ',52,57,9),
(715,'Aldana ',52,57,9),
(716,'Ancuya ',52,57,9),
(717,'Arboleda ',52,57,9),
(718,'Barbacoas ',52,57,9),
(719,'Belen ',52,57,9),
(720,'Buesaco ',52,57,9),
(721,'Colon ',52,57,9),
(722,'Consaca ',52,57,9),
(723,'Contadero ',52,57,9),
(724,'Cordoba ',52,57,9),
(725,'Cuaspud ',52,57,9),
(726,'Cumbal ',52,57,9),
(727,'Cumbitara ',52,57,9),
(728,'Chachagüi ',52,57,9),
(729,'El Charco ',52,57,9),
(730,'El Peñol ',52,57,9),
(731,'El Rosario ',52,57,9),
(732,'El Tablon De Gomez ',52,57,9),
(733,'El Tambo ',52,57,9),
(734,'Funes ',52,57,9),
(735,'Guachucal ',52,57,9),
(736,'Guaitarilla ',52,57,9),
(737,'Gualmatan ',52,57,9),
(738,'Iles ',52,57,9),
(739,'Imues ',52,57,9),
(740,'Ipiales ',52,57,9),
(741,'La Cruz ',52,57,9),
(742,'La Florida ',52,57,9),
(743,'La Llanada ',52,57,9),
(744,'La Tola ',52,57,9),
(745,'La Union ',52,57,9),
(746,'Leiva ',52,57,9),
(747,'Linares ',52,57,9),
(748,'Los Andes ',52,57,9),
(749,'Magüi ',52,57,9),
(750,'Mallama ',52,57,9),
(751,'Mosquera ',52,57,9),
(752,'Nariño ',52,57,9),
(753,'Olaya Herrera ',52,57,9),
(754,'Ospina ',52,57,9),
(755,'Francisco Pizarro ',52,57,9),
(756,'Policarpa ',52,57,9),
(757,'Potosi ',52,57,9),
(758,'Providencia ',52,57,9),
(759,'Puerres ',52,57,9),
(760,'Pupiales ',52,57,9),
(761,'Ricaurte ',52,57,9),
(762,'Roberto Payan ',52,57,9),
(763,'Samaniego ',52,57,9),
(764,'Sandona ',52,57,9),
(765,'San Bernardo ',52,57,9),
(766,'San Lorenzo ',52,57,9),
(767,'San Pablo ',52,57,9),
(768,'San Pedro De Cartago ',52,57,9),
(769,'Santa Barbara ',52,57,9),
(770,'Santacruz ',52,57,9),
(771,'Sapuyes ',52,57,9),
(772,'Taminango ',52,57,9),
(773,'Tangua ',52,57,9),
(774,'Tumaco ',52,57,9),
(775,'Tuquerres ',52,57,9),
(776,'Yacuanquer ',52,57,9),
(777,'Cucuta ',54,57,9),
(778,'Abrego ',54,57,9),
(779,'Arboledas ',54,57,9),
(780,'Bochalema ',54,57,9),
(781,'Bucarasica ',54,57,9),
(782,'Cacota ',54,57,9),
(783,'Cachira ',54,57,9),
(784,'Chinacota ',54,57,9),
(785,'Chitaga ',54,57,9),
(786,'Convencion ',54,57,9),
(787,'Cucutilla ',54,57,9),
(788,'Durania ',54,57,9),
(789,'El Carmen ',54,57,9),
(790,'El Tarra ',54,57,9),
(791,'El Zulia ',54,57,9),
(792,'Gramalote ',54,57,9),
(793,'Hacari ',54,57,9),
(794,'Herran ',54,57,9),
(795,'Labateca ',54,57,9),
(796,'La Esperanza ',54,57,9),
(797,'La Playa ',54,57,9),
(798,'Los Patios ',54,57,9),
(799,'Lourdes ',54,57,9),
(800,'Mutiscua ',54,57,9),
(801,'Ocaña ',54,57,9),
(802,'Pamplona ',54,57,9),
(803,'Pamplonita ',54,57,9),
(804,'Puerto Santander ',54,57,9),
(805,'Ragonvalia ',54,57,9),
(806,'Salazar ',54,57,9),
(807,'San Calixto ',54,57,9),
(808,'San Cayetano ',54,57,9),
(809,'Santiago ',54,57,9),
(810,'Sardinata ',54,57,9),
(811,'Silos ',54,57,9),
(812,'Teorama ',54,57,9),
(813,'Tibu ',54,57,9),
(814,'Toledo ',54,57,9),
(815,'Villa Caro ',54,57,9),
(816,'Villa Del Rosario ',54,57,9),
(817,'Armenia ',63,57,9),
(818,'Buenavista ',63,57,9),
(819,'Calarca ',63,57,9),
(820,'Circasia ',63,57,9),
(821,'Cordoba ',63,57,9),
(822,'Filandia ',63,57,9),
(823,'Genova ',63,57,9),
(824,'La Tebaida ',63,57,9),
(825,'Montenegro ',63,57,9),
(826,'Pijao ',63,57,9),
(827,'Quimbaya ',63,57,9),
(828,'Salento ',63,57,9),
(829,'Pereira ',66,57,9),
(830,'Apia ',66,57,9),
(831,'Balboa ',66,57,9),
(832,'Belen De Umbria ',66,57,9),
(833,'Dosquebradas ',66,57,9),
(834,'Guatica ',66,57,9),
(835,'La Celia ',66,57,9),
(836,'La Virginia ',66,57,9),
(837,'Marsella ',66,57,9),
(838,'Mistrato ',66,57,9),
(839,'Pueblo Rico ',66,57,9),
(840,'Quinchia ',66,57,9),
(841,'Santa Rosa De Cabal ',66,57,9),
(842,'Santuario ',66,57,9),
(843,'Bucaramanga ',68,57,9),
(844,'Aguada ',68,57,9),
(845,'Albania ',68,57,9),
(846,'Aratoca ',68,57,9),
(847,'Barbosa ',68,57,9),
(848,'Barichara ',68,57,9),
(849,'Barrancabermeja ',68,57,9),
(850,'Betulia ',68,57,9),
(851,'Bolivar ',68,57,9),
(852,'Cabrera ',68,57,9),
(853,'California ',68,57,9),
(854,'Capitanejo ',68,57,9),
(855,'Carcasi ',68,57,9),
(856,'Cepita ',68,57,9),
(857,'Cerrito ',68,57,9),
(858,'Charala ',68,57,9),
(859,'Charta ',68,57,9),
(860,'Chima ',68,57,9),
(861,'Chipata ',68,57,9),
(862,'Cimitarra ',68,57,9),
(863,'Concepcion ',68,57,9),
(864,'Confines ',68,57,9),
(865,'Contratacion ',68,57,9),
(866,'Coromoro ',68,57,9),
(867,'Curiti ',68,57,9),
(868,'El Carmen De Chucuri ',68,57,9),
(869,'El Guacamayo ',68,57,9),
(870,'El Peñon ',68,57,9),
(871,'El Playon ',68,57,9),
(872,'Encino ',68,57,9),
(873,'Enciso ',68,57,9),
(874,'Florian ',68,57,9),
(875,'Floridablanca ',68,57,9),
(876,'Galan ',68,57,9),
(877,'Gambita ',68,57,9),
(878,'Giron ',68,57,9),
(879,'Guaca ',68,57,9),
(880,'Guadalupe ',68,57,9),
(881,'Guapota ',68,57,9),
(882,'Guavata ',68,57,9),
(883,'Güepsa ',68,57,9),
(884,'Hato ',68,57,9),
(885,'Jesus Maria ',68,57,9),
(886,'Jordan ',68,57,9),
(887,'La Belleza ',68,57,9),
(888,'Landazuri ',68,57,9),
(889,'La Paz ',68,57,9),
(890,'Lebrija ',68,57,9),
(891,'Los Santos ',68,57,9),
(892,'Macaravita ',68,57,9),
(893,'Malaga ',68,57,9),
(894,'Matanza ',68,57,9),
(895,'Mogotes ',68,57,9),
(896,'Molagavita ',68,57,9),
(897,'Ocamonte ',68,57,9),
(898,'Oiba ',68,57,9),
(899,'Onzaga ',68,57,9),
(900,'Palmar ',68,57,9),
(901,'Palmas Del Socorro ',68,57,9),
(902,'Paramo ',68,57,9),
(903,'Piedecuesta ',68,57,9),
(904,'Pinchote ',68,57,9),
(905,'Puente Nacional ',68,57,9),
(906,'Puerto Parra ',68,57,9),
(907,'Puerto Wilches ',68,57,9),
(908,'Rionegro ',68,57,9),
(909,'Sabana De Torres ',68,57,9),
(910,'San Andres ',68,57,9),
(911,'San Benito ',68,57,9),
(912,'San Gil ',68,57,9),
(913,'San Joaquin ',68,57,9),
(914,'San Jose De Miranda ',68,57,9),
(915,'San Miguel ',68,57,9),
(916,'San Vicente De Chucuri ',68,57,9),
(917,'Santa Barbara ',68,57,9),
(918,'Santa Helena Del Opon ',68,57,9),
(919,'Simacota ',68,57,9),
(920,'Socorro ',68,57,9),
(921,'Suaita ',68,57,9),
(922,'Sucre ',68,57,9),
(923,'Surata ',68,57,9),
(924,'Tona ',68,57,9),
(925,'Valle De San Jose ',68,57,9),
(926,'Velez ',68,57,9),
(927,'Vetas ',68,57,9),
(928,'Villanueva ',68,57,9),
(929,'Zapatoca ',68,57,9),
(930,'Sincelejo ',70,57,9),
(931,'Buenavista ',70,57,9),
(932,'Caimito ',70,57,9),
(933,'Coloso ',70,57,9),
(934,'Corozal ',70,57,9),
(935,'Chalan ',70,57,9),
(936,'El Roble ',70,57,9),
(937,'Galeras ',70,57,9),
(938,'Guaranda ',70,57,9),
(939,'La Union ',70,57,9),
(940,'Los Palmitos ',70,57,9),
(941,'Majagual ',70,57,9),
(942,'Morroa ',70,57,9),
(943,'Ovejas ',70,57,9),
(944,'Palmito ',70,57,9),
(945,'Sampues ',70,57,9),
(946,'San Benito Abad ',70,57,9),
(947,'San Juan De Betulia ',70,57,9),
(948,'San Marcos ',70,57,9),
(949,'San Onofre ',70,57,9),
(950,'San Pedro ',70,57,9),
(951,'Since ',70,57,9),
(952,'Sucre ',70,57,9),
(953,'Santiago De Tolu ',70,57,9),
(954,'Toluviejo ',70,57,9),
(955,'Ibague Tolima',73,57,9),
(956,'',73,57,9),
(957,'Alvarado Tolima',73,57,9),
(958,'Ambalema Tolima',73,57,9),
(959,'Anzoategui Tolima',73,57,9),
(960,'Armero Tolima',73,57,9),
(961,'Ataco Tolima',73,57,9),
(962,'Cajamarca Tolima',73,57,9),
(963,'Carmen De Apicala Tolima',73,57,9),
(964,'Casabianca Tolima',73,57,9),
(965,'Chaparral Tolima',73,57,9),
(966,'Coello Tolima',73,57,9),
(967,'Coyaima Tolima',73,57,9),
(968,'Cunday Tolima',73,57,9),
(969,'Dolores Tolima',73,57,9),
(970,'Espinal Tolima',73,57,9),
(971,'Falan Tolima',73,57,9),
(972,'Flandes Tolima',73,57,9),
(973,'Fresno Tolima',73,57,9),
(974,'Guamo Tolima',73,57,9),
(975,'Herveo Tolima',73,57,9),
(976,'Honda Tolima',73,57,9),
(977,'Icononzo Tolima',73,57,9),
(978,'Lerida Tolima',73,57,9),
(979,'Libano Tolima',73,57,9),
(980,'Mariquita Tolima',73,57,9),
(981,'Melgar Tolima',73,57,9),
(982,'Murillo Tolima',73,57,9),
(983,'Natagaima Tolima',73,57,9),
(984,'Ortega Tolima',73,57,9),
(985,'Palocabildo Tolima',73,57,9),
(986,'Piedras Tolima',73,57,9),
(987,'Planadas Tolima',73,57,9),
(988,'Prado Tolima',73,57,9),
(989,'Purificacion Tolima',73,57,9),
(990,'Rioblanco Tolima',73,57,9),
(991,'Roncesvalles Tolima',73,57,9),
(992,'Rovira Tolima',73,57,9),
(993,'Saldaña Tolima',73,57,9),
(994,'San Antonio Tolima',73,57,9),
(995,'San Luis Tolima',73,57,9),
(996,'Santa Isabel Tolima',73,57,9),
(997,'Suarez Tolima',73,57,9),
(998,'Valle De San Juan Tolima',73,57,9),
(999,'Venadillo Tolima',73,57,9),
(1000,'Villahermosa Tolima',73,57,9),
(1001,'Villarrica Tolima',73,57,9),
(1002,'Cali ',76,57,9),
(1003,'Alcala ',76,57,9),
(1004,'Andalucia ',76,57,9),
(1005,'Ansermanuevo ',76,57,9),
(1006,'Argelia ',76,57,9),
(1007,'Bolivar ',76,57,9),
(1008,'Buenaventura ',76,57,9),
(1009,'Guadalajara De Buga ',76,57,9),
(1010,'Bugalagrande ',76,57,9),
(1011,'Caicedonia ',76,57,9),
(1012,'Calima ',76,57,9),
(1013,'Candelaria ',76,57,9),
(1014,'Cartago ',76,57,9),
(1015,'Dagua ',76,57,9),
(1016,'El Aguila ',76,57,9),
(1017,'El Cairo ',76,57,9),
(1018,'El Cerrito ',76,57,9),
(1019,'El Dovio ',76,57,9),
(1020,'Florida ',76,57,9),
(1021,'Ginebra ',76,57,9),
(1022,'Guacari ',76,57,9),
(1023,'Jamundi ',76,57,9),
(1024,'La Cumbre ',76,57,9),
(1025,'La Union ',76,57,9),
(1026,'La Victoria ',76,57,9),
(1027,'Obando ',76,57,9),
(1028,'Palmira ',76,57,9),
(1029,'Pradera ',76,57,9),
(1030,'Restrepo ',76,57,9),
(1031,'Riofrio ',76,57,9),
(1032,'Roldanillo ',76,57,9),
(1033,'San Pedro ',76,57,9),
(1034,'Sevilla ',76,57,9),
(1035,'Toro ',76,57,9),
(1036,'Trujillo ',76,57,9),
(1037,'Tulua ',76,57,9),
(1038,'Ulloa ',76,57,9),
(1039,'Versalles ',76,57,9),
(1040,'Vijes ',76,57,9),
(1041,'Yotoco ',76,57,9),
(1042,'Yumbo ',76,57,9),
(1043,'Zarzal ',76,57,9),
(1044,'Arauca ',81,57,9),
(1045,'Arauquita ',81,57,9),
(1046,'Cravo Norte ',81,57,9),
(1047,'Fortul ',81,57,9),
(1048,'Puerto Rondon ',81,57,9),
(1049,'Saravena ',81,57,9),
(1050,'Tame ',81,57,9),
(1051,'Yopal ',85,57,9),
(1052,'Aguazul ',85,57,9),
(1053,'Chameza ',85,57,9),
(1054,'Hato Corozal ',85,57,9),
(1055,'La Salina ',85,57,9),
(1056,'Mani ',85,57,9),
(1057,'Monterrey ',85,57,9),
(1058,'Nunchia ',85,57,9),
(1059,'Orocue ',85,57,9),
(1060,'Paz De Ariporo ',85,57,9),
(1061,'Pore ',85,57,9),
(1062,'Recetor ',85,57,9),
(1063,'Sabanalarga ',85,57,9),
(1064,'Sacama ',85,57,9),
(1065,'San Luis De Palenque ',85,57,9),
(1066,'Tamara ',85,57,9),
(1067,'Tauramena ',85,57,9),
(1068,'Trinidad ',85,57,9),
(1069,'Villanueva ',85,57,9),
(1070,'Mocoa ',86,57,9),
(1071,'Colon ',86,57,9),
(1072,'Orito ',86,57,9),
(1073,'Puerto Asis ',86,57,9),
(1074,'Puerto Caicedo ',86,57,9),
(1075,'Puerto Guzman ',86,57,9),
(1076,'Leguizamo ',86,57,9),
(1077,'Sibundoy ',86,57,9),
(1078,'San Francisco ',86,57,9),
(1079,'San Miguel ',86,57,9),
(1080,'Santiago ',86,57,9),
(1081,'Valle Del Guamuez ',86,57,9),
(1082,'Villagarzon ',86,57,9),
(1083,'San Andres 1 ',88,57,9),
(1084,'Providencia ',88,57,9),
(1085,'Leticia ',91,57,9),
(1086,'El Encanto ',91,57,9),
(1087,'La Chorrera ',91,57,9),
(1088,'La Pedrera ',91,57,9),
(1089,'La Victoria ',91,57,9),
(1090,'Miriti - Parana ',91,57,9),
(1091,'Puerto Alegria ',91,57,9),
(1092,'Puerto Arica ',91,57,9),
(1093,'Puerto Nariño ',91,57,9),
(1094,'Puerto Santander ',91,57,9),
(1095,'Tarapaca ',91,57,9),
(1096,'Inirida ',94,57,9),
(1097,'Barranco Minas ',94,57,9),
(1098,'Mapiripana ',94,57,9),
(1099,'San Felipe ',94,57,9),
(1100,'Puerto Colombia ',94,57,9),
(1101,'La Guadalupe ',94,57,9),
(1102,'Cacahual ',94,57,9),
(1103,'Pana Pana ',94,57,9),
(1104,'Morichal ',94,57,9),
(1105,'San Jose Del Guaviare ',95,57,9),
(1106,'Calamar ',95,57,9),
(1107,'El Retorno ',95,57,9),
(1108,'Miraflores ',95,57,9),
(1109,'Mitu ',97,57,9),
(1110,'Caruru ',97,57,9),
(1111,'Pacoa ',97,57,9),
(1112,'Taraira ',97,57,9),
(1113,'Papunaua ',97,57,9),
(1114,'Yavarate ',97,57,9),
(1115,'Puerto Carreño ',99,57,9),
(1116,'La Primavera ',99,57,9),
(1117,'Santa Rosalia ',99,57,9),
(1118,'Cumaribo ',99,57,9);

/*Table structure for table `q5vp2_element` */

DROP TABLE IF EXISTS `q5vp2_element`;

CREATE TABLE `q5vp2_element` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` char(50) DEFAULT NULL,
  `statusid` tinyint(2) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_element_status` (`statusid`),
  CONSTRAINT `fk_element_status` FOREIGN KEY (`statusid`) REFERENCES `q5vp2_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `q5vp2_element` */

insert  into `q5vp2_element`(`id`,`name`,`statusid`,`desc`) values 
(1,'Target',9,'Objetivos o targets de los item: Niños.. niñas...'),
(2,'Records',9,'Estados de los registros de BD'),
(3,'Applications',9,'se aplican a estados de solicitud hechas a un item o producto'),
(4,'Item',9,'se asocian a caracterisitcas de un item');

/*Table structure for table `q5vp2_feature` */

DROP TABLE IF EXISTS `q5vp2_feature`;

CREATE TABLE `q5vp2_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) DEFAULT NULL,
  `featurename` varchar(20) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `value` tinyint(2) DEFAULT NULL,
  `statusid` smallint(4) DEFAULT NULL,
  `date` datetime DEFAULT NULL COMMENT 'peso en libras',
  PRIMARY KEY (`id`),
  KEY `FK_q5vp2_items_features` (`itemid`),
  CONSTRAINT `FK_q5vp2_items_features` FOREIGN KEY (`itemid`) REFERENCES `q5vp2_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `q5vp2_feature` */

/*Table structure for table `q5vp2_image` */

DROP TABLE IF EXISTS `q5vp2_image`;

CREATE TABLE `q5vp2_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `statusid` tinyint(2) NOT NULL,
  `creationdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_q5vp2_product_images` (`productid`),
  KEY `FK_q5vp2_product_images_status` (`statusid`),
  CONSTRAINT `FK_q5vp2_product_images` FOREIGN KEY (`productid`) REFERENCES `q5vp2_item` (`id`),
  CONSTRAINT `FK_q5vp2_product_images_status` FOREIGN KEY (`statusid`) REFERENCES `q5vp2_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `q5vp2_image` */

/*Table structure for table `q5vp2_item` */

DROP TABLE IF EXISTS `q5vp2_item`;

CREATE TABLE `q5vp2_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `statusid` smallint(4) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `cityId` int(11) DEFAULT NULL,
  `provincyId` int(11) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `usedtime` tinyint(2) DEFAULT NULL,
  `visits` tinyint(3) DEFAULT NULL,
  `featured` enum('0','1') DEFAULT NULL,
  `color` tinyint(4) DEFAULT NULL,
  `size` char(20) DEFAULT NULL,
  `height` char(20) DEFAULT NULL,
  `weight` char(1) DEFAULT NULL,
  `targetId` tinyint(4) DEFAULT NULL,
  `itemstatus` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_q5vp2_products` (`userId`),
  KEY `FK_q5vp2_products_city` (`cityId`),
  KEY `FK_q5vp2_products_provincy` (`provincyId`),
  KEY `FK_q5vp2_products_cat` (`categoryId`),
  KEY `FK_q5vp2_products_target` (`targetId`),
  KEY `FK_q5vp2_products_usedtime` (`usedtime`),
  CONSTRAINT `FK_q5vp2_products` FOREIGN KEY (`userId`) REFERENCES `q5vp2_user` (`id`),
  CONSTRAINT `FK_q5vp2_products_cat` FOREIGN KEY (`categoryId`) REFERENCES `q5vp2_category` (`id`),
  CONSTRAINT `FK_q5vp2_products_city` FOREIGN KEY (`cityId`) REFERENCES `q5vp2_city` (`id`),
  CONSTRAINT `FK_q5vp2_products_provincy` FOREIGN KEY (`provincyId`) REFERENCES `q5vp2_provincy` (`id`),
  CONSTRAINT `FK_q5vp2_products_target` FOREIGN KEY (`targetId`) REFERENCES `q5vp2_target` (`id`),
  CONSTRAINT `FK_q5vp2_products_usedtime` FOREIGN KEY (`usedtime`) REFERENCES `q5vp2_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `q5vp2_item` */

/*Table structure for table `q5vp2_itemcolor` */

DROP TABLE IF EXISTS `q5vp2_itemcolor`;

CREATE TABLE `q5vp2_itemcolor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `q5vp2_itemcolor` */

insert  into `q5vp2_itemcolor`(`id`,`name`,`status`) values 
(1,'Blanco','1'),
(2,'Negro','1'),
(3,'Azul','1'),
(4,'Rosado','1'),
(5,'Amarillo','1'),
(6,'Tonos Oscuros','1'),
(7,'Tonos Claros','1'),
(8,'Verde','1'),
(9,'Varios Colores','1');

/*Table structure for table `q5vp2_migration` */

DROP TABLE IF EXISTS `q5vp2_migration`;

CREATE TABLE `q5vp2_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `q5vp2_migration` */

insert  into `q5vp2_migration`(`version`,`apply_time`) values 
('m000000_000000_base',1484170941),
('m151216_173850_create_menu_table',1484170944),
('m170101_000000_create_menu_table',1484931773),
('m170101_000001_humanized_menu_name',1484931775);

/*Table structure for table `q5vp2_provincy` */

DROP TABLE IF EXISTS `q5vp2_provincy`;

CREATE TABLE `q5vp2_provincy` (
  `id` int(1) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de registro',
  `name` varchar(30) DEFAULT NULL COMMENT 'Nombre del departamento',
  `countryid` int(11) DEFAULT NULL,
  `statusid` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_provincy` (`countryid`),
  KEY `FK_provincy_state` (`statusid`),
  CONSTRAINT `q5vp2_provincy_ibfk_1` FOREIGN KEY (`statusid`) REFERENCES `q5vp2_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table `q5vp2_provincy` */

insert  into `q5vp2_provincy`(`id`,`name`,`countryid`,`statusid`) values 
(5,'Antioquia',57,9),
(8,'Atlántico',57,9),
(11,'DISTRITO CAPITAL Bogota D. C.',57,9),
(13,'Bolivar',57,9),
(15,'Boyacá',57,9),
(17,'Caldas',57,9),
(18,'Caquetá',57,9),
(19,'Cauca',57,9),
(20,'César',57,9),
(23,'Córdoba',57,9),
(25,'Cundinamarca',57,9),
(27,'Chocó',57,9),
(41,'Huila',57,9),
(44,'La Guajira',57,9),
(47,'Magdalena',57,9),
(50,'Meta',57,9),
(52,'Nariño',57,9),
(54,'Norte de Santander',57,9),
(63,'Quindio',57,9),
(66,'Risaralda',57,9),
(68,'Santander',57,9),
(70,'Sucre',57,9),
(73,'ALPUJARRA Tolima',57,9),
(76,'Valle del Cauca',57,9),
(81,'Arauca',57,9),
(85,'Casanare',57,9),
(86,'Putumayo',57,9),
(88,'Departamento Archipielago de S',57,9),
(91,'Amazonas',57,9),
(94,'Guainia',57,9),
(95,'Guaviare',57,9),
(97,'Vaupe',57,9),
(99,'Vichada',57,9),
(100,'Jelou',57,9);

/*Table structure for table `q5vp2_status` */

DROP TABLE IF EXISTS `q5vp2_status`;

CREATE TABLE `q5vp2_status` (
  `id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL,
  `elementId` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_q5vp2_product_status_info` (`elementId`),
  CONSTRAINT `FK_q5vp2_product_status_info` FOREIGN KEY (`elementId`) REFERENCES `q5vp2_element` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `q5vp2_status` */

insert  into `q5vp2_status`(`id`,`name`,`status`,`elementId`) values 
(1,'Usado','1',4),
(2,'Nuevo','1',4),
(3,'Semi-usado','1',4),
(4,'Niño','0',1),
(5,'Niña','1',1),
(6,'Hombre','1',1),
(7,'Mujer','1',1),
(8,'Bebés','1',1),
(9,'Activa','1',2),
(10,'Inactiva','1',2),
(11,'Aceptada','1',3),
(12,'Rechazada','1',3),
(13,'Enviada','1',3);

/*Table structure for table `q5vp2_target` */

DROP TABLE IF EXISTS `q5vp2_target`;

CREATE TABLE `q5vp2_target` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` char(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `q5vp2_target` */

insert  into `q5vp2_target`(`id`,`name`,`status`) values 
(1,'Niño',1),
(2,'Niña',1),
(3,'Hombre',1),
(4,'Mujer',1),
(5,'Bebés',1),
(6,'Mascotas',1),
(7,'Fundación',1);

/*Table structure for table `q5vp2_user` */

DROP TABLE IF EXISTS `q5vp2_user`;

CREATE TABLE `q5vp2_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cityid` int(2) DEFAULT NULL,
  `genre` enum('M','F') COLLATE utf8_unicode_ci DEFAULT NULL,
  `typeid` smallint(2) DEFAULT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `statusid` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `sendmail` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`),
  KEY `statusid` (`statusid`),
  KEY `cityid` (`cityid`),
  KEY `sendmail` (`sendmail`),
  CONSTRAINT `q5vp2_user_ibfk_1` FOREIGN KEY (`statusid`) REFERENCES `q5vp2_status` (`id`),
  CONSTRAINT `q5vp2_user_ibfk_2` FOREIGN KEY (`cityid`) REFERENCES `q5vp2_city` (`id`),
  CONSTRAINT `q5vp2_user_ibfk_3` FOREIGN KEY (`sendmail`) REFERENCES `q5vp2_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `q5vp2_user` */

insert  into `q5vp2_user`(`id`,`username`,`phone`,`cityid`,`genre`,`typeid`,`auth_key`,`password_hash`,`password_reset_token`,`email`,`statusid`,`created_at`,`updated_at`,`sendmail`) values 
(2,'cgamboa','3012530504',149,'M',NULL,'LM2DgAyqhlC4ZOwRwaVXN_bMgD511NUQ','$2y$13$Iyu/.yRxIpeVtIifGP80CerwwOlPpVJcg7e0A2wSjOv9O2IddYaNu','MKYwqjGK1tIURw7kR3v0nIlyZp26mCHQ_1484598793','carlosgamboa15@hotmail.com',9,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
(3,'pacopaco','123456',149,'M',1,'','',NULL,'paco@gmail.com',9,'2017-01-20 11:15:34','2017-01-20 11:23:19',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
