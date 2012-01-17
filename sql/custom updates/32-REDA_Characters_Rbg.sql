SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `character_battleground_rating`
-- ----------------------------
DROP TABLE IF EXISTS `character_battleground_rating`;
CREATE TABLE `character_battleground_rating` (
  `guid` int(11) NOT NULL,
  `rating` int(10) DEFAULT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of character_battleground_rating
-- ----------------------------