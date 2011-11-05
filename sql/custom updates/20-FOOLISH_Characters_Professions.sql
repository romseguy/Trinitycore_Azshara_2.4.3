ALTER TABLE `characters` ADD COLUMN `nextProfessionReset` INT(10) UNSIGNED DEFAULT 0 NOT NULL AFTER `latency`;
