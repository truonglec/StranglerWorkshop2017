CREATE TABLE `fest_classes` (
  `id`      SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`    VARCHAR(255)         NOT NULL DEFAULT ''
  COMMENT 'Name of PHP class logging',
  `created` TIMESTAMP            NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `fest_events` (
  `id`      SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`    VARCHAR(255)         NOT NULL DEFAULT ''
  COMMENT 'Name of event being logged',
  `created` TIMESTAMP            NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `fest_functions` (
  `id`      SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`    VARCHAR(255)         NOT NULL DEFAULT ''
  COMMENT 'Name of PHP function/method logging',
  `created` TIMESTAMP            NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `fest_instances` (
  `id`             BIGINT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  `archive_month`  TINYINT(3) UNSIGNED  NOT NULL DEFAULT '1'
  COMMENT 'Partition',
  `fest_server_id` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
  `instance_code`  CHAR(22)             NOT NULL DEFAULT '',
  `instance_begin` TIMESTAMP            NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created`        TIMESTAMP            NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `archive_month`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  /*!50100 PARTITION BY LIST (archive_month)
(PARTITION p01 VALUES IN (1)
  ENGINE = InnoDB,
PARTITION p02 VALUES IN (2)
  ENGINE = InnoDB,
PARTITION p03 VALUES IN (3)
  ENGINE = InnoDB,
PARTITION p04 VALUES IN (4)
  ENGINE = InnoDB,
PARTITION p05 VALUES IN (5)
  ENGINE = InnoDB,
PARTITION p06 VALUES IN (6)
  ENGINE = InnoDB,
PARTITION p07 VALUES IN (7)
  ENGINE = InnoDB,
PARTITION p08 VALUES IN (8)
  ENGINE = InnoDB,
PARTITION p09 VALUES IN (9)
  ENGINE = InnoDB,
PARTITION p10 VALUES IN (10)
  ENGINE = InnoDB,
PARTITION p11 VALUES IN (11)
  ENGINE = InnoDB,
PARTITION p12 VALUES IN (12)
  ENGINE = InnoDB) */;

CREATE TABLE `fest_logs` (
  `id`               BIGINT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
  `archive_month`    TINYINT(3) UNSIGNED  NOT NULL DEFAULT '1'
  COMMENT 'Partition',
  `fest_instance_id` BIGINT(20) UNSIGNED  NOT NULL DEFAULT '0',
  `fest_class_id`    SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
  `fest_function_id` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
  `fest_event_id`    SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
  `event_time`       TIMESTAMP            NOT NULL DEFAULT '0000-00-00 00:00:00',
  `detail`           VARCHAR(255)         NOT NULL DEFAULT '',
  `created`          TIMESTAMP            NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `archive_month`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  /*!50100 PARTITION BY LIST (archive_month)
(PARTITION p01 VALUES IN (1)
  ENGINE = InnoDB,
PARTITION p02 VALUES IN (2)
  ENGINE = InnoDB,
PARTITION p03 VALUES IN (3)
  ENGINE = InnoDB,
PARTITION p04 VALUES IN (4)
  ENGINE = InnoDB,
PARTITION p05 VALUES IN (5)
  ENGINE = InnoDB,
PARTITION p06 VALUES IN (6)
  ENGINE = InnoDB,
PARTITION p07 VALUES IN (7)
  ENGINE = InnoDB,
PARTITION p08 VALUES IN (8)
  ENGINE = InnoDB,
PARTITION p09 VALUES IN (9)
  ENGINE = InnoDB,
PARTITION p10 VALUES IN (10)
  ENGINE = InnoDB,
PARTITION p11 VALUES IN (11)
  ENGINE = InnoDB,
PARTITION p12 VALUES IN (12)
  ENGINE = InnoDB) */;

CREATE TABLE `fest_servers` (
  `id`      SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`    VARCHAR(255)         NOT NULL DEFAULT ''
  COMMENT 'Name of host running producer',
  `created` TIMESTAMP            NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;