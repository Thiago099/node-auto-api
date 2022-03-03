CREATE DATABASE test;
USE test;
CREATE TABLE `test` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`test` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `subtest` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`id_test` INT(11) NULL DEFAULT NULL,
	`descricao` VARCHAR(64) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `FK__test` (`id_test`) USING BTREE,
	CONSTRAINT `FK__test` FOREIGN KEY (`id_test`) REFERENCES `test`.`test` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT INTO `test` (`id`, `test`) VALUES (1, 'test');
INSERT INTO `subtest` (`id`, `id_test`, `descricao`) VALUES (1, 1, 'test');