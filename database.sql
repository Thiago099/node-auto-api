
CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `subtest` (
  `id` int(11) NOT NULL,
  `id_test` int(11) DEFAULT NULL,
  `descricao` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__test` (`id_test`),
  CONSTRAINT `FK__test` FOREIGN KEY (`id_test`) REFERENCES `test` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;
