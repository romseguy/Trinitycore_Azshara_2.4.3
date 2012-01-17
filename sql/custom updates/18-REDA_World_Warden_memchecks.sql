SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `warden_data_result`
-- ----------------------------
DROP TABLE IF EXISTS `warden_data_result`;
CREATE TABLE `warden_data_result` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `check` int(3) DEFAULT NULL,
  `data` tinytext,
  `str` tinytext,
  `address` int(8) DEFAULT NULL,
  `length` int(2) DEFAULT NULL,
  `result` tinytext,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warden_data_result
-- ----------------------------
INSERT INTO `warden_data_result` VALUES ('1000', '243', '', '', '4840352', '2', '558B', 'lua protection');
INSERT INTO `warden_data_result` VALUES ('1001', '243', '', '', '8979979', '5', 'E04D62503F', 'Hyper speed');
INSERT INTO `warden_data_result` VALUES ('1002', '243', '', '', '9208923', '5', 'C0854A3340', 'gravity');
INSERT INTO `warden_data_result` VALUES ('1003', '243', '', '', '8100062', '2', '7541', 'air jump');